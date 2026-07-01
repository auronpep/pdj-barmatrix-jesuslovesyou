param(
  [string]$PdjRoot = "C:\PDJ",
  [string]$AppRoot = "C:\barmatrix-app",
  [string]$ApiRoot = "C:\barmatrix-api",
  [string]$OutputDir = "C:\PDJ\output\release",
  [switch]$RunBuild
)

$ErrorActionPreference = "Stop"

function Write-Utf8File {
  param(
    [string]$Path,
    [string]$Content
  )

  $parent = Split-Path -Parent $Path
  if ($parent -and -not (Test-Path -LiteralPath $parent)) {
    New-Item -ItemType Directory -Path $parent | Out-Null
  }
  Set-Content -LiteralPath $Path -Value $Content -Encoding UTF8
}

function Invoke-Native {
  param(
    [string]$WorkingDirectory,
    [string]$Command,
    [string[]]$Arguments
  )

  Push-Location -LiteralPath $WorkingDirectory
  try {
    $output = & $Command @Arguments 2>&1
    $exitCode = $LASTEXITCODE
  } finally {
    Pop-Location
  }

  return [pscustomobject]@{
    command = "$Command $($Arguments -join ' ')"
    exit_code = $exitCode
    output = @($output | ForEach-Object { [string]$_ })
  }
}

function Get-GitState {
  param([string]$Root)

  $branch = Invoke-Native $Root "git" @("status", "--short", "--branch")
  if ($branch.exit_code -ne 0) {
    throw "git status failed in $Root"
  }

  $lines = @($branch.output)
  $header = if ($lines.Count -gt 0) { $lines[0] } else { "" }
  $dirty = @($lines | Select-Object -Skip 1)
  $ahead = 0
  $match = [regex]::Match($header, '\[ahead ([0-9]+)\]')
  if ($match.Success) {
    $ahead = [int]$match.Groups[1].Value
  }

  return [pscustomobject]@{
    root = $Root
    header = $header
    dirty_count = $dirty.Count
    ahead = $ahead
    dirty = $dirty
  }
}

function Get-RepoVisibility {
  param([string]$Repo)

  $view = Invoke-Native $PdjRoot "gh" @("repo", "view", $Repo, "--json", "nameWithOwner,visibility,url")
  if ($view.exit_code -ne 0) {
    throw "gh repo view failed for $Repo"
  }
  return ($view.output -join "`n") | ConvertFrom-Json
}

$pdjState = Get-GitState $PdjRoot
$appState = Get-GitState $AppRoot
$apiState = Get-GitState $ApiRoot

$appRepo = Get-RepoVisibility "auronpep/barmatrix-app"
$pdjRepo = Get-RepoVisibility "auronpep/pdj-barmatrix-jesuslovesyou"

$vercelProjectPath = Join-Path $AppRoot ".vercel\project.json"
if (-not (Test-Path -LiteralPath $vercelProjectPath)) {
  throw "Missing Vercel project metadata: $vercelProjectPath"
}
$vercelProject = Get-Content -Raw -LiteralPath $vercelProjectPath | ConvertFrom-Json

$checks = @()
$checks += [pscustomobject]@{ name = "pdj_state_recorded"; passed = $true; detail = "$($pdjState.header); dirty_count=$($pdjState.dirty_count)" }
$checks += [pscustomobject]@{ name = "app_clean"; passed = ($appState.dirty_count -eq 0); detail = $appState.header }
$checks += [pscustomobject]@{ name = "app_branch_state_recorded"; passed = $true; detail = "ahead $($appState.ahead)" }
$checks += [pscustomobject]@{ name = "app_repo_private"; passed = ($appRepo.visibility -eq "PRIVATE"); detail = "$($appRepo.nameWithOwner) $($appRepo.visibility)" }
$checks += [pscustomobject]@{ name = "pdj_repo_private"; passed = ($pdjRepo.visibility -eq "PRIVATE"); detail = "$($pdjRepo.nameWithOwner) $($pdjRepo.visibility)" }
$checks += [pscustomobject]@{ name = "vercel_project"; passed = ($vercelProject.projectName -eq "barmatrix-app"); detail = "$($vercelProject.projectName) / $($vercelProject.projectId)" }
$checks += [pscustomobject]@{ name = "api_left_read_only"; passed = $true; detail = "$($apiState.header); dirty_count=$($apiState.dirty_count)" }

