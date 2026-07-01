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

$qbankRoot = "C:\FOC\Workspace\QBank"

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
        source_outline_code = $outlineCode
        correct_percent = First-Match $text @(
          '^\s*Percent of Students who got it right:\s*([0-9]+)\s*$',
          '^\s*source_overall_correct_percent:\s*([0-9]+)\s*$'
        )
        subject = First-Match $text @('^\s*MBE Subjects.*?:\s*(.+?)\s*$', '^\s*subject:\s*"?(.+?)"?\s*$')
        subtopic = First-Match $text @('^\s*Subtopic:\s*(.+?)\s*$', '^\s*subtopic:\s*"?(.+?)"?\s*$')
        key = First-Match $text @('^\s*Correct Answer:\s*([A-D])\s*$', '^\s*key:\s*"?([A-D])"?\s*$')
        path = $file.FullName
      })
    }
  }

  return $rows
}

function Get-CoverageGroup {
  param([string]$Code)

  if (@("31010406", "31010503") -contains $Code) { return "witness_truthfulness_bias" }
  if ($Code -eq "33040203") { return "non_hearsay_purpose" }
  if (@("32020302", "35030304") -contains $Code) { return "fre_403_insurance_policy_purpose" }
  if (@("33040301", "33040302") -contains $Code) { return "hearsay_exception" }
  if ($Code -eq "31010107") { return "preliminary_question_judge_jury" }
  return "adjacent_pilot_code"
}

function Get-SeedBucket {
  param(
    [string]$OutlineCode,
    [string]$SourceOutlineCode,
    [object]$CorrectPercent
  )

  if ($SourceOutlineCode -and $SourceOutlineCode -ne $OutlineCode) {
    return "recode_or_ambiguous"
  }

  $percent = $null
  if ([int]::TryParse([string]$CorrectPercent, [ref]$percent)) {
    if ($percent -ge 60) { return "clean_teaching" }
    if ($percent -lt 35) { return "hard_or_high_pick_rate_trap" }
    return "medium_friction"
  }

  return "needs_human_review"
}

function Get-UniqueQuestionRows {
  param([object[]]$Rows)

  $groups = $Rows | Group-Object outline_code, question_id
  foreach ($group in $groups) {
    $items = @($group.Group)
    $first = $items[0]
    $qbankPath = Join-Path $qbankRoot "$($first.question_id).md"
    $qbankRow = $items | Where-Object { $_.source -eq "foc_qbank" } | Select-Object -First 1
    $finishedRow = $items |
      Where-Object { $_.source -like "*finished" } |
      Sort-Object @{ Expression = { if ($_.source -eq "foc_finished") { 0 } else { 1 } } } |
      Select-Object -First 1
    $chosen = if ($finishedRow) { $finishedRow } else { $qbankRow }

    if (-not $chosen) {
      continue
    }

    $sourceOutlineCode = $qbankRow.source_outline_code
    $sourceCorrectPercent = $qbankRow.correct_percent
    if ((-not $qbankRow) -and (Test-Path -LiteralPath $qbankPath)) {
      $sourceText = Get-Content -LiteralPath $qbankPath -Raw
      $sourceOutlineCode = First-Match $sourceText @('^\s*Outline_code:\s*"?([0-9]{8})"?\s*$')
      $sourceCorrectPercent = First-Match $sourceText @('^\s*Percent of Students who got it right:\s*([0-9]+)\s*$')
    }
    if (-not $sourceOutlineCode) {
      $sourceOutlineCode = $chosen.source_outline_code
    }
    if (-not $sourceCorrectPercent) {
      $sourceCorrectPercent = $chosen.correct_percent
    }

    $hasFinishedTransform = [bool]$finishedRow
    $bucket = Get-SeedBucket $chosen.outline_code $sourceOutlineCode $sourceCorrectPercent
    [pscustomobject]@{
      question_id = $chosen.question_id
      outline_code = $chosen.outline_code
      source_outline_code = $sourceOutlineCode
      coverage_group = Get-CoverageGroup $chosen.outline_code
      seed_bucket = $bucket
      correct_percent = $sourceCorrectPercent
      key = $chosen.key
      has_finished_transform = $hasFinishedTransform
      qbank_path = if (Test-Path -LiteralPath $qbankPath) { $qbankPath } else { $null }
      transform_path = $finishedRow.path
      selected_path = $chosen.path
      review_status = "seed_candidate_needs_human_review"
    }
  }
}

