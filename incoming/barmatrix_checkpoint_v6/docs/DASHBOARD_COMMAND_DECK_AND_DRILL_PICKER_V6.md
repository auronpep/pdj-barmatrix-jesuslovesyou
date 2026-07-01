# Dashboard / Command Deck + Drill Picker Algorithm v6

## Purpose

The Command Deck selects the next best student action. It is a daily controller, not a passive dashboard.

## Primary scoring idea

Every candidate task receives an expected repair value.

```text
candidate_score =
  user_expected_gain
  + bank_yield
  + recency_weight
  + high_confidence_wrong_weight
  + active_zone_damage
  + due_spaced_repetition_weight
  + unseen_trap_key_boost
  + final_sprint_boost
  + curator_boost
  - overlap_penalty
  - overapplication_risk
  - fatigue_penalty
```

## Candidate task sources

- assigned drills;
- active zone repair;
- Key gap;
- Trap Key gap;
- recent miss;
- spaced repetition due;
- outline microdrill;
- annotated solve board review;
- proof drill readiness;
- final sprint required sheet;
- coach/curator assignment.

## Task picker hierarchy

1. Final Sprint required task, if in final sprint.
2. Open dashboard required task.
3. Active Zone rising with available repair.
4. Recent high-confidence miss with key/trap-key gap.
5. Due spaced repetition on weak key/color.
6. Proof drill ready.
7. Outline node undercovered and high value.
8. Timed set only when repair queue has no urgent blockers.

## Output object

```yaml
drill_picker_recommendation:
  recommendation_id:
  user_id:
  task_type:
  title:
  reason:
  target:
    spine_code:
    key_id:
    trap_key_id:
    red_axis_id:
    purple_detail_id:
    blue_zone_id:
    mold_code:
    orange_zone_id:
  estimated_minutes:
  priority_rank:
  confidence:
  display_in_dashboard_next_four: true
  available_in_leadme: true
```

## Where to Dig Next

This section is selected after the drill picker is available.

Candidate lenses:

- active_zones
- tension_matrix
- pattern_board
- misconceptions
- outline_atlas
- trap_keys
- leadme
- final_sprint
- question_history

## Repair Queue

The repair queue may include drills, questions, keys, Trap Keys, LeadMe cards, outline lessons, proof drills, and Annotated Solve Board reviews.
