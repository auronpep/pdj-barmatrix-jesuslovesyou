# BarMatrix Jesuslovesyou Rebuild Prep Report

Date: 2026-07-01
Workspace: `C:\PDJ`
Route target: `/Jesuslovesyou/`

## Incoming Corpus

Read inventory:

- Total incoming files: 33.
- Text/structured files read: 32.
- Workbook inspected: `C:\PDJ\incoming\barmatrix_checkpoint_v6_controlled_vocab.xlsx`.
- Primary first-group spec: `C:\PDJ\incoming\After_Setup_firstgroup.md`.

Corpus shape:

- `19` Markdown files.
- `9` YAML files.
- `3` JSON files.
- `1` SQL file.
- `1` XLSX workbook.

Workbook shape:

- Sheets: `README`, `Controlled_Vocab`, `Locked_Decisions`, `Schema_Objects`, `Schema_Fields`, `LeadMe_Tasks`, `Final_Sprint`.
- Nonempty cells: 1,045.
- Purpose: developer-facing controlled vocabulary and locked decisions mirror.

## Product Architecture Learned

The V6 source bundle locks this product model:

- Dashboard / Command Deck decides the next action.
- LeadMe guides the student through the same plan with micro-tasks.
- Performance tracker turns attempts into repair-cell weakness profiles.
- Drill picker selects the next best task.
- Key system keeps Gold, Silver, Trap Key, Mnemonic, Example, LeadMe, and Final Sprint as render roles in one key library.
- Outline Atlas is an advanced exact-code index, not the primary daily path.
- Annotated Solve Board is generated from validated scaffold data, not free prose.
- Final Sprint is 14 adaptive mixed web sheets, PDF later.

## First Content Group

Implement Evidence before Con Law:

- Evidence: `EVIDENCE-PILOT-01`, 10 outline codes, 50 golden seed questions.
- Con Law: `CONLAW-PILOT-01`, 6 outline codes, 30 golden seed questions after Evidence stabilizes.

Project-owned registries created:

- `C:\PDJ\docs\evidence-pilot-01-registry.yaml`
- `C:\PDJ\docs\conlaw-pilot-01-registry.yaml`

## Schema Reconciliation

The V6 SQL delta is useful but not ready for blind DB apply.

Known gaps before runtime migration:

- Checklist starts with `Attempt_Log`, `Choice_Forensics`, `Question_Diagnostics`, and `Answer_Array_Profile`, but the SQL delta starts later at weakness/daily-task/product tables.
- Docs require `Key_Evidence` and `Key_Score`; SQL creates key master/profile/example/mnemonic tables but not those scoring/evidence tables.
- Naming mismatch: JSON examples use `item_id`; SQL uses `queue_item_id`.
- LeadMe examples nest tasks under modules; SQL normalizes modules, tasks, runs, and results.

Lazy implementation decision:

- Start with typed constants, demo data, and route/UI proof under `/Jesuslovesyou/`.
- Defer DB migration until existing API tables and V6 missing foundations are reconciled.

## Existing Plumbing

Read-only reference paths:

- `C:\BMO`
- `C:\BMO\app-repo` -> junction to `C:\barmatrix-app`
- `C:\BMO\api-repo` -> junction to `C:\barmatrix-api`

Frontend:

- Repo: `C:\barmatrix-app`
- Remote: `https://github.com/auronpep/barmatrix-app.git`
- Vercel project: `barmatrix-app`
- Stack: Next.js 16.2.6, React 19.2.4, App Router.
- API client: `C:\barmatrix-app\lib\api-client.ts`
- API URL fallback: `https://api.barmatrix.app`
- Existing app surfaces to reuse: `/checkout`, `/checkout/success`, `/dashboard`, `/dashboard/path`, `/diagnostic`, `/atlas-v1`, `/drills`.

Backend:

- Repo: `C:\barmatrix-api`
- Remote: `https://github.com/auronpep/barmatrix-api.git`
- Stack: Express + TypeScript + mysql2 + Stripe + Clerk + Resend.
- Entry: `C:\barmatrix-api\src\app-entry.ts`
- Config/env loader: `C:\barmatrix-api\src\config.ts`
- Checkout URL safety: `C:\barmatrix-api\src\checkout.ts`
- Command Deck endpoint: `GET /api/me/command-deck`
- Day plan endpoints: `GET /api/me/day-plan`, `POST /api/me/day-plan/steps/:stepId/complete`
- Checkout endpoint: `POST /api/checkout/create-session`
- Stripe webhook: `POST /api/webhooks/stripe`

## Route Plan

For the first app implementation, create:

- `C:\barmatrix-app\app\Jesuslovesyou\page.tsx`
- `C:\barmatrix-app\app\Jesuslovesyou\checkout\page.tsx` only when checkout copy/return URLs need to stay under the prefix.
- `C:\barmatrix-app\app\Jesuslovesyou\checkout\success\page.tsx` if using prefixed checkout return URLs.

Why this works:

- App Router folder casing can produce the capitalized `/Jesuslovesyou/` route.
- Next config has no `basePath`; adding a route folder is additive.
- API checkout accepts same-origin `success_url` and `cancel_url`, so prefixed checkout returns can use the existing backend without provider mutation.
- Existing middleware does not protect `/Jesuslovesyou`; keep first route public. If paid prefixed dashboard pages are added, add those paths to `proxy.ts`.

## CodeGraph

`C:\PDJ` CodeGraph initialized:

- Files indexed: 9.
- Nodes: 0.
- Edges: 0.
- Language indexed: YAML.

`C:\barmatrix-app` already has a healthy CodeGraph index. `C:\barmatrix-api` is not indexed; left unchanged because app/API references were read-only during this prep pass.

## Gates Before Implementation

- Do not apply `schema_delta_product_v6.sql` to production.
- Do not mutate `C:\BMO`, `C:\barmatrix-app`, or `C:\barmatrix-api` until the implementation step explicitly starts.
- Before deploying, verify Vercel project identity from `C:\barmatrix-app\.vercel\project.json`.
- Before any GitHub push, verify remote visibility is private.

## Recommended First Build

1. Add a public `/Jesuslovesyou/` shell in `C:\barmatrix-app` with static V6 demo data from the registries and examples.
2. Add typed V6 vocab/constants in the app only.
3. Add a prefixed checkout wrapper only if the first shell includes enrollment CTAs.
4. Add API schemas/migrations only after reconciling missing attempt/diagnostics/key evidence tables.
