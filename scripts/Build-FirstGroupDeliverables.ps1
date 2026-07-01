param(
  [string]$OutputRoot = "C:\PDJ\output",
  [string]$AppRoot = "C:\barmatrix-app",
  [string]$PythonExe = "C:\Users\JesusLovesMe\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe",
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

function Escape-Html {
  param([string]$Text)
  return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Yaml-Block {
  param(
    [string]$Name,
    [string]$Value,
    [int]$Indent = 2
  )

  $spaces = " " * $Indent
  $childSpaces = " " * ($Indent + 2)
  $lines = @("$spaces${Name}: |-")
  foreach ($line in ($Value -split "`r?`n")) {
    $lines += "$childSpaces$line"
  }
  return $lines -join "`n"
}

function Count-Rows {
  param([object[]]$Values)

  $counts = @{}
  foreach ($value in $Values) {
    $key = [string]$value
    if (-not $counts.ContainsKey($key)) {
      $counts[$key] = 0
    }
    $counts[$key] += 1
  }
  return $counts.GetEnumerator() | Sort-Object Name
}

function Convert-CsvToXlsx {
  param(
    [string]$CsvPath,
    [string]$XlsxPath
  )

  if (-not (Test-Path -LiteralPath $CsvPath)) {
    throw "Missing inventory CSV: $CsvPath"
  }

  $python = @'
import csv
import sys
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill
from openpyxl.utils import get_column_letter

csv_path, xlsx_path = sys.argv[1], sys.argv[2]
wb = Workbook()
ws = wb.active
ws.title = "inventory"

with open(csv_path, newline="", encoding="utf-8-sig") as fh:
    for row in csv.reader(fh):
        ws.append(row)

if ws.max_row:
    for cell in ws[1]:
        cell.font = Font(bold=True)
        cell.fill = PatternFill("solid", fgColor="F2F2F2")
    ws.freeze_panes = "A2"
    for column in ws.columns:
        width = min(max(len(str(cell.value or "")) for cell in column) + 2, 60)
        ws.column_dimensions[get_column_letter(column[0].column)].width = width

wb.save(xlsx_path)
print(f"{ws.max_row - 1} data rows -> {xlsx_path}")
'@

  $python | & $PythonExe - $CsvPath $XlsxPath
  if ($LASTEXITCODE -ne 0) {
    throw "CSV to XLSX conversion failed for $CsvPath"
  }
}

function Get-AppSnapshot {
  if (-not (Test-Path -LiteralPath $AppRoot)) {
    throw "Missing app root: $AppRoot"
  }

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

function Build-GoldenSetMarkdown {
  param(
    [string]$Title,
    [object]$Pilot,
    [object[]]$Details
  )

  $lines = @(
    "# $Title",
    "",
    "Pilot: $($Pilot.id)",
    "",
    "| QID | Key | Outline | Source outline | Coverage | Bucket | Title |",
    "| --- | --- | --- | --- | --- | --- | --- |"
  )
  foreach ($detail in $Details | Sort-Object {[int]$_.questionId}) {
    $lines += "| $($detail.questionId) | $($detail.key) | $($detail.outlineCode) | $($detail.sourceOutlineCode) | $($detail.coverageGroup) | $($detail.seedBucket) | $($detail.title) |"
  }
  return $lines -join "`n"
}

function Build-KeysMarkdown {
  param(
    [string]$Title,
    [object]$Summary,
    [object[]]$Details
  )

  $lines = @(
    "# $Title",
    "",
    "Reusable keys: $($Summary.reusableKeys)",
    "",
    "| Kind | Key ID | QID | Body |",
    "| --- | --- | --- | --- |"
  )
  foreach ($detail in $Details | Sort-Object {[int]$_.questionId}) {
    foreach ($key in $detail.keys) {
      $body = ([string]$key.body).Replace("|", "\|")
      $lines += "| $($key.kind) | $($key.id) | $($detail.questionId) | $body |"
    }
  }
  return $lines -join "`n"
}

function Build-OutlineMarkdown {
  param(
    [string]$Title,
    [object]$Pilot,
    [object[]]$Details
  )

  $lines = @("# $Title", "")
  foreach ($code in $Pilot.codes) {
    $linked = @($Details | Where-Object {
      $_.outlineCode -eq $code.code -or $_.sourceOutlineCode -eq $code.code -or $_.selectorCode -eq $code.code
    })
    $keyCount = @($linked | ForEach-Object { $_.keys }).Count
    $leadMeCount = @($linked | ForEach-Object { $_.leadMeSteps }).Count
    $drillCount = @($linked | ForEach-Object { $_.drillSeeds }).Count

    $lines += "## $($code.code) - $($code.role)"
    $lines += ""
    $lines += $code.node
    $lines += ""
    $lines += "- Lesson: $($code.lesson)"
    $lines += "- Common trap: $($code.trap)"
    $lines += "- Linked questions: $($linked.Count)"
    $lines += "- Linked keys: $keyCount"
    $lines += "- Linked LeadMe steps: $leadMeCount"
    $lines += "- Linked drills: $drillCount"
    $lines += ""
    $lines += "| QID | Title | Key | Selected outline | Source outline |"
    $lines += "| --- | --- | --- | --- | --- |"
    foreach ($detail in $linked | Sort-Object {[int]$_.questionId}) {
      $lines += "| $($detail.questionId) | $($detail.title) | $($detail.key) | $($detail.outlineCode) | $($detail.sourceOutlineCode) |"
    }
    $lines += ""
  }
  return $lines -join "`n"
}

function Build-LeadMeYaml {
  param(
    [string]$PilotId,
    [object[]]$Details
  )

  $lines = @("pilot_subset_id: $PilotId", "cards:")
  foreach ($detail in $Details | Sort-Object {[int]$_.questionId}) {
    $lines += "  - question_id: `"$($detail.questionId)`""
    $lines += "    title: `"$($detail.title.Replace('"', '\"'))`""
    $lines += "    outline_code: `"$($detail.outlineCode)`""
    $lines += "    key: `"$($detail.key)`""
    $lines += "    steps:"
    foreach ($step in $detail.leadMeSteps) {
      $escaped = ([string]$step).Replace('"', '\"')
      $lines += "      - `"$escaped`""
    }
  }
  return $lines -join "`n"
}

function Build-AnswerFlowHtml {
  param(
    [string]$Title,
    [object[]]$Details,
    [int]$Limit
  )

  $cards = foreach ($detail in ($Details | Sort-Object {[int]$_.questionId} | Select-Object -First $Limit)) {
    $choices = foreach ($choice in $detail.choices) {
      "<li><strong>$(Escape-Html $choice.letter) / $(Escape-Html $choice.verdict):</strong> $(Escape-Html $choice.text)</li>"
    }
    $flow = foreach ($step in $detail.answerFlow) {
      "<li>$(Escape-Html $step)</li>"
    }
    @"
<article>
  <h2>Q$(Escape-Html $detail.questionId): $(Escape-Html $detail.title)</h2>
  <p><strong>Outline:</strong> $(Escape-Html $detail.outlineCode) / <strong>Key:</strong> $(Escape-Html $detail.key)</p>
  <p>$(Escape-Html $detail.distilledCoreQuestion)</p>
  <h3>Answer flow</h3>
  <ol>
    $($flow -join "`n    ")
  </ol>
  <h3>Choice decode</h3>
  <ul>
    $($choices -join "`n    ")
  </ul>
</article>
"@
  }

  return @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$(Escape-Html $Title)</title>
  <style>
    body { font-family: Arial, sans-serif; line-height: 1.55; margin: 40px; color: #111; background: #faf8f2; }
    article { border: 1px solid #222; padding: 24px; margin: 0 0 24px; background: #fffdf7; }
    h1, h2, h3 { line-height: 1.15; }
  </style>
</head>
<body>
  <h1>$(Escape-Html $Title)</h1>
  $($cards -join "`n")
</body>
</html>
"@
}

function Build-QaReportMarkdown {
  param(
    [string]$Title,
    [object]$Summary
  )

  $lines = @(
    "# $Title",
    "",
    "| Metric | Count |",
    "| --- | ---: |",
    "| Case studies | $($Summary.caseStudies) |",
    "| Reusable keys | $($Summary.reusableKeys) |",
    "| Trap keys | $($Summary.trapKeys) |",
    "| LeadMe steps | $($Summary.leadMeSteps) |",
    "| Drill seeds | $($Summary.drillSeeds) |",
    "| Answer-flow steps | $($Summary.answerFlowSteps) |",
    "| Recode rows | $($Summary.recodeRows) |",
    "",
    "## Review Status Counts",
    ""
  )
  foreach ($item in $Summary.reviewStatusCounts) {
    $lines += "- $($item[0]): $($item[1])"
  }
  $lines += ""
  $lines += "## Coverage Counts"
  $lines += ""
  foreach ($item in $Summary.coverageCounts) {
    $lines += "- $($item[0]): $($item[1])"
  }
  $lines += ""
  $lines += "## Seed Bucket Counts"
  $lines += ""
  foreach ($item in $Summary.seedBucketCounts) {
    $lines += "- $($item[0]): $($item[1])"
  }
  $lines += ""
  $lines += "## Key Kind Counts"
  $lines += ""
  foreach ($item in $Summary.keyKindCounts) {
    $lines += "- $($item[0]): $($item[1])"
  }
  return $lines -join "`n"
}

function Build-PilotDeliverables {
  param(
    [string]$Slug,
    [string]$DisplayName,
    [object]$Pilot,
    [object[]]$Details,
    [object]$Summary,
    [int]$AnswerFlowLimit
  )

  $dir = Join-Path $OutputRoot $Slug
  if (-not (Test-Path -LiteralPath $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
  }

  $inventoryCsv = Join-Path $dir ("{0}_inventory.csv" -f ($Slug -replace "-", "_"))
  $inventoryXlsx = Join-Path $dir ("{0}_question_inventory.xlsx" -f ($Slug -replace "-", "_"))
  Convert-CsvToXlsx -CsvPath $inventoryCsv -XlsxPath $inventoryXlsx

  $prefix = $Slug -replace "-", "_"
  Write-Utf8File -Path (Join-Path $dir "${prefix}_golden_set.md") -Content (Build-GoldenSetMarkdown "$DisplayName Golden Set" $Pilot $Details)
  Write-Utf8File -Path (Join-Path $dir "${prefix}_keys.md") -Content (Build-KeysMarkdown "$DisplayName Keys" $Summary $Details)
  Write-Utf8File -Path (Join-Path $dir "${prefix}_outline_nodes.md") -Content (Build-OutlineMarkdown "$DisplayName Outline Nodes" $Pilot $Details)
  Write-Utf8File -Path (Join-Path $dir "${prefix}_leadme_cards.yaml") -Content (Build-LeadMeYaml $Pilot.id $Details)
  Write-Utf8File -Path (Join-Path $dir "${prefix}_answer_flow_examples.html") -Content (Build-AnswerFlowHtml "$DisplayName Answer Flow Examples" $Details $AnswerFlowLimit)
  Write-Utf8File -Path (Join-Path $dir "${prefix}_qa_report.md") -Content (Build-QaReportMarkdown "$DisplayName QA Report" $Summary)

  return [pscustomobject]@{
    slug = $Slug
    details = $Details.Count
    xlsx = $inventoryXlsx
    markdown = 4
    yaml = 1
    html = 1
  }
}

$snapshot = Get-AppSnapshot
$evidencePilot = $snapshot.pilots[0]
$conLawPilot = $snapshot.pilots[1]

$results = @(
  Build-PilotDeliverables `
    -Slug "evidence-pilot-01" `
    -DisplayName "Evidence-Pilot-01" `
    -Pilot $evidencePilot `
    -Details @($snapshot.evidence.details) `
    -Summary $snapshot.evidence.summary `
    -AnswerFlowLimit 15
  Build-PilotDeliverables `
    -Slug "conlaw-pilot-01" `
    -DisplayName "ConLaw-Pilot-01" `
    -Pilot $conLawPilot `
    -Details @($snapshot.conlaw.details) `
    -Summary $snapshot.conlaw.summary `
    -AnswerFlowLimit 10
)

if ($Verify) {
  if (@($snapshot.evidence.details).Count -ne 50) {
    throw "Expected 50 Evidence details"
  }
  if (@($snapshot.conlaw.details).Count -ne 30) {
    throw "Expected 30 Con Law details"
  }

  $required = @(
    "evidence-pilot-01\evidence_pilot_01_question_inventory.xlsx",
    "evidence-pilot-01\evidence_pilot_01_golden_set.md",
    "evidence-pilot-01\evidence_pilot_01_keys.md",
    "evidence-pilot-01\evidence_pilot_01_outline_nodes.md",
    "evidence-pilot-01\evidence_pilot_01_leadme_cards.yaml",
    "evidence-pilot-01\evidence_pilot_01_answer_flow_examples.html",
    "evidence-pilot-01\evidence_pilot_01_qa_report.md",
    "conlaw-pilot-01\conlaw_pilot_01_question_inventory.xlsx",
    "conlaw-pilot-01\conlaw_pilot_01_golden_set.md",
    "conlaw-pilot-01\conlaw_pilot_01_keys.md",
    "conlaw-pilot-01\conlaw_pilot_01_outline_nodes.md",
    "conlaw-pilot-01\conlaw_pilot_01_leadme_cards.yaml",
    "conlaw-pilot-01\conlaw_pilot_01_answer_flow_examples.html",
    "conlaw-pilot-01\conlaw_pilot_01_qa_report.md"
  )

  foreach ($relative in $required) {
    $path = Join-Path $OutputRoot $relative
    if (-not (Test-Path -LiteralPath $path)) {
      throw "Missing generated deliverable: $path"
    }
  }
}

$results | ConvertTo-Json -Depth 5
