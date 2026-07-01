# Outline Atlas / Outline Access v6

## Role

Outline Atlas is an advanced index of the site and a legal-spine portal. It is not the default daily path.

## Node page target

Each outline node should eventually include:

- short C3 lesson;
- black-letter items;
- common traps;
- Gold/Silver/Trap Keys;
- mnemonics;
- examples;
- LeadMe cards;
- question bank items;
- drills;
- Annotated Solve Boards;
- performance and mastery status.

## Schema

```yaml
outline_access_node:
  spine_code:
  display_code:
  legacy_outline_code:
  subject:
  subtopic:
  node_title:
  node_path:
  role: "advanced_index"
  performance:
    accuracy:
    attempts:
    mastery_status:
    last_seen:
    due_status:
  content:
    c3_lesson_id:
    black_letter_items: []
    trap_summary: []
    common_answer_array_shapes: []
  linked_assets:
    question_ids: []
    drill_ids: []
    key_ids: []
    trap_key_ids: []
    mnemonic_ids: []
    example_ids: []
    leadme_card_ids: []
    annotated_solve_board_ids: []
  actions:
    drill_now: true
    start_leadme_for_node: true
    open_question_bank: true
```

## Connection scoring

Exact code first. Later, add connection scoring through parent nodes, keys, repair cells, colors, molds, and trap dimensions.
