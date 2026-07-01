# Final Sprint Adaptive Sheets v6

## Purpose

Final Sprint compresses the student's known weakness profile into one web sheet per day for the last 14 days.

## Model

```text
14 days = 14 adaptive mixed sheets.
```

Do not force subject symmetry.

## Sheet contents

A sheet may include:

- Gold Keys;
- Silver Keys;
- Trap Keys;
- mnemonics;
- examples;
- Red/Purple/Blue/Orange prompts;
- outline microdrills;
- proof questions;
- push-further tasks.

## Priority tiers

Every overloaded sheet must separate:

- Must Do
- Should Do
- Extra

## Inputs

- personal weakness data;
- bank-wide high-yield keys;
- hand-curated priorities;
- recency and high-confidence wrong data;
- active zone status;
- final sprint curator boosts.

## Schema

```yaml
final_sprint_sheet:
  sheet_id:
  snapshot_id:
  day_number:
  title:
  theme:
  primary_goal:
  overload_level: "standard | overloaded"
  priority_tiers:
    must_do:
      keys: []
      trap_keys: []
      examples: []
      drills: []
    should_do:
      keys: []
      trap_keys: []
      mnemonics: []
      examples: []
    extra:
      keys: []
      examples: []
      drills: []
  mixed_targets:
    subjects: []
    spine_codes: []
    red_axis_ids: []
    purple_detail_ids: []
    blue_zone_ids: []
    orange_zone_ids: []
    mold_codes: []
    trap_dimension_ids: []
  completion_rule:
```

## Delivery

Web first. Printable/downloadable PDF later.