function Get-SeedCandidates {
  param([object[]]$Rows)

  $uniqueRows = @(Get-UniqueQuestionRows $Rows)
  $selected = New-Object System.Collections.Generic.List[object]

  foreach ($code in $codes) {
    $codeRows = $uniqueRows |
      Where-Object { $_.outline_code -eq $code } |
      Sort-Object `
        @{ Expression = { if ($_.seed_bucket -eq "recode_or_ambiguous") { 0 } elseif ($_.seed_bucket -eq "hard_or_high_pick_rate_trap") { 1 } elseif ($_.has_finished_transform) { 2 } else { 3 } } }, `
        @{ Expression = { if ($_.correct_percent) { [int]$_.correct_percent } else { 999 } } }, `
        question_id

    foreach ($row in @($codeRows | Select-Object -First 5)) {
      $selected.Add($row)
    }
  }

  return $selected
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
$seedJsonPath = Join-Path $OutputDir "evidence_pilot_01_seed_candidates.json"
$seedCsvPath = Join-Path $OutputDir "evidence_pilot_01_seed_candidates.csv"
$seedSummaryPath = Join-Path $OutputDir "evidence_pilot_01_seed_candidates.md"

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

$seedCandidates = @(Get-SeedCandidates $rows)
$seedCandidates |
  Sort-Object outline_code, question_id |
  ConvertTo-Json -Depth 4 |
  Set-Content -LiteralPath $seedJsonPath -Encoding utf8

$seedCandidates |
  Sort-Object outline_code, question_id |
  Export-Csv -LiteralPath $seedCsvPath -NoTypeInformation -Encoding utf8

$seedLines = New-Object System.Collections.Generic.List[string]
$seedLines.Add("# Evidence-Pilot-01 Seed Candidates")
$seedLines.Add("")
$seedLines.Add("Generated: $(Get-Date -Format o)")
$seedLines.Add("")
$seedLines.Add("Status: candidate set only; manual legal review still required.")
$seedLines.Add("")
$seedLines.Add("Total candidates: $($seedCandidates.Count)")
$seedLines.Add("")
$seedLines.Add("## By Outline Code")
$seedLines.Add("")
$seedLines.Add("| Outline code | Count |")
$seedLines.Add("| ---: | ---: |")
foreach ($item in ($seedCandidates | Group-Object outline_code | Sort-Object Name)) {
  $seedLines.Add("| $($item.Name) | $($item.Count) |")
}
$seedLines.Add("")
$seedLines.Add("## By Coverage Group")
$seedLines.Add("")
$seedLines.Add("| Coverage group | Count |")
$seedLines.Add("| --- | ---: |")
foreach ($item in ($seedCandidates | Group-Object coverage_group | Sort-Object Name)) {
  $seedLines.Add("| $($item.Name) | $($item.Count) |")
}
$seedLines.Add("")
$seedLines.Add("## By Seed Bucket")
$seedLines.Add("")
$seedLines.Add("| Seed bucket | Count |")
$seedLines.Add("| --- | ---: |")
foreach ($item in ($seedCandidates | Group-Object seed_bucket | Sort-Object Name)) {
  $seedLines.Add("| $($item.Name) | $($item.Count) |")
}
$seedLines | Set-Content -LiteralPath $seedSummaryPath -Encoding utf8

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
  if ($seedCandidates.Count -ne 50) {
    throw "Expected 50 seed candidates; found $($seedCandidates.Count)."
  }
  foreach ($code in $codes) {
    $codeCount = @($seedCandidates | Where-Object { $_.outline_code -eq $code }).Count
    if ($codeCount -ne 5) {
      throw "Expected 5 seed candidates for $code; found $codeCount."
    }
  }
  foreach ($coverageGroup in @(
    "witness_truthfulness_bias",
    "non_hearsay_purpose",
    "fre_403_insurance_policy_purpose",
    "hearsay_exception",
    "preliminary_question_judge_jury"
  )) {
    $coverageCount = @($seedCandidates | Where-Object { $_.coverage_group -eq $coverageGroup }).Count
    if ($coverageCount -lt 5) {
      throw "Expected at least 5 seed candidates for coverage group $coverageGroup; found $coverageCount."
    }
  }
  foreach ($path in @($seedJsonPath, $seedCsvPath, $seedSummaryPath)) {
    if (-not (Test-Path -LiteralPath $path)) {
      throw "Missing output: $path"
    }
  }
}

[pscustomobject]@{
  rows = $rows.Count
  seedCandidates = $seedCandidates.Count
  json = $jsonPath
  csv = $csvPath
  summary = $summaryPath
  seedJson = $seedJsonPath
  seedCsv = $seedCsvPath
  seedSummary = $seedSummaryPath
}
