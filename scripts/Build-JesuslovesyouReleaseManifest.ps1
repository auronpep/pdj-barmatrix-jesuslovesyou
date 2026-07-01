param(
  [string]$OutputDir = "C:\PDJ\output\release",
  [string]$AppRoot = "C:\barmatrix-app",
  [string]$BaseUrl = "http://127.0.0.1:3001",
  [switch]$Verify
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

function Get-AppSnapshot {
  $snapshotScript = Join-Path $PSScriptRoot "Export-FirstGroupSnapshot.ts"
  if (-not (Test-Path -LiteralPath $snapshotScript)) {
    throw "Missing snapshot script: $snapshotScript"
  }

  Push-Location -LiteralPath $AppRoot
  try {
    $json = & npx tsx $snapshotScript
    if ($LASTEXITCODE -ne 0) {
      throw "npx tsx snapshot failed with exit code $LASTEXITCODE"
    }
  } finally {
    Pop-Location
  }

  return $json | ConvertFrom-Json -Depth 100
}

function New-Route {
  param(
    [string]$Path,
    [string]$Kind,
    [bool]$Sitemap = $true,
    [string]$ExpectedText = ""
  )

  return [pscustomobject]@{
    path = $Path
    kind = $Kind
    sitemap = $Sitemap
    expected_text = $ExpectedText
  }
}

$snapshot = Get-AppSnapshot
$prefix = "/Jesuslovesyou"
$evidencePilot = $snapshot.pilots[0]
$conLawPilot = $snapshot.pilots[1]
$routes = New-Object System.Collections.Generic.List[object]

$routes.Add((New-Route $prefix "front_door" $true "Build the new BarMatrix factory beside the live site."))
$routes.Add((New-Route "$prefix/artifacts" "artifact_hub" $true "JESUSLOVESYOU ARTIFACTS"))
$routes.Add((New-Route "$prefix/checkout" "checkout" $false ""))
$routes.Add((New-Route "$prefix/checkout/success" "checkout_success" $false ""))

$routes.Add((New-Route "$prefix/evidence-pilot-01" "pilot" $true "EVIDENCE-PILOT-01"))
$routes.Add((New-Route "$prefix/evidence-pilot-01/qa-report" "qa_report" $true "QA Counts"))
$routes.Add((New-Route "$prefix/evidence-pilot-01/seeds" "seed_index" $true "SEED"))
foreach ($code in $evidencePilot.codes) {
  $routes.Add((New-Route "$prefix/evidence-pilot-01/$($code.code)" "outline_node" $true $code.code))
}
foreach ($detail in $snapshot.evidence.details) {
  $routes.Add((New-Route "$prefix/evidence-pilot-01/seeds/$($detail.questionId)" "case_study" $true $detail.title))
}

$routes.Add((New-Route "$prefix/conlaw-pilot-01" "pilot" $true "CONLAW-PILOT-01"))
$routes.Add((New-Route "$prefix/conlaw-pilot-01/qa-report" "qa_report" $true "QA Counts"))
$routes.Add((New-Route "$prefix/conlaw-pilot-01/seeds" "seed_index" $true "SEED"))
foreach ($code in $conLawPilot.codes) {
  $routes.Add((New-Route "$prefix/conlaw-pilot-01/$($code.code)" "outline_node" $true $code.code))
}
foreach ($detail in $snapshot.conlaw.details) {
  $routes.Add((New-Route "$prefix/conlaw-pilot-01/seeds/$($detail.questionId)" "case_study" $true $detail.title))
}

$sitemapRouteCount = 0
$nonSitemapRouteCount = 0
foreach ($route in $routes) {
  if ($route.sitemap) {
    $sitemapRouteCount += 1
  } else {
    $nonSitemapRouteCount += 1
  }
}

$counts = [ordered]@{
  routes_total = [int]$routes.Count
  sitemap_routes = [int]$sitemapRouteCount
  checkout_routes_not_in_sitemap = [int]$nonSitemapRouteCount
  evidence_case_studies = [int]@($snapshot.evidence.details).Count
  conlaw_case_studies = [int]@($snapshot.conlaw.details).Count
  evidence_outline_nodes = [int]@($evidencePilot.codes).Count
  conlaw_outline_nodes = [int]@($conLawPilot.codes).Count
  reusable_keys = [int]($snapshot.evidence.summary.reusableKeys + $snapshot.conlaw.summary.reusableKeys)
  leadme_steps = [int]($snapshot.evidence.summary.leadMeSteps + $snapshot.conlaw.summary.leadMeSteps)
  drill_seeds = [int]($snapshot.evidence.summary.drillSeeds + $snapshot.conlaw.summary.drillSeeds)
  answer_flow_steps = [int]($snapshot.evidence.summary.answerFlowSteps + $snapshot.conlaw.summary.answerFlowSteps)
}

$hardGates = @(
    "Push C:\barmatrix-app only after explicit release authorization.",
    "Deploy from real path C:\barmatrix-app, not the C:\BMO junction.",
    "Verify Vercel project identity before deploy.",
    "Smoke production /Jesuslovesyou routes before changing the homepage pointer.",
    "Preserve prefixed checkout attribution and auth behavior."
)

$routeArray = @()
foreach ($route in $routes) {
  $routeArray += [ordered]@{
    path = $route.path
    kind = $route.kind
    sitemap = [bool]$route.sitemap
    expected_text = $route.expected_text
  }
}

$manifest = [ordered]@{
  generated_at = (Get-Date).ToString("s")
  route_prefix = $prefix
  app_root = $AppRoot
  release_state = "local_verified_release_candidate"
  hard_gates = $hardGates
  counts = $counts
  routes = $routeArray
}

$jsonPath = Join-Path $OutputDir "jesuslovesyou_release_manifest.json"
$mdPath = Join-Path $OutputDir "jesuslovesyou_release_manifest.md"
Write-Utf8File $jsonPath ($manifest | ConvertTo-Json -Depth 12)

$lines = @(
  "# Jesuslovesyou Release Manifest",
  "",
  "Route prefix: $prefix",
  "",
  "## Counts",
  "",
  "- Total local candidate routes: $($counts.routes_total)",
  "- Sitemap-indexed routes: $($counts.sitemap_routes)",
  "- Checkout routes not in sitemap: $($counts.checkout_routes_not_in_sitemap)",
  "- Evidence case studies: $($counts.evidence_case_studies)",
  "- Con Law case studies: $($counts.conlaw_case_studies)",
  "- Outline nodes: $($counts.evidence_outline_nodes + $counts.conlaw_outline_nodes)",
  "- Reusable keys: $($counts.reusable_keys)",
  "- LeadMe steps: $($counts.leadme_steps)",
  "- Drill seeds: $($counts.drill_seeds)",
  "- Answer-flow steps: $($counts.answer_flow_steps)",
  "",
  "## Hard Gates",
  ""
)
foreach ($gate in $hardGates) {
  $lines += "- $gate"
}
$lines += ""
$lines += "## Routes"
$lines += ""
$lines += "| Path | Kind | Sitemap |"
$lines += "| --- | --- | --- |"
foreach ($route in $routes) {
  $lines += "| $($route.path) | $($route.kind) | $($route.sitemap) |"
}
Write-Utf8File $mdPath ($lines -join "`n")

if ($Verify) {
  $failures = New-Object System.Collections.Generic.List[object]
  $sitemap = Invoke-WebRequest -UseBasicParsing -Uri "$BaseUrl/sitemap.xml"

  foreach ($route in $routes) {
    $url = "$BaseUrl$($route.path)"
    try {
      $response = Invoke-WebRequest -UseBasicParsing -Uri $url
      if ([int]$response.StatusCode -ne 200) {
        $failures.Add([pscustomobject]@{ path = $route.path; reason = "status $($response.StatusCode)" })
      }
      if ($route.expected_text -and $response.Content -notlike "*$($route.expected_text)*") {
        $failures.Add([pscustomobject]@{ path = $route.path; reason = "missing expected text" })
      }
      if ($route.sitemap) {
        $expectedUrl = "https://barmatrix.app$($route.path)"
        if ($sitemap.Content -notlike "*$expectedUrl*") {
          $failures.Add([pscustomobject]@{ path = $route.path; reason = "missing sitemap entry" })
        }
      }
    } catch {
      $failures.Add([pscustomobject]@{ path = $route.path; reason = $_.Exception.Message })
    }
  }

  $failureArray = @()
  foreach ($failure in $failures) {
    $failureArray += [ordered]@{
      path = $failure.path
      reason = $failure.reason
    }
  }

  $verifyResult = [ordered]@{
    base_url = $BaseUrl
    checked_routes = $routes.Count
    checked_sitemap_routes = $sitemapRouteCount
    failures = $failureArray
  }
  $verifyPath = Join-Path $OutputDir "jesuslovesyou_release_verify.json"
  Write-Utf8File $verifyPath ($verifyResult | ConvertTo-Json -Depth 8)

  if ($failureArray.Count -gt 0) {
    $failures | Format-Table -AutoSize
    throw "Release manifest verification failed with $($failureArray.Count) failures"
  }
}

[pscustomobject]@{
  manifest = $jsonPath
  markdown = $mdPath
  routes_total = $counts.routes_total
  sitemap_routes = $counts.sitemap_routes
} | ConvertTo-Json