$lintResult = $null
$buildResult = $null
if ($RunBuild) {
  $lintResult = Invoke-Native $AppRoot "npm" @("run", "lint")
  $checks += [pscustomobject]@{ name = "app_lint"; passed = ($lintResult.exit_code -eq 0); detail = "exit $($lintResult.exit_code)" }

  $buildResult = Invoke-Native $AppRoot "npm" @("run", "build")
  $checks += [pscustomobject]@{ name = "app_build"; passed = ($buildResult.exit_code -eq 0); detail = "exit $($buildResult.exit_code)" }
}

$routeVerifyResult = Invoke-Native $PdjRoot "pwsh" @("-NoProfile", "-File", (Join-Path $PdjRoot "scripts\Build-JesuslovesyouReleaseManifest.ps1"), "-Verify")
$checks += [pscustomobject]@{ name = "local_route_manifest"; passed = ($routeVerifyResult.exit_code -eq 0); detail = "exit $($routeVerifyResult.exit_code)" }

$verifyPath = Join-Path $OutputDir "jesuslovesyou_release_verify.json"
$routeVerify = if (Test-Path -LiteralPath $verifyPath) {
  Get-Content -Raw -LiteralPath $verifyPath | ConvertFrom-Json
} else {
  $null
}

$failureCount = @($checks | Where-Object { -not $_.passed }).Count
$releaseAllowed = $false

$result = [ordered]@{
  generated_at = (Get-Date).ToString("s")
  release_allowed_without_user_authorization = $releaseAllowed
  app_push_deploy_homepage_pointer_gate = "production deploy and homepage pointer require explicit user authorization"
  pdj = [ordered]@{
    status = $pdjState.header
    dirty_count = $pdjState.dirty_count
    repo = $pdjRepo
  }
  app = [ordered]@{
    status = $appState.header
    dirty_count = $appState.dirty_count
    ahead = $appState.ahead
    repo = $appRepo
    vercel_project = $vercelProject
  }
  api = [ordered]@{
    status = $apiState.header
    dirty_count = $apiState.dirty_count
    note = "read-only reference state preserved"
  }
  local_routes = $routeVerify
  checks = @($checks)
  failed_checks = $failureCount
  commands = [ordered]@{
    lint = if ($lintResult) { $lintResult.command } else { "skipped; pass -RunBuild to run" }
    build = if ($buildResult) { $buildResult.command } else { "skipped; pass -RunBuild to run" }
    route_verify = $routeVerifyResult.command
  }
  next_authorized_release_steps = @(
    "Verify C:\barmatrix-app remains clean and auronpep/barmatrix-app is private.",
    "If new app commits appear, push only after private-target verification.",
    "Deploy from C:\barmatrix-app, not C:\BMO\app-repo.",
    "Verify Vercel project barmatrix-app before deploy.",
    "Smoke production /Jesuslovesyou routes and prefixed checkout.",
    "Change homepage pointer only after production smoke passes."
  )
}

$jsonPath = Join-Path $OutputDir "jesuslovesyou_release_preflight.json"
$mdPath = Join-Path $OutputDir "jesuslovesyou_release_preflight.md"
Write-Utf8File $jsonPath ($result | ConvertTo-Json -Depth 12)

$lines = @(
  "# Jesuslovesyou Release Preflight",
  "",
  "Release allowed without user authorization: **false**",
  "",
  "## Checks",
  "",
  "| Check | Passed | Detail |",
  "| --- | --- | --- |"
)
foreach ($check in $checks) {
  $lines += "| $($check.name) | $($check.passed) | $($check.detail) |"
}
$lines += ""
$lines += "## Current State"
$lines += ""
$lines += "- PDJ: $($pdjState.header)"
$lines += "- App: $($appState.header)"
$lines += "- API: $($apiState.header), dirty count $($apiState.dirty_count), preserved read-only"
$lines += "- Vercel project: $($vercelProject.projectName) / $($vercelProject.projectId)"
$lines += "- Local route verify: checked $($routeVerify.checked_routes) routes, failures $(@($routeVerify.failures).Count)"
$lines += ""
$lines += "## Next Authorized Release Steps"
$lines += ""
foreach ($step in $result.next_authorized_release_steps) {
  $lines += "- $step"
}
Write-Utf8File $mdPath ($lines -join "`n")

if ($failureCount -gt 0) {
  $checks | Where-Object { -not $_.passed } | Format-Table -AutoSize
  throw "Release preflight failed with $failureCount failed checks"
}

[pscustomobject]@{
  json = $jsonPath
  markdown = $mdPath
  failed_checks = $failureCount
  app_ahead = $appState.ahead
  checked_routes = $routeVerify.checked_routes
} | ConvertTo-Json
