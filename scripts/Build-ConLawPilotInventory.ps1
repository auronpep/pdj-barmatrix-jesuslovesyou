param(
  [string]$OutputDir = "C:\PDJ\output\conlaw-pilot-01",
  [switch]$Verify
)

$ErrorActionPreference = "Stop"

$selectors = @(
  @{ Code = "44040100"; Match = "exact"; Coverage = "state_action" },
  @{ Code = "44040502"; Match = "exact"; Coverage = "first_amendment_speech_forum" },
  @{ Code = "44040501"; Match = "exact"; Coverage = "free_exercise" },
  @{ Code = "44040300"; Match = "prefix"; Prefix = "440403"; Coverage = "due_process_equal_protection_routing" },
  @{ Code = "44040200"; Match = "prefix"; Prefix = "440402"; Coverage = "due_process_equal_protection_routing" },
  @{ Code = "43020201"; Match = "exact"; Coverage = "standing_ripeness_mootness_gate" }
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

function Get-SelectorMatch {
  param([string]$OutlineCode)

  foreach ($selector in $selectors) {
    if ($selector.Match -eq "exact" -and $OutlineCode -eq $selector.Code) {
      return [pscustomobject]@{
        selector_code = $selector.Code
        selector_match = "exact"
        coverage_group = $selector.Coverage
      }
    }

    if ($selector.Match -eq "prefix" -and $OutlineCode.StartsWith($selector.Prefix)) {
      return [pscustomobject]@{
        selector_code = $selector.Code
        selector_match = if ($OutlineCode -eq $selector.Code) { "exact" } else { "child_code" }
        coverage_group = $selector.Coverage
      }
    }
  }

  return $null
}

function Get-SeedBucket {
  param([object]$CorrectPercent)

  $percent = $null
  if ([int]::TryParse([string]$CorrectPercent, [ref]$percent)) {
    if ($percent -ge 60) { return "clean_teaching" }
    if ($percent -lt 35) { return "hard_or_high_pick_rate_trap" }
    return "medium_friction"
  }

  return "needs_human_review"
}

function Get-InventoryRows {
  $rows = New-Object System.Collections.Generic.List[object]

  foreach ($source in $sources) {
    if (-not (Test-Path -LiteralPath $source.Path)) {
      continue
    }

    foreach ($file in Get-ChildItem -LiteralPath $source.Path -Filter $source.Glob -File) {
      $text = Get-Content -LiteralPath $file.FullName -Raw
      $outlineCode = First-Match $text @(
        '^\s*Outline_code:\s*"?([0-9]{8})"?\s*$',
        '^\s*outline_code:\s*"?([0-9]{8})"?\s*$'
      )
      if (-not $outlineCode) {
        continue
      }

      $match = Get-SelectorMatch $outlineCode
      if (-not $match) {
        continue
      }

      $rows.Add([pscustomobject]@{
        source = $source.Name
        question_id = Get-QuestionId $text $file.FullName
        selector_code = $match.selector_code
        selector_match = $match.selector_match
        outline_code = $outlineCode
        source_outline_code = $outlineCode
        coverage_group = $match.coverage_group
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

function Get-UniqueQuestionRows {
  param([object[]]$Rows)

  foreach ($group in ($Rows | Group-Object selector_code, question_id)) {
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

    $sourceCorrectPercent = $qbankRow.correct_percent
    if ((-not $qbankRow) -and (Test-Path -LiteralPath $qbankPath)) {
      $sourceText = Get-Content -LiteralPath $qbankPath -Raw
      $sourceCorrectPercent = First-Match $sourceText @('^\s*Percent of Students who got it right:\s*([0-9]+)\s*$')
    }
    if (-not $sourceCorrectPercent) {
      $sourceCorrectPercent = $chosen.correct_percent
    }

    [pscustomobject]@{
      question_id = $chosen.question_id
      selector_code = $chosen.selector_code
      selector_match = $chosen.selector_match
      outline_code = $chosen.outline_code
      source_outline_code = $chosen.source_outline_code
      coverage_group = $chosen.coverage_group
      seed_bucket = Get-SeedBucket $sourceCorrectPercent
      correct_percent = $sourceCorrectPercent
      key = $chosen.key
      has_finished_transform = [bool]$finishedRow
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

  foreach ($selector in $selectors) {
    $selectorRows = $uniqueRows |
      Where-Object { $_.selector_code -eq $selector.Code } |
      Sort-Object `
        @{ Expression = { if ($_.seed_bucket -eq "hard_or_high_pick_rate_trap") { 0 } elseif ($_.has_finished_transform) { 1 } elseif ($_.seed_bucket -eq "medium_friction") { 2 } else { 3 } } }, `
        @{ Expression = { if ($_.correct_percent) { [int]$_.correct_percent } else { 999 } } }, `
        question_id

    foreach ($row in @($selectorRows | Select-Object -First 5)) {
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
  $status = if ($row.source -like "*finished") { "transformed_$($row.selector_match)" } else { "in_scope_$($row.selector_match)" }
  $row | Add-Member -NotePropertyName pilot_question_status -NotePropertyValue $status -Force
  $row | Add-Member -NotePropertyName has_finished_transform -NotePropertyValue ($finishedIds -contains $row.question_id) -Force
}

$inventoryJsonPath = Join-Path $OutputDir "conlaw_pilot_01_inventory.json"
$inventoryCsvPath = Join-Path $OutputDir "conlaw_pilot_01_inventory.csv"
$inventorySummaryPath = Join-Path $OutputDir "conlaw_pilot_01_inventory_summary.md"
$seedJsonPath = Join-Path $OutputDir "conlaw_pilot_01_seed_candidates.json"
$seedCsvPath = Join-Path $OutputDir "conlaw_pilot_01_seed_candidates.csv"
$seedSummaryPath = Join-Path $OutputDir "conlaw_pilot_01_seed_candidates.md"

ConvertTo-Json -InputObject @($rows | Sort-Object selector_code, outline_code, source, question_id) -Depth 4 |
  Set-Content -LiteralPath $inventoryJsonPath -Encoding utf8

$rows |
  Sort-Object selector_code, outline_code, source, question_id |
  Export-Csv -LiteralPath $inventoryCsvPath -NoTypeInformation -Encoding utf8

$inventoryLines = New-Object System.Collections.Generic.List[string]
$inventoryLines.Add("# ConLaw-Pilot-01 Inventory")
$inventoryLines.Add("")
$inventoryLines.Add("Generated: $(Get-Date -Format o)")
$inventoryLines.Add("")
$inventoryLines.Add("Sources are read-only local folders.")
$inventoryLines.Add("")
$inventoryLines.Add("| Source | Selector | Outline code | Match | Count |")
$inventoryLines.Add("| --- | ---: | ---: | --- | ---: |")
foreach ($item in ($rows | Group-Object source, selector_code, outline_code, selector_match | Sort-Object Name)) {
  $parts = $item.Name.Split(',').Trim()
  $inventoryLines.Add("| $($parts[0]) | $($parts[1]) | $($parts[2]) | $($parts[3]) | $($item.Count) |")
}
$inventoryLines.Add("")
$inventoryLines.Add("Total rows: $($rows.Count)")
$inventoryLines | Set-Content -LiteralPath $inventorySummaryPath -Encoding utf8

$seedCandidates = @(Get-SeedCandidates $rows)
ConvertTo-Json -InputObject @($seedCandidates | Sort-Object selector_code, outline_code, question_id) -Depth 4 |
  Set-Content -LiteralPath $seedJsonPath -Encoding utf8

$seedCandidates |
  Sort-Object selector_code, outline_code, question_id |
  Export-Csv -LiteralPath $seedCsvPath -NoTypeInformation -Encoding utf8

$seedLines = New-Object System.Collections.Generic.List[string]
$seedLines.Add("# ConLaw-Pilot-01 Seed Candidates")
$seedLines.Add("")
$seedLines.Add("Generated: $(Get-Date -Format o)")
$seedLines.Add("")
$seedLines.Add("Status: candidate set only; manual legal review still required.")
$seedLines.Add("")
$seedLines.Add("Total candidates: $($seedCandidates.Count)")
$seedLines.Add("")
$seedLines.Add("## By Selector")
$seedLines.Add("")
$seedLines.Add("| Selector | Count |")
$seedLines.Add("| ---: | ---: |")
foreach ($item in ($seedCandidates | Group-Object selector_code | Sort-Object Name)) {
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
  foreach ($selector in $selectors) {
    $selectorRows = @($rows | Where-Object { $_.selector_code -eq $selector.Code })
    if ($selectorRows.Count -lt 5) {
      throw "Expected at least 5 inventory rows for selector $($selector.Code); found $($selectorRows.Count)."
    }
    $seedCount = @($seedCandidates | Where-Object { $_.selector_code -eq $selector.Code }).Count
    if ($seedCount -ne 5) {
      throw "Expected 5 seed candidates for selector $($selector.Code); found $seedCount."
    }
  }
  if ($seedCandidates.Count -ne 30) {
    throw "Expected 30 seed candidates; found $($seedCandidates.Count)."
  }
  if (-not ($seedCandidates | Where-Object { $_.selector_code -eq "44040200" -and $_.selector_match -eq "child_code" })) {
    throw "Expected child-code Due Process candidates for selector 44040200."
  }
  foreach ($path in @($inventoryJsonPath, $inventoryCsvPath, $inventorySummaryPath, $seedJsonPath, $seedCsvPath, $seedSummaryPath)) {
    if (-not (Test-Path -LiteralPath $path)) {
      throw "Missing output: $path"
    }
  }
}

[pscustomobject]@{
  rows = $rows.Count
  seedCandidates = $seedCandidates.Count
  inventoryJson = $inventoryJsonPath
  inventoryCsv = $inventoryCsvPath
  inventorySummary = $inventorySummaryPath
  seedJson = $seedJsonPath
  seedCsv = $seedCsvPath
  seedSummary = $seedSummaryPath
}
