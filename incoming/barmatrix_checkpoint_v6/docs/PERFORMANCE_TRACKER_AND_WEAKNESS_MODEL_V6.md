# Performance Tracker and Weakness Model v6

## Purpose

The performance tracker turns attempts into mechanically known weaknesses. It must drive the drill picker, LeadMe, Red Zones/Active Zones, Final Sprint, and key scoring.

## Core rule

Do not treat subject accuracy as enough. Track weaknesses by repair cell.

```text
Repair Cell =
spine_code
+ red_axis
+ canonical_axis
+ purple_detail
+ blue_zone
+ mold
+ orange_zone
+ trap_dimension
+ key_gap
```

## Weakness profile

```yaml
weakness_profile:
  user_id:
  subject:
  spine_code:
  red_axis_id:
  canonical_axis_template_id:
  purple_detail_id:
  blue_zone_id:
  mold_code:
  orange_zone_id:
  trap_dimension_id:
  key_gap_ids: []
  trap_key_gap_ids: []
  attempt_count:
  miss_count:
  recent_miss_count:
  high_confidence_miss_count:
  avg_time_seconds:
  status: "open | rising | active | cooling | burned | mastered"
  next_best_task_id:
  next_best_drill_id:
  next_best_leadme_task_id:
```

## Mechanically known weakness standard

A weakness is mechanically known when:

1. at least two supporting misses, or one high-confidence miss on a high-priority node;
2. labels are stable enough to route;
3. at least one key, Trap Key, LeadMe card, drill, or proof item exists;
4. the next task can be named.

## Active Zone

The student sees "Red Zone." Backend stores "active_zone."

```yaml
active_zone:
  active_zone_id:
  user_id:
  ui_label: "Red Zone"
  title:
  zone_basis:
  status:
  damage_score:
  recent_miss_count:
  high_confidence_wrong_count:
  primary_repair_path_id:
  next_task_id:
```

## Status meanings

- `rising`: the weakness is getting worse or recently repeated.
- `active`: currently open and being worked.
- `cooling`: recent repair signals are positive but not proven.
- `burned`: proof drill passed; watch for relapse.
- `mastered`: stable over time and transfer proven.
