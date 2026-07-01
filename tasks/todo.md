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

## Implementation Slice 4 - Evidence Exact-Code Inventory

- [x] Add repeatable inventory scanner: `C:\PDJ\scripts\Build-EvidencePilotInventory.ps1`.
- [x] Read local source folders read-only:
  - `C:\FOC\Workspace\QBank`
  - `C:\FOC\Workspace\Finished`
  - `C:\CCG\Finished`
- [x] Pull exact-code rows for all 10 Evidence pilot outline codes.
- [x] Emit JSON, CSV, and Markdown summary artifacts.
- [x] Include `pilot_question_status` and `has_finished_transform` fields.
- [x] Verify every selected Evidence code has at least one local row.

## Implementation Evidence - Evidence Exact-Code Inventory - 2026-07-01

- Script: `C:\PDJ\scripts\Build-EvidencePilotInventory.ps1`.
- Command passed: `pwsh -NoProfile -File C:\PDJ\scripts\Build-EvidencePilotInventory.ps1 -Verify`.
- Total rows: 272.
- Status counts:
  - `in_scope_exact_code`: 212
  - `transformed_exact_code`: 60
- Artifacts:
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_inventory.json`
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_inventory.csv`
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_inventory_summary.md`

## Implementation Slice 5 - Evidence Seed Candidates

- [x] Extend `C:\PDJ\scripts\Build-EvidencePilotInventory.ps1` to emit deterministic seed candidates.
- [x] Select 5 seed candidates for each of the 10 Evidence pilot outline codes.
- [x] Add candidate fields for `source_outline_code`, `coverage_group`, `seed_bucket`, `correct_percent`, source paths, and review status.
- [x] Keep source folders read-only:
  - `C:\FOC\Workspace\QBank`
  - `C:\FOC\Workspace\Finished`
  - `C:\CCG\Finished`
- [x] Verify required coverage groups have candidate representation.
- [x] Mark all rows as candidate-only pending human legal review.

## Implementation Evidence - Evidence Seed Candidates - 2026-07-01

- Script: `C:\PDJ\scripts\Build-EvidencePilotInventory.ps1`.
- Command passed: `pwsh -NoProfile -File C:\PDJ\scripts\Build-EvidencePilotInventory.ps1 -Verify`.
- Inventory rows: 272.
- Seed candidates: 50.
- Code distribution: 5 candidates for each selected code:
  - `31010107`, `31010406`, `31010407`, `31010503`, `32020302`, `32020404`, `33040203`, `33040301`, `33040302`, `35030304`
- Coverage group counts:
  - `adjacent_pilot_code`: 10
  - `fre_403_insurance_policy_purpose`: 10
  - `hearsay_exception`: 10
  - `non_hearsay_purpose`: 5
  - `preliminary_question_judge_jury`: 5
  - `witness_truthfulness_bias`: 10
- Seed bucket counts:
  - `clean_teaching`: 23
  - `hard_or_high_pick_rate_trap`: 2
  - `medium_friction`: 7
  - `needs_human_review`: 11
  - `recode_or_ambiguous`: 7
- Recode example verified: Q22198 is selected as `33040301` from source `35030200` and tagged `recode_or_ambiguous`.
- Artifacts:
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_seed_candidates.json`
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_seed_candidates.csv`
  - `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_seed_candidates.md`

## Implementation Slice 6 - App Seed Candidate Surface

- [x] Copy the verified Evidence seed-candidate artifact into the app as static data.
- [x] Add `/Jesuslovesyou/evidence-pilot-01/seeds`.
- [x] Link the Evidence pilot page to the seed candidate surface.
- [x] Add the seed route to `sitemap.xml`.
- [x] Verify lint, build, route HTTP 200, and rendered seed counts.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - App Seed Candidate Surface - 2026-07-01

- App route added: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\seeds\page.tsx`.
- App static data added: `C:\barmatrix-app\lib\jesuslovesyou\evidence-seed-candidates.json`.
- App local commit: `2cd2d5b Add Evidence seed candidate page`.
- Source data: `C:\PDJ\output\evidence-pilot-01\evidence_pilot_01_seed_candidates.json`.
- Public-safe data check passed: no `C:\` local filesystem paths in app seed JSON.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds`.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds`
  - `http://127.0.0.1:3001/sitemap.xml`
- Rendered DOM verification passed:
  - heading present
  - `50 SEED CANDIDATES` present
  - Q22198 present
  - source `35030200` recode evidence present
  - question card count: 50
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-seeds-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-seeds-mobile.png`

## Implementation Slice 7 - Q22198 Case Study Surface

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22198.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22198.md`.
- [x] Add public-safe Q22198 detail payload to the app.
- [x] Add `/Jesuslovesyou/evidence-pilot-01/seeds/22198`.
- [x] Link Q22198 from the seed candidate page.
- [x] Add the Q22198 detail route to `sitemap.xml`.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q22198 Case Study Surface - 2026-07-01

- App local commit: `7319a0f Add Evidence Q22198 case study`.
- App data added: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App route added: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\seeds\[questionId]\page.tsx`.
- Source row read: `C:\FOC\Workspace\QBank\22198.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22198.md`.
- Public-safe data check passed: no `C:\`, `QBank`, `Finished`, `qbank_path`, `transform_path`, or `selected_path` strings in the new app payload/route.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with `/Jesuslovesyou/evidence-pilot-01/seeds/22198`.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22198`
  - `http://127.0.0.1:3001/sitemap.xml`
- Seed page link verified: `/Jesuslovesyou/evidence-pilot-01/seeds` contains `/Jesuslovesyou/evidence-pilot-01/seeds/22198`.
- Rendered DOM verification passed:
  - `Dying Declaration: Civil-or-Criminal Scope` present
  - source code `35030200` present
  - `GK-EVIDENCE-DYING-DECL-01` present
  - `LeadMe steps` present
  - `Scope Flip` drill present
  - `C / correct` present
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22198-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22198-mobile.png`
