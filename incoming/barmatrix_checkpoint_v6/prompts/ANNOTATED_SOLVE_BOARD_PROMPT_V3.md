# Annotated Solve Board Prompt v3

Generate an Annotated Solve Board from validated scaffold trace and C3 outputs.

## Required modules

- board_type
- call_lock
- stem_annotations
- solve_steps
- answer_decode
- color_stack
- board_review_truth
- repair_prompt
- linked_keys

## Rules

- Do not generate from free prose alone.
- Use validated call/fact/choice cards.
- Include Trap Key module if triggered.
- Keep board skippable but comprehensive.
