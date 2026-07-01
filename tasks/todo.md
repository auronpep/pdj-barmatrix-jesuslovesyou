# BarMatrix Jesuslovesyou Rebuild Prep

Date: 2026-07-01
Workspace: `C:\PDJ`
Target route prefix: `/Jesuslovesyou/`

## Plan

- [x] Create project scaffolding: `tasks`, `.codex`, `docs`, `AGENTS.md`, `.gitignore`.
- [x] Inventory and read every incoming project document.
- [x] Initialize local Git repository.
- [x] Register private GitHub repository and verify it is private before any push.
- [x] Initialize CodeGraph for `C:\PDJ` and record status.
- [x] Review `C:\BMO`, `C:\barmatrix-app`, and `C:\barmatrix-api` read-only for plumbing.
- [x] Write first implementation plan for `incoming\After_Setup_firstgroup.md`.

## Evidence

- Initial state: `C:\PDJ` was not a Git repository.
- Initial root contents: `incoming` only.
- Tools found: `rg`, `git`, `gh`, `codex`, `codegraph`, `pwsh`.
- Codex CLI version: `codex-cli 0.142.4`.
- Codex MCP: `codegraph` server already enabled as `codegraph serve --mcp`.
- Incoming inventory: 33 files total; 32 text/structured files read; 1 workbook inspected.
- Workbook: 7 sheets, 1,045 nonempty cells.
- Pilot registries: `docs\evidence-pilot-01-registry.yaml`, `docs\conlaw-pilot-01-registry.yaml`.
- CodeGraph `C:\PDJ`: initialized; 11 files indexed; 0 nodes; 0 edges; YAML only.
- BMO junctions: `C:\BMO\app-repo` -> `C:\barmatrix-app`; `C:\BMO\api-repo` -> `C:\barmatrix-api`.
- Frontend stack: `C:\barmatrix-app`, Next.js 16.2.6, React 19.2.4, Vercel project `barmatrix-app`.
- Backend stack: `C:\barmatrix-api`, Express + TypeScript + mysql2 + Stripe + Clerk + Resend.
- Prep report: `docs\rebuild-prep-report.md`.
- Private GitHub repo: `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou`.
- GitHub visibility verified: `PRIVATE`.
- Initial pushed commit: `db51ffd44f60555759306d2b4804c0e003615ee8`.

## Gates

- No public GitHub push.
- No live deploy or production provider mutation during prep.
- Existing BarMatrix app/API folders are read-only references until implementation starts.

## Implementation Slice 1 - Jesuslovesyou Pilot Shell

- [x] Add app-local pilot data for Evidence-Pilot-01 and ConLaw-Pilot-01.
- [x] Add public `/Jesuslovesyou/` route using the first-group pilot plan.
- [x] Add `/Jesuslovesyou/checkout` and `/Jesuslovesyou/checkout/success` wrappers without changing root checkout behavior.
- [x] Add sitemap entry for `/Jesuslovesyou`.
- [x] Run focused verification and record results.

## Implementation Evidence - 2026-07-01

- App repo touched: `C:\barmatrix-app` on branch `codex-review`; changes are local only and not pushed.
- App local commit: `9fc65b0 Add Jesuslovesyou pilot route`.
- Added data module: `C:\barmatrix-app\lib\jesuslovesyou\pilot-data.ts`.
- Added route: `C:\barmatrix-app\app\Jesuslovesyou\page.tsx`.
- Added checkout wrapper: `C:\barmatrix-app\app\Jesuslovesyou\checkout\page.tsx`.
- Added checkout success wrapper: `C:\barmatrix-app\app\Jesuslovesyou\checkout\success\page.tsx`.
- Updated existing checkout client only to accept optional route prefix; default `/checkout` behavior remains unchanged.
- Updated existing checkout success hero only to accept optional back-to-checkout href; default remains `/checkout`.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou`, `/Jesuslovesyou/checkout`, and `/Jesuslovesyou/checkout/success`.
- Local preview running: `http://127.0.0.1:3001/Jesuslovesyou` from PID 42964.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou`
  - `http://127.0.0.1:3001/Jesuslovesyou/checkout`
  - `http://127.0.0.1:3001/Jesuslovesyou/checkout/success`
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-mobile.png`

## Review

Preparation complete. Private GitHub registration and initial push complete.
Implementation slice 1 complete: public Jesuslovesyou route shell plus prefixed checkout wrappers are locally verified.

## Implementation Slice 2 - Evidence Pilot Page

- [x] Add `/Jesuslovesyou/evidence-pilot-01` route.
- [x] Reuse existing `pilot-data.ts` for Evidence page modules, LeadMe run sample, and Outline Atlas node sample.
- [x] Link `/Jesuslovesyou` to the Evidence pilot route.
- [x] Add sitemap entry for `/Jesuslovesyou/evidence-pilot-01`.
- [x] Verify lint, build, HTTP route response, and visual smoke screenshot.

## Implementation Evidence - Evidence Pilot Page - 2026-07-01

- App local commit: `16f44a8 Add Evidence pilot route`.
- Added route: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\page.tsx`.
- Updated data module: `C:\barmatrix-app\lib\jesuslovesyou\pilot-data.ts`.
- Updated homepage link: `C:\barmatrix-app\app\Jesuslovesyou\page.tsx`.
- Updated sitemap: `C:\barmatrix-app\app\sitemap.ts`.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01`.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou`
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01`
- Playwright screenshot:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-pilot-desktop.png`

## Implementation Slice 3 - Evidence Outline Code Pages

- [x] Add `/Jesuslovesyou/evidence-pilot-01/[code]` dynamic route.
- [x] Prerender all 10 selected Evidence pilot outline codes with `generateStaticParams`.
- [x] Link Evidence pilot code cards to their outline-node pages.
- [x] Add one lesson and one trap seed per selected Evidence code.
- [x] Include code routes in `sitemap.xml`.
- [x] Verify lint, build, HTTP route response, sitemap inclusion, and visual smoke screenshot.

## Implementation Evidence - Evidence Outline Code Pages - 2026-07-01

- App local commit: `455b6ec Add Evidence pilot code pages`.
- Added route: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\[code]\page.tsx`.
- Updated Evidence route links: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\page.tsx`.
- Updated data module: `C:\barmatrix-app\lib\jesuslovesyou\pilot-data.ts`.
- Updated sitemap: `C:\barmatrix-app\app\sitemap.ts`.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/[code]` with 10 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/33040203`
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/31010107`
  - `http://127.0.0.1:3001/sitemap.xml`
- Playwright screenshot:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-code-33040203-desktop.png`
