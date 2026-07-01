param(
  [string]$OutputDir = "C:\PDJ\output\evidence-pilot-01",
  [switch]$Verify
)

$ErrorActionPreference = "Stop"

$codes = @(
  "33040203",
  "31010406",
  "31010503",
  "31010107",
  "32020302",
  "32020404",
  "33040301",
  "33040302",
  "35030304",
  "31010407"
)

$sources = @(
  @{ Name = "foc_qbank"; Path = "C:\FOC\Workspace\QBank"; Glob = "*.md" },
  @{ Name = "foc_finished"; Path = "C:\FOC\Workspace\Finished"; Glob = "CQ*.md" },
  @{ Name = "ccg_finished"; Path = "C:\CCG\Finished"; Glob = "CQ*.md" }
)

function First-Match {
  param(
    [string]$Text,
    [string[]]$Patterns
  )

  foreach ($pattern in $Patterns) {
    $match = [regex]::Match($Text, $pattern, "IgnoreCase, Multiline")
    if ($match.Success) {
      return $match.Groups[1].Value.Trim().Trim('"')
    }
  }

  return $null
}

function Get-QuestionId {
  param(
    [string]$Text,
    [string]$Path
  )

  $fromText = First-Match $Text @(
    '^\s*BARMATRIX Q#:\s*([0-9A-Za-z_-]+)\s*$',
    '^\s*transformed_from:\s*"?([0-9A-Za-z_-]+)"?\s*$',
    '^\s*qid:\s*"?([0-9A-Za-z_-]+)"?\s*$',
    '"question_id"\s*:\s*"([^"]+)"'
  )
  if ($fromText) {
    return $fromText
  }

  return [IO.Path]::GetFileNameWithoutExtension($Path) -replace '^CQ', ''
}

function Get-InventoryRows {
  $rows = New-Object System.Collections.Generic.List[object]

  foreach ($source in $sources) {
    if (-not (Test-Path -LiteralPath $source.Path)) {
      continue
    }

    $files = Get-ChildItem -LiteralPath $source.Path -Filter $source.Glob -File
    foreach ($file in $files) {
      $text = Get-Content -LiteralPath $file.FullName -Raw
      $outlineCode = First-Match $text @(
        '^\s*Outline_code:\s*"?([0-9]{8})"?\s*$',
        '^\s*outline_code:\s*"?([0-9]{8})"?\s*$'
      )

      if (-not $outlineCode -or $codes -notcontains $outlineCode) {
        continue
      }

      $rows.Add([pscustomobject]@{
        source = $source.Name
        question_id = Get-QuestionId $text $file.FullName
        outline_code = $outlineCode
        subject = First-Match $text @('^\s*MBE Subjects.*?:\s*(.+?)\s*$', '^\s*subject:\s*"?(.+?)"?\s*$')
        subtopic = First-Match $text @('^\s*Subtopic:\s*(.+?)\s*$', '^\s*subtopic:\s*"?(.+?)"?\s*$')
        key = First-Match $text @('^\s*Correct Answer:\s*([A-D])\s*$', '^\s*key:\s*"?([A-D])"?\s*$')
        path = $file.FullName
      })
    }
  }

  return $rows
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$rows = @(Get-InventoryRows)
$finishedIds = @(
  $rows |
    Where-Object { $_.source -like "*finished" } |
    ForEach-Object { $_.question_id }
) | Sort-Object -Unique

foreach ($row in $rows) {
  $status = if ($row.source -like "*finished") { "transformed_exact_code" } else { "in_scope_exact_code" }
  $hasFinishedTransform = $finishedIds -contains $row.question_id

  $row | Add-Member -NotePropertyName pilot_question_status -NotePropertyValue $status -Force
  $row | Add-Member -NotePropertyName has_finished_transform -NotePropertyValue $hasFinishedTransform -Force
}

$summary = foreach ($source in $sources.Name) {
  foreach ($code in $codes) {
    [pscustomobject]@{
      source = $source
      outline_code = $code
      count = @($rows | Where-Object { $_.source -eq $source -and $_.outline_code -eq $code }).Count
    }
  }
}

$jsonPath = Join-Path $OutputDir "evidence_pilot_01_inventory.json"
$csvPath = Join-Path $OutputDir "evidence_pilot_01_inventory.csv"
$summaryPath = Join-Path $OutputDir "evidence_pilot_01_inventory_summary.md"

$rows |
  Sort-Object outline_code, source, question_id |
  ConvertTo-Json -Depth 4 |
  Set-Content -LiteralPath $jsonPath -Encoding utf8

$rows |
  Sort-Object outline_code, source, question_id |
  Export-Csv -LiteralPath $csvPath -NoTypeInformation -Encoding utf8

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("# Evidence-Pilot-01 Inventory")
$lines.Add("")
$lines.Add("Generated: $(Get-Date -Format o)")
$lines.Add("")
$lines.Add("Sources are read-only local folders.")
$lines.Add("")
$lines.Add("| Source | Outline code | Count |")
$lines.Add("| --- | ---: | ---: |")
foreach ($item in $summary) {
  $lines.Add("| $($item.source) | $($item.outline_code) | $($item.count) |")
}
$lines.Add("")
$lines.Add("Total rows: $($rows.Count)")
$lines | Set-Content -LiteralPath $summaryPath -Encoding utf8

if ($Verify) {
  if ($rows.Count -le 0) {
    throw "Inventory is empty."
  }
  foreach ($code in $codes) {
    if (-not ($rows | Where-Object { $_.outline_code -eq $code })) {
      throw "No inventory row found for selected code $code."
    }
  }
  foreach ($path in @($jsonPath, $csvPath, $summaryPath)) {
    if (-not (Test-Path -LiteralPath $path)) {
      throw "Missing output: $path"
    }
  }
}

[pscustomobject]@{
  rows = $rows.Count
  json = $jsonPath
  csv = $csvPath
  summary = $summaryPath
}
