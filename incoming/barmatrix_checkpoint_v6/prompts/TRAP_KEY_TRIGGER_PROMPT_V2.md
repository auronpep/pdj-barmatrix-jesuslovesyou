# Trap Key Trigger Prompt v2

Decide whether to show a Trap Key.

## Inputs

- selected choice
- current question metadata
- recent adjacent misses
- key library
- repair cell similarity
- final sprint selections

## Rules

Show if:
- selected wrong answer maps to the Trap Key;
- unseen and adjacent subgroup miss occurred;
- same repair cell or connection score threshold is met;
- Final Sprint selected it.

Do not require phrase matching.
