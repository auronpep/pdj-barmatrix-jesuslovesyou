## Mission

This project is the private preparation workspace for the BarMatrix content rebuild. The target public route is `/Jesuslovesyou/` under `barmatrix.app`, with the capital `J` preferred anywhere route tooling allows it.

## Workflow

- Plan first in `tasks/todo.md` for non-trivial work.
- Track progress and proof in `tasks/todo.md`; update it as work changes state.
- Keep corrections and recurring mistakes in `tasks/lessons.md`.
- Read source documents before implementing from them.
- Verify before marking work complete.

## Safety

- Treat `C:\BMO`, `C:\barmatrix-app`, and `C:\barmatrix-api` as read-only reference sources unless the user explicitly expands scope.
- Never push to a public repository.
- Before any GitHub write, verify the target remote and repository visibility.
- Keep secrets, `.env*`, `.vercel`, auth files, and generated local caches out of Git.
- Keep public BarMatrix copy clean, Christian-safe, and free of profanity or crude double meanings.

## Implementation Defaults

- Minimal diffs. Port only what is needed for the current route/content slice.
- Use existing BarMatrix app/API patterns before inventing new plumbing.
- Preserve checkout/auth behavior; do not alter production payment/provider state without explicit approval.
- Prefer reversible route additions under `/Jesuslovesyou/` until the homepage pointer changes.
