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

## Implementation Slice 8 - All Seed Review Routes

- [x] Reuse `C:\barmatrix-app\lib\jesuslovesyou\evidence-seed-candidates.json` for route params.
- [x] Prerender every Evidence seed candidate at `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]`.
- [x] Keep Q22198 as the only fully authored case study for now.
- [x] Add a public-safe fallback review-row page for unreviewed seed candidates.
- [x] Link every seed card to its review route.
- [x] Add all seed review routes to `sitemap.xml`.
- [x] Verify lint, build, sample HTTP routes, sitemap counts, and rendered fallback/detail content.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - All Seed Review Routes - 2026-07-01

- App local commit: `0e1f0a3 Add Evidence seed review routes`.
- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App seed page updated: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\seeds\page.tsx`.
- App dynamic route updated: `C:\barmatrix-app\app\Jesuslovesyou\evidence-pilot-01\seeds\[questionId]\page.tsx`.
- App sitemap updated: `C:\barmatrix-app\app\sitemap.ts`.
- Public-safe data check passed: no `C:\`, `QBank`, `Finished`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14824`
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22198`
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14824`
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/22198`
- Seed page rendered link counts:
  - authored case-study links: 1
  - review-row links: 49
  - total seed links: 50
- Fallback rendered DOM verification for Q14824 passed:
  - queued-review title present
  - Q14824 present
  - `42%` present
  - recommended code `31010107` present
  - review status present
  - next authoring lock present
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-seed-14824-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-seed-14824-mobile.png`

## Implementation Slice 9 - Q14823 Witness-Attack Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14823.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14823.md`.
- [x] Add public-safe Q14823 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14823.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14823 Witness-Attack Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `db0e552 Add Evidence Q14823 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14823.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14823.md`.
- Q14823 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14823`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14823`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14823`
- Rendered DOM verification passed:
  - `Witness Truthfulness: Bias vs. Specific Acts` present
  - `14823_COASTAL_BAKERY` present
  - recommended/source code `31010406` present
  - `B / correct` present
  - `GK-EVIDENCE-WITNESS-SPECIFIC-ACT-01` present
  - `GK-EVIDENCE-BIAS-MOTIVE-EXTRINSIC-01` present
  - `LeadMe steps` present
  - `Specific Act Bar` drill present
- Seed page link counts:
  - authored case-study links: 2
  - review-row links: 48
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14823-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14823-mobile.png`

## Implementation Slice 10 - Q14824 Preliminary-Question Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14824.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14824.md`.
- [x] Add public-safe Q14824 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14824.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14824 Preliminary-Question Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `3142cbe Add Evidence Q14824 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14824.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14824.md`.
- Q14824 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14824`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14824`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14824`
- Rendered DOM verification passed:
  - `Preliminary Questions: Judge May Consider Hearsay` present
  - `14824_BANNER_DRONE` present
  - recommended/source code `31010107` present
  - `B / correct` present
  - `GK-EVIDENCE-PRELIM-HEARSAY-01` present
  - `GK-EVIDENCE-DYING-CIVIL-02` present
  - `LeadMe steps` present
  - `Layer Lock` drill present
- Seed page link counts:
  - authored case-study links: 3
  - review-row links: 47
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14824-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14824-mobile.png`

## Implementation Slice 11 - Q14763 Non-Hearsay Notice Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14763.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14763.md`.
- [x] Add public-safe Q14763 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14763.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14763 Non-Hearsay Notice Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `2d1728d Add Evidence Q14763 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14763.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14763.md`.
- Q14763 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14763`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14763`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14763`
- Rendered DOM verification passed:
  - `Non-Hearsay Purpose: Notice Is Not Truth` present
  - `14763_PUPPET_CAMP_NOTICE` present
  - recommended/source code `33040203` present
  - `C / correct` present
  - `GK-EVIDENCE-NOTICE-NONHEARSAY-01` present
  - `SK-EVIDENCE-NONHEARSAY-THRESHOLD-01` present
  - `LeadMe steps` present
  - `Purpose Pin` drill present
- Seed page link counts:
  - authored case-study links: 4
  - review-row links: 46
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14763-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14763-mobile.png`

## Implementation Slice 12 - Q14772 Non-Hearsay Identity Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14772.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14772.md`.
- [x] Add public-safe Q14772 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14772.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14772 Non-Hearsay Identity Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `ce937f0 Add Evidence Q14772 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14772.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14772.md`.
- Q14772 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14772`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14772`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14772`
- Rendered DOM verification passed:
  - `Non-Hearsay Purpose: Identity from a Name` present
  - `14772_FISHING_VESSEL_LOG` present
  - recommended/source code `33040203` present
  - `C / correct` present
  - `GK-EVIDENCE-NONHEARSAY-PURPOSE-01` present
  - `SK-EVIDENCE-PURPOSE-OF-OFFER-01` present
  - `LeadMe steps` present
  - `Purpose Identification` drill present
- Seed page link counts:
  - authored case-study links: 5
  - review-row links: 45
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14772-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14772-mobile.png`

## Implementation Slice 13 - Q14778 Non-Hearsay Purpose Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14778.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14778.md`.
- [x] Add public-safe Q14778 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14778.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14778 Non-Hearsay Purpose Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `293a426 Add Evidence Q14778 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14778.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14778.md`.
- Q14778 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14778`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14778`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14778`
- Rendered DOM verification passed:
  - `Non-Hearsay Purpose: Reason for Refusal` present
  - `14778_RETREAT_LOADING_WARNING` present
  - recommended/source code `33040203` present
  - `C / correct` present
  - `GK-EVIDENCE-NONHEARSAY-PURPOSE-01` present
  - `SK-EVIDENCE-PURPOSE-OF-OFFER-01` present
  - `LeadMe steps` present
  - `Purpose Sort` drill present
- Seed page link counts:
  - authored case-study links: 6
  - review-row links: 44
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14778-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14778-mobile.png`

## Implementation Slice 14 - Q14808 Non-Hearsay Effect Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14808.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14808.md`.
- [x] Add public-safe Q14808 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14808.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14808 Non-Hearsay Effect Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `fc674b0 Add Evidence Q14808 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14808.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14808.md`.
- Q14808 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14808`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14808`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14808`
- Rendered DOM verification passed:
  - `Non-Hearsay Purpose: Effect on the Listener` present
  - `14808_CHRISTIAN-RADIO-DISPATCH` present
  - recommended/source code `33040203` present
  - `C / correct` present
  - `GK-EVIDENCE-EFFECT-ON-LISTENER-01` present
  - `SK-EVIDENCE-CALL-LOCK-01` present
  - `LeadMe steps` present
  - `Effect Classification` drill present
- Seed page link counts:
  - authored case-study links: 7
  - review-row links: 43
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14808-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14808-mobile.png`

## Implementation Slice 15 - Q14836 Witness Truthfulness Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14836.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14836.md`.
- [x] Add public-safe Q14836 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14836.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14836 Witness Truthfulness Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `3d4e691 Add Evidence Q14836 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14836.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14836.md`.
- Q14836 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14836`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14836`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14836`
- Rendered DOM verification passed:
  - `Witness Truthfulness: Extrinsic Evidence Bar` present
  - `14836_PICNIC_ALIBI` present
  - recommended/source code `31010406` present
  - `A / correct` present
  - `GK-EVID-EXTRINSIC-01` present
  - `SK-EVID-ARRAY-01` present
  - `LeadMe steps` present
  - `Spot the Separate Witness` drill present
- Seed page link counts:
  - authored case-study links: 8
  - review-row links: 42
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14836-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14836-mobile.png`

## Implementation Slice 16 - Q14848 Witness Opinion Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14848.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14848.md`.
- [x] Add public-safe Q14848 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14848.
- [x] Commit only the scoped app changes after verification.

## Implementation Evidence - Q14848 Witness Opinion Case Study - 2026-07-01

- App data updated: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local commit: `5d2ea99 Add Evidence Q14848 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14848.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14848.md`.
- Q14848 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14848`.
- Public-safe data check passed: no `C:\`, `QBank`, `\Finished\`, `qbank_path`, `transform_path`, or `selected_path` strings in the app seed/detail route files.
- Verification passed: `git -C C:\barmatrix-app diff --check`.
- Verification passed: `npm run lint` in `C:\barmatrix-app`.
- Verification passed: `npm run build` in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/evidence-pilot-01/seeds/[questionId]` with 50 generated paths.
- HTTP 200 verified for:
  - `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14848`
  - `http://127.0.0.1:3001/sitemap.xml`
- Sitemap verification:
  - seed detail route count: 50
  - contains `/Jesuslovesyou/evidence-pilot-01/seeds/14848`
- Rendered DOM verification passed:
  - `Witness Truthfulness: Specific Dishonest Acts on Cross` present
  - `14848_CHOIR_RETREAT_MILEAGE_FORM` present
  - recommended/source code `31010406` present
  - `D / correct` present
  - `GK-EVIDENCE-TRUTHFULNESS-01` present
  - `SK-EVIDENCE-BECAUSE-CLAUSE-01` present
  - `LeadMe steps` present
  - `Because-Clause Target` drill present
- Seed page link counts:
  - authored case-study links: 9
  - review-row links: 41
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14848-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14848-mobile.png`

## Implementation Slice 17 - Q14844 Witness Truthfulness Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14844.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14844.md`.
- [x] Reconcile key/source conflict: source key `A`, seed/header key `C`, transform body/C3 key `B`; the public payload uses the coherent cross-examination question with `B` credited and keeps the barred transcript as a trap/lock.
- [x] Add public-safe Q14844 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14844.
- [x] Commit only the scoped app changes after verification.

Review:

- App local-only commit: `0d62bc2 Add Evidence Q14844 case study`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts` and `C:\barmatrix-app\lib\jesuslovesyou\evidence-seed-candidates.json`.
- Seed-list correction: only Q14844 changed from seed key `C` to `B`; Q14824 and Q14829 were rechecked against HEAD and left unchanged.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14844`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14844`
  - Playwright DOM checks found 8 required Q14844 strings, `10` authored case-study links, and `40` review rows.
  - Public-safe scan over changed app data returned `NO_HITS`.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14844-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14844-mobile.png`

## Implementation Slice 18 - Q14807 Non-Hearsay Notice Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14807.md`.
- [x] Check transformed CQ file: `C:\FOC\Workspace\Finished\CQ14807.md` is not present.
- [x] Add public-safe Q14807 detail payload to the app from the source rule.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14807.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `f569d63 Add Evidence Q14807 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14807.md`.
- Transform status: `C:\FOC\Workspace\Finished\CQ14807.md` was absent, so the public case study was authored directly from the source rule.
- Q14807 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14807`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14807`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14807`
  - Playwright DOM checks found 8 required Q14807 strings, `11` authored case-study links, and `39` review rows.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14807-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14807-mobile.png`

## Implementation Slice 19 - Q22232 Religion-Credibility Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22232.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22232.md`.
- [x] Recode note: source code `31010502`, recommended code `31010406`; FRE 610 truthfulness/credibility rule controls.
- [x] Add public-safe Q22232 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22232.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `fd1982a Add Evidence Q22232 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22232.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22232.md`.
- Public-safe source cleanup: the crude source organization name was not used; app scan for that source wording returned `NO_HITS`.
- Q22232 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22232`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22232`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22232`
  - Playwright DOM checks found 9 required Q22232 strings, `12` authored case-study links, and `38` review rows.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22232-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22232-mobile.png`

## Implementation Slice 20 - Q14765 Bias Leniency-Promise Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14765.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14765.md`.
- [x] Add public-safe Q14765 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14765.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `8ebf173 Add Evidence Q14765 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14765.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14765.md`.
- Q14765 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14765`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14765`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14765`
  - Playwright DOM checks found 8 required Q14765 strings, `13` authored case-study links, and `37` review rows.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14765-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14765-mobile.png`

## Implementation Slice 21 - Q14826 Declarant Bias Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14826.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14826.md`.
- [x] Add public-safe Q14826 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14826.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `82a2722 Add Evidence Q14826 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14826.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14826.md`.
- Q14826 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14826`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14826`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14826`
  - Playwright DOM checks found 8 required Q14826 strings, `14` authored case-study links, and `36` review rows.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14826-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14826-mobile.png`

## Implementation Slice 22 - Q14830 Insurance Bias-Purpose Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14830.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14830.md`.
- [x] Add public-safe Q14830 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14830.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c202dfb Add Evidence Q14830 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14830.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14830.md`.
- Q14830 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14830`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14830`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14830`
  - Playwright DOM checks found 8 required Q14830 strings.
  - App data count found `15` authored case studies, `50` seed candidates, and `35` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14830-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14830-mobile.png`

## Implementation Slice 23 - Q14829 Confession-Hearing Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14829.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14829.md`.
- [x] Add public-safe Q14829 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14829.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `567760c Add Evidence Q14829 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14829.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14829.md`.
- Q14829 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14829`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14829`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14829`
  - Playwright DOM checks found 8 required Q14829 strings.
  - App data count found `16` authored case studies, `50` seed candidates, and `34` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14829-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14829-mobile.png`

## Implementation Slice 24 - Q14834 Dying-Declaration Foundation Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14834.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14834.md`.
- [x] Add public-safe Q14834 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14834.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c0d5159 Add Evidence Q14834 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14834.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14834.md`.
- Q14834 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14834`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14834`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14834`
  - Playwright DOM checks found 8 required Q14834 strings.
  - App data count found `17` authored case studies, `50` seed candidates, and `33` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14834-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14834-mobile.png`

## Implementation Slice 25 - Q14835 Expert-Qualification Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14835.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14835.md`.
- [x] Add public-safe Q14835 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14835.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `f3d937f Add Evidence Q14835 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14835.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14835.md`.
- Q14835 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14835`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14835`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14835`
  - Playwright DOM checks found 8 required Q14835 strings.
  - App data count found `18` authored case studies, `50` seed candidates, and `32` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14835-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14835-mobile.png`

## Implementation Slice 26 - Q14837 Dying-Declaration Hearing Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14837.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14837.md`.
- [x] Add public-safe Q14837 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14837.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `39369c4 Add Evidence Q14837 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14837.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14837.md`.
- Q14837 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14837`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14837`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14837`
  - Playwright DOM checks found 8 required Q14837 strings.
  - App data count found `19` authored case studies, `50` seed candidates, and `31` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14837-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14837-mobile.png`

## Implementation Slice 27 - Q14825 Refreshing-Recollection Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14825.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14825.md`.
- [x] Add public-safe Q14825 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14825.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c46345d Add Evidence Q14825 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14825.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14825.md`.
- Q14825 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14825`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14825`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14825`
  - Playwright DOM checks found 8 required Q14825 strings.
  - App data count found `20` authored case studies, `50` seed candidates, and `30` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14825-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14825-mobile.png`

## Implementation Slice 28 - Q17318 Refreshing-Recollection Calendar Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17318.md`.
- [x] Confirmed no transformed CQ file exists: `C:\FOC\Workspace\Finished\CQ17318.md`.
- [x] Confirmed seed CSV marks `has_finished_transform` as `False` and leaves `transform_path` empty.
- [x] Add public-safe source-only Q17318 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q17318.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `5809843 Add Evidence Q17318 case study`.
- Source row read: `C:\FOC\Workspace\QBank\17318.md`.
- Transform status: no `C:\FOC\Workspace\Finished\CQ17318.md`; seed CSV has `has_finished_transform=False` and empty `transform_path`.
- Q17318 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17318`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17318`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/17318`
  - Playwright DOM checks found 8 required Q17318 strings.
  - App data count found `21` authored case studies, `50` seed candidates, and `29` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17318-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17318-mobile.png`

## Implementation Slice 29 - Q18076 Refreshing-Recollection Attorney-Notes Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\18076.md`.
- [x] Confirmed no transformed CQ file exists: `C:\FOC\Workspace\Finished\CQ18076.md`.
- [x] Confirmed seed CSV marks `has_finished_transform` as `False` and leaves `transform_path` empty.
- [x] Add public-safe source-only Q18076 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q18076.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `6881768 Add Evidence Q18076 case study`.
- Source row read: `C:\FOC\Workspace\QBank\18076.md`.
- Transform status: no `C:\FOC\Workspace\Finished\CQ18076.md`; seed CSV has `has_finished_transform=False` and empty `transform_path`.
- Q18076 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/18076`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/18076`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/18076`
  - Playwright DOM checks found 8 required Q18076 strings.
  - App data count found `22` authored case studies, `50` seed candidates, and `28` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q18076-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q18076-mobile.png`

## Implementation Slice 30 - Q22211 Business-Records Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22211.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22211.md`.
- [x] Add public-safe Q22211 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22211.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `41b3e69 Add Evidence Q22211 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22211.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22211.md`.
- Q22211 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22211`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22211`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22211`
  - Playwright DOM checks found 8 required Q22211 strings.
  - App data count found `23` authored case studies, `50` seed candidates, and `27` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22211-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22211-mobile.png`

## Implementation Slice 31 - Q22227 Refreshing-Recollection Notes Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22227.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22227.md`.
- [x] Add public-safe Q22227 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22227.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `e062058 Add Evidence Q22227 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22227.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22227.md`.
- Q22227 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22227`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22227`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22227`
  - Playwright DOM checks found 8 required Q22227 strings.
  - App data count found `24` authored case studies, `50` seed candidates, and `26` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22227-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22227-mobile.png`

## Implementation Slice 32 - Q14840 Bias-Impeachment Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14840.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14840.md`.
- [x] Add public-safe Q14840 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14840.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `2422be3 Add Evidence Q14840 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14840.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14840.md`.
- Q14840 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14840`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14840`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14840`
  - Playwright DOM checks found 8 required Q14840 strings.
  - App data count found `25` authored case studies, `50` seed candidates, and `25` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14840-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14840-mobile.png`

## Implementation Slice 33 - Q14852 Bias-Motive Cross-Examination Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14852.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14852.md`.
- [x] Add public-safe Q14852 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14852.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c1e5d63 Add Evidence Q14852 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14852.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14852.md`.
- Q14852 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14852`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14852`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14852`
  - Playwright DOM checks found 8 required Q14852 strings.
  - App data count found `26` authored case studies, `50` seed candidates, and `24` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14852-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14852-mobile.png`

## Implementation Slice 34 - Q14872 Rule-403 Fit Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14872.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14872.md`.
- [x] Add public-safe Q14872 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14872.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `f496b80 Add Evidence Q14872 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14872.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14872.md`.
- Q14872 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14872`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14872`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14872`
  - Playwright DOM checks found 8 required Q14872 strings.
  - App data count found `27` authored case studies, `50` seed candidates, and `23` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14872-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14872-mobile.png`

## Implementation Slice 35 - Q14875 Rule-403 Exclusion Factors Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14875.md`.
- [x] Check transformed CQ file: `C:\FOC\Workspace\Finished\CQ14875.md` was not present, so this slice uses a fresh public-safe paraphrase from the source row.
- [x] Add public-safe Q14875 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14875.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `1720e0f Add Evidence Q14875 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14875.md`.
- Transform check: `C:\FOC\Workspace\Finished\CQ14875.md` was missing; Q14875 content is a fresh public-safe paraphrase from the source row.
- Q14875 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14875`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14875`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14875`
  - Playwright DOM checks found 8 required Q14875 strings.
  - App data count found `28` authored case studies, `50` seed candidates, and `22` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14875-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14875-mobile.png`

## Implementation Slice 36 - Q14899 Polygraph-Reference Rule-403 Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14899.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14899.md`.
- [x] Add public-safe Q14899 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14899.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `785040a Add Evidence Q14899 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14899.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14899.md`.
- Q14899 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14899`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14899`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14899`
  - Playwright DOM checks found 8 required Q14899 strings.
  - App data count found `29` authored case studies, `50` seed candidates, and `21` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14899-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14899-mobile.png`

## Implementation Slice 37 - Q17130 Bias Mini-Trial Rule-403 Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17130.md`.
- [x] Check transformed CQ file: `C:\FOC\Workspace\Finished\CQ17130.md` was not present, so this slice uses a fresh public-safe paraphrase from the source row.
- [x] Add public-safe Q17130 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q17130.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `d3b645c Add Evidence Q17130 case study`.
- Source row read: `C:\FOC\Workspace\QBank\17130.md`.
- Transform check: `C:\FOC\Workspace\Finished\CQ17130.md` was missing; Q17130 content is a fresh public-safe paraphrase from the source row.
- Q17130 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17130`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17130`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/17130`
  - Playwright DOM checks found 8 required Q17130 strings.
  - App data count found `30` authored case studies, `50` seed candidates, and `20` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17130-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17130-mobile.png`

## Implementation Slice 38 - Q18503 Stipulated-Status Rule-403 Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\18503.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ18503.md`.
- [x] Add public-safe Q18503 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q18503.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `fbe0087 Add Evidence Q18503 case study`.
- Source row read: `C:\FOC\Workspace\QBank\18503.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ18503.md`.
- Q18503 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/18503`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/18503`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/18503`
  - Playwright DOM checks found 8 required Q18503 strings.
  - App data count found `31` authored case studies, `50` seed candidates, and `19` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q18503-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q18503-mobile.png`

## Implementation Slice 39 - Q14873 404(b) Intent/Accident Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14873.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14873.md`.
- [x] Add public-safe Q14873 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14873.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `7445f3f Add Evidence Q14873 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14873.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14873.md`.
- Q14873 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14873`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14873`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14873`
  - Playwright DOM checks found 8 required Q14873 strings.
  - App data count found `32` authored case studies, `50` seed candidates, and `18` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14873-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14873-mobile.png`

## Implementation Slice 40 - Q14883 404(b) Motive/Threat Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14883.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14883.md`.
- [x] Add public-safe Q14883 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14883.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `53842a0 Add Evidence Q14883 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14883.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14883.md`.
- Q14883 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14883`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14883`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14883`
  - Playwright DOM checks found 8 required Q14883 strings.
  - App data count found `33` authored case studies, `50` seed candidates, and `17` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14883-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14883-mobile.png`

## Implementation Slice 41 - Q14896 404(b) No-Bridge Propensity Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14896.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14896.md`.
- [x] Add public-safe Q14896 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14896.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `fd8b60f Add Evidence Q14896 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14896.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14896.md`.
- Recode boundary: source outline `32020402`; transformed/seed outline `32020404`.
- Q14896 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14896`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14896`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14896`
  - Playwright DOM checks found 8 required Q14896 strings.
  - App data count found `34` authored case studies, `50` seed candidates, and `16` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14896-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14896-mobile.png`

## Implementation Slice 42 - Q19579 Entrapment Predisposition Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\19579.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ19579.md`.
- [x] Add public-safe Q19579 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q19579.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `5387ba6 Add Evidence Q19579 case study`.
- Source row read: `C:\FOC\Workspace\QBank\19579.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ19579.md`.
- Q19579 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/19579`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/19579`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/19579`
  - Playwright DOM checks found 8 required Q19579 strings.
  - App data count found `35` authored case studies, `50` seed candidates, and `15` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q19579-desktop.png`
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q19579-mobile.png`

## Implementation Slice 43 - Q22231 404(b) Plan/Propensity Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22231.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22231.md`.
- [x] Add public-safe Q22231 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22231.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `52fa7f9 Add Evidence Q22231 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22231.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22231.md`.
- Q22231 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22231`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22231`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22231`
  - Playwright DOM checks found 6 required Q22231 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `36` authored case studies, `50` seed candidates, and `14` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22231-desktop.png` (`527199` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22231-mobile.png` (`492400` bytes)

## Implementation Slice 44 - Q14757 Multiple-Hearsay Transcript Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14757.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14757.md`.
- [x] Add public-safe Q14757 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14757.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `8c7996a Add Evidence Q14757 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14757.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14757.md`.
- Recode boundary: source/seed outline `33040301`; transformed/detail outline `33040103`.
- Q14757 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14757`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14757`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14757`
  - Playwright DOM checks found 6 required Q14757 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `37` authored case studies, `50` seed candidates, and `13` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14757-desktop.png` (`516978` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14757-mobile.png` (`493501` bytes)

## Implementation Slice 45 - Q14767 Statement Against Interest Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14767.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14767.md`.
- [x] Add public-safe Q14767 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14767.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `45f12dd Add Evidence Q14767 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14767.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14767.md`.
- Q14767 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14767`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14767`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14767`
  - Playwright DOM checks found 6 required Q14767 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `38` authored case studies, `50` seed candidates, and `12` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14767-desktop.png` (`478864` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14767-mobile.png` (`449869` bytes)

## Implementation Slice 46 - Q14777 Double-Hearsay Statement Against Interest Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14777.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14777.md`.
- [x] Add public-safe Q14777 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14777.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `1f94691 Add Evidence Q14777 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14777.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14777.md`.
- Q14777 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14777`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14777`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14777`
  - Playwright DOM checks found 6 required Q14777 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `39` authored case studies, `50` seed candidates, and `11` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14777-desktop.png` (`506454` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14777-mobile.png` (`469507` bytes)

## Implementation Slice 47 - Q14781 Statement Against Interest/Privilege Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14781.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14781.md`.
- [x] Reconcile transform key mismatch: seed/frontmatter key `D`; source row, transform official key, residual answer, credited answer, and body explanations all key `C`.
- [x] Add public-safe Q14781 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14781.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `d3d8fcc Add Evidence Q14781 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14781.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14781.md`.
- Key reconciliation: seed/frontmatter key `D` disagreed with source row and transform body; detail page uses correct answer `C`.
- Q14781 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14781`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14781`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14781`
  - Playwright DOM checks found 6 required Q14781 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `40` authored case studies, `50` seed candidates, and `10` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14781-desktop.png` (`492718` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14781-mobile.png` (`459487` bytes)

## Implementation Slice 48 - Q14769 Dual Hearsay Exception Recording Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14769.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14769.md`.
- [x] Add public-safe Q14769 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14769.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c4299a1 Add Evidence Q14769 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14769.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14769.md`.
- Q14769 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14769`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14769`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14769`
  - Playwright DOM checks found 6 required Q14769 strings on desktop and mobile.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `41` authored case studies, `50` seed candidates, and `9` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14769-desktop.png` (`474540` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14769-mobile.png` (`446818` bytes)

## Implementation Slice 49 - Q14791 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14791.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14791.md`.
- [x] Add public-safe Q14791 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14791.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `41e8d65 Add Evidence Q14791 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14791.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14791.md`.
- Q14791 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14791`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14791`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14791`
  - Route HTML contains the Q14791 title, stem signal, correct answer text, and learned-treatise exhibit rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `42` authored case studies, `50` seed candidates, and `8` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14791-desktop.png` (`527140` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14791-mobile.png` (`490086` bytes)

## Implementation Slice 50 - Q22150 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22150.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22150.md`.
- [x] Add public-safe Q22150 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22150.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `56d0944 Add Evidence Q22150 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22150.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22150.md`.
- Key reconciliation: source key `B`; transformed/public detail key `A` after answer shuffle.
- Q22150 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22150`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22150`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22150`
  - Route HTML contains the Q22150 title, stem signal, correct answer text, and excited-utterance stress rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `43` authored case studies, `50` seed candidates, and `7` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22150-desktop.png` (`521900` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22150-mobile.png` (`487715` bytes)

## Implementation Slice 51 - Q22152 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22152.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22152.md`.
- [x] Add public-safe Q22152 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22152.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `d11d7d3 Add Evidence Q22152 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22152.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22152.md`.
- Key reconciliation: source key `A`; transformed/public detail key `C` after answer shuffle.
- Q22152 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22152`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22152`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22152`
  - Route HTML contains the Q22152 title, stem signal, correct answer text, and FRE 803(4) medical-treatment rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `44` authored case studies, `50` seed candidates, and `6` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22152-desktop.png` (`488832` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22152-mobile.png` (`454705` bytes)

## Implementation Slice 52 - Q22157 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22157.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22157.md`.
- [x] Add public-safe Q22157 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22157.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c04977d Add Evidence Q22157 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22157.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22157.md`.
- Key reconciliation: source key `B`; transformed/public detail key `C` after answer shuffle.
- Q22157 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22157`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22157`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22157`
  - Route HTML contains the Q22157 title, stem signal, correct answer text, and FRE 803(3) intent rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `45` authored case studies, `50` seed candidates, and `5` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22157-desktop.png` (`489087` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22157-mobile.png` (`455745` bytes)

## Implementation Slice 53 - Q14863 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14863.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14863.md`.
- [x] Add public-safe Q14863 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q14863.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `c412130 Add Evidence Q14863 case study`.
- Source row read: `C:\FOC\Workspace\QBank\14863.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ14863.md`.
- Key reconciliation: source key `D`; transformed/public detail key `D`.
- Q14863 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14863`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/14863`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/14863`
  - Route HTML contains the Q14863 title, stem signal, correct answer text, and FRE 411 insurance-purpose rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `46` authored case studies, `50` seed candidates, and `4` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14863-desktop.png` (`506850` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q14863-mobile.png` (`471052` bytes)

## Implementation Slice 54 - Q17192 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17192.md`.
- [x] Confirm no transformed CQ file exists for Q17192.
- [x] Add public-safe source-derived Q17192 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q17192.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `b2e71b0 Add Evidence Q17192 case study`.
- Source row read: `C:\FOC\Workspace\QBank\17192.md`.
- Transform boundary: no `C:\FOC\Workspace\Finished\CQ17192.md` exists; seed metadata has `has_finished_transform: false`, so the detail payload is source-derived.
- Key reconciliation: source key `A`; source-derived/public detail key `A`.
- Q17192 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17192`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17192`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/17192`
  - Route HTML contains the Q17192 title, stem signal, correct answer text, and FRE 411 insurance-fault rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `47` authored case studies, `50` seed candidates, and `3` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17192-desktop.png` (`484740` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17192-mobile.png` (`460054` bytes)

## Implementation Slice 55 - Q17761 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17761.md`.
- [x] Confirm no transformed CQ file exists for Q17761.
- [x] Add public-safe source-derived Q17761 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q17761.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `fa9d207 Add Evidence Q17761 case study`.
- Source row read: `C:\FOC\Workspace\QBank\17761.md`.
- Transform boundary: no `C:\FOC\Workspace\Finished\CQ17761.md` exists; seed metadata has `has_finished_transform: false`, so the detail payload is source-derived.
- Key reconciliation: source key `A`; source-derived/public detail key `A`.
- Q17761 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17761`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/17761`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/17761`
  - Route HTML contains the Q17761 title, stem signal, correct answer text, and opened-door insurance rebuttal rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `48` authored case studies, `50` seed candidates, and `2` remaining seeds without detail pages.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17761-desktop.png` (`552006` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q17761-mobile.png` (`510538` bytes)

## Implementation Slice 56 - Q22156 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22156.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22156.md`.
- [x] Add public-safe Q22156 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22156.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `7033a7e Add Evidence Q22156 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22156.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22156.md`.
- Key reconciliation: source key `A`; transformed/public detail key `B` after answer shuffle.
- Outline reconciliation: source outline `31010100`; transformed/public detail outline `35030304`.
- Q22156 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22156`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22156`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22156`
  - Route HTML contains the Q22156 title, stem signal, correct answer text, and FRE 411 ownership-purpose rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
  - App data count found `49` authored case studies, `50` seed candidates, and `1` remaining seed without a detail page.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22156-desktop.png` (`504918` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22156-mobile.png` (`473023` bytes)

## Implementation Slice 57 - Q22229 Evidence Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22229.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ22229.md`.
- [x] Add public-safe Q22229 detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, and rendered detail content.
- [x] Capture desktop and mobile screenshots for Q22229.
- [x] Commit only the scoped app changes after verification.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\evidence-question-details.ts`.
- App local-only commit: `7af1041 Add Evidence Q22229 case study`.
- Source row read: `C:\FOC\Workspace\QBank\22229.md`.
- Transform read: `C:\FOC\Workspace\Finished\CQ22229.md`.
- Key reconciliation: source key `A`; transformed/public detail key `B` after answer shuffle.
- Outline reconciliation: source outline `35030304`; transformed/public detail outline `35030304`.
- Q22229 detail route: `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22229`.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/evidence-question-details.ts`
  - public-safe scan over app seed/detail data returned `NO_HITS`
  - `npx tsx` app data count returned `50` authored case studies, `50` seed candidates, and `0` remaining seeds without detail pages.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for `http://127.0.0.1:3001/Jesuslovesyou/evidence-pilot-01/seeds/22229`
  - `sitemap.xml` includes `/Jesuslovesyou/evidence-pilot-01/seeds/22229`
  - Route HTML contains the Q22229 title, stem signal, correct answer text, and FRE 411 negligence/fault rule.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22229-desktop.png` (`490294` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-evidence-q22229-mobile.png` (`461609` bytes)

## Implementation Slice 58 - Con Law Pilot Inventory

- [x] Re-read Con Law registry and first-group pilot spec.
- [x] Check exact-code availability for the six planned Con Law selectors.
- [x] Confirm Due Process needs child-code selection because exact code `44040200` has `0` local QBank rows.
- [x] Add the smallest reusable Con Law inventory builder.
- [x] Generate and verify Con Law inventory + 30 seed candidates.
- [x] Record output paths and counts.

Review:

- Added script: `C:\PDJ\scripts\Build-ConLawPilotInventory.ps1`.
- Generated output folder: `C:\PDJ\output\conlaw-pilot-01`.
- Exact-code availability check:
  - `43020201`: `90` local QBank rows.
  - `44040100`: `9` local QBank rows.
  - `44040200`: `0` local QBank rows; child-code prefix `440402` has `62` local QBank rows across `44040201`, `44040202`, and `44040203`.
  - `44040300`: `17` exact local QBank rows, plus child-code rows under `440403`.
  - `44040501`: `49` local QBank rows.
  - `44040502`: `78` local QBank rows.
- Verification passed:
  - `pwsh -NoProfile -File C:\PDJ\scripts\Build-ConLawPilotInventory.ps1 -Verify`
  - PowerShell parser check returned `PARSER_OK`.
  - `git -C C:\PDJ diff --check`
  - JSON parse/count check returned `489` inventory rows and `30` seed candidates.
  - Seed candidates are balanced at `5` each for selectors `43020201`, `44040100`, `44040200`, `44040300`, `44040501`, and `44040502`.
- Output artifacts:
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_inventory.json`
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_inventory.csv`
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_inventory_summary.md`
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_seed_candidates.json`
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_seed_candidates.csv`
  - `C:\PDJ\output\conlaw-pilot-01\conlaw_pilot_01_seed_candidates.md`

## Implementation Slice 59 - Con Law Seed Route Surface

- [x] Confirm app route/data pattern from the existing Evidence pilot.
- [x] Strip Con Law candidate data to public-safe fields only.
- [x] Add Con Law seed data/helper and `/Jesuslovesyou/conlaw-pilot-01` route surface.
- [x] Add Con Law routes to sitemap and homepage discovery.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, route content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope:
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-seed-candidates.json`
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-seed-candidates.ts`
  - `C:\barmatrix-app\lib\jesuslovesyou\pilot-data.ts`
  - `C:\barmatrix-app\app\Jesuslovesyou\page.tsx`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\page.tsx`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\[code]\page.tsx`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\seeds\page.tsx`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\seeds\[questionId]\page.tsx`
  - `C:\barmatrix-app\app\sitemap.ts`
- App local-only commit: `ee9ce43 Add Con Law seed route surface`.
- Data boundary: app Con Law JSON includes only public-safe candidate fields and excludes local source paths.
- Routes added:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01`
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds`
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/44040200`
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14293`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe scan over new Con Law data/routes returned `NO_HITS`
  - `npx tsx` import/count check returned `30` candidates, `30` question params, `6` code params, and `5` seed rows per selector.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Con Law seed list, review row `14293`, selector node `44040200`, and `sitemap.xml`.
  - Route HTML contains the Con Law seed-list headline, count, Q14293 ID, due-process/equal-protection routing text, review-row title, selector code, and sitemap Con Law URLs.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found no obvious overlap or broken layout on desktop/mobile.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-seeds-desktop.png` (`314686` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-seeds-mobile.png` (`489361` bytes)

## Implementation Slice 60 - Q14293 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14293.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14293.md`.
- [x] Add public-safe Q14293 Con Law detail payload to the app.
- [x] Render Q14293 as a full case study on the existing Con Law seed route.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope:
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\seeds\page.tsx`
  - `C:\barmatrix-app\app\Jesuslovesyou\conlaw-pilot-01\seeds\[questionId]\page.tsx`
- App local-only commit: `4658fb8 Add Con Law Q14293 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14293.md`.
  - Read-only transformed CQ: `C:\FOC\Workspace\Finished\CQ14293.md`.
  - Source key: `C`; transformed/public detail key: `B` after answer shuffle.
  - Outline lock: selector/source/selected code `43020201`.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14293`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check`
  - public-safe/source-leak scan over the three changed app files returned clean.
  - `npx tsx` import/count check returned `1` Con Law detail; Q14293 has key `B`, `4` choices, `4` locks, `3` keys, and `3` drill seeds.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14293 detail route; route HTML contains `Mootness Ends the Streaming Fight`, `Timothy`, `Grant the motion`, `GK-CONLAW-MOOT-01`, and `Article III`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14293`.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found the full case-study sections rendered on desktop/mobile without obvious blank state or overlap.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14293-desktop.png` (`537254` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14293-mobile.png` (`502659` bytes)

## Implementation Slice 61 - Q14294 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14294.md`.
- [x] Read transformed CQ file: `C:\FOC\Workspace\Finished\CQ14294.md`.
- [x] Add public-safe Q14294 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `c236569 Add Con Law Q14294 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14294.md`.
  - Read-only transformed CQ: `C:\FOC\Workspace\Finished\CQ14294.md`.
  - Source key: `C`; transformed/public detail key: `B` after answer shuffle.
  - Outline lock: selector/source/selected code `43020201`.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14294`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over `conlaw-question-details.ts` returned clean.
  - `npx tsx` import/count check returned `2` Con Law details, `30` seed candidates, and `28` remaining seeds without detail pages; Q14294 has key `B`, `4` choices, `4` locks, `3` keys, and `3` drill seeds.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14294 detail route; route HTML contains `State Ground Ends Federal Review`, `Peter`, `Dismiss the writ`, `GK-CONLAW-STATE-GROUNDS-01`, and `independent and adequate state`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14294`.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found the full case-study sections rendered on desktop/mobile without obvious blank state or overlap.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14294-desktop.png` (`610764` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14294-mobile.png` (`588896` bytes)

## Implementation Slice 62 - Q20714 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\20714.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ20714_updated.md`.
- [x] Add public-safe Q20714 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `d68bdcb Add Con Law Q20714 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\20714.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ20714_updated.md`.
  - Source key: `B`; transformed/public detail key: `D` after answer shuffle.
  - Outline lock: selector/source/selected code `43020201`.
  - Current-law spot check: Constitution Annotated and Flast v. Cohen confirm the narrow federal taxpayer standing exception for congressional spending challenged under the Establishment Clause.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/20714`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over `conlaw-question-details.ts` returned clean.
  - `npx tsx` import/count check returned `3` Con Law details, `30` seed candidates, and `27` remaining seeds without detail pages; Q20714 has key `D`, `4` choices, `4` locks, `3` keys, and `3` drill seeds.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q20714 detail route; route HTML contains `Taxpayer Standing Has a Narrow Door`, `Lydia`, `specific constitutional limit`, `GK-CONLAW-FLAST-SPENDING-01`, and `taxpayer-standing exception`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/20714`.
  - Playwright CLI captured desktop and mobile screenshots.
  - Visual screenshot inspection found the full case-study sections rendered on desktop/mobile without obvious blank state or overlap.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20714-desktop.png` (`543410` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20714-mobile.png` (`512373` bytes)

## Implementation Slice 63 - Q22590 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22590.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ22590.md`.
- [x] Add public-safe Q22590 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `89bc410 Add Con Law Q22590 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\22590.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ22590.md`.
  - Source key: `C`; transformed/public detail key: `A` after answer shuffle.
  - Outline lock: selector/source/selected code `43020201`.
  - Current-law spot check: Constitution Annotated, Texas v. United States, and American Trucking Associations v. City of Los Angeles confirm ripeness fails when the alleged injury depends on contingent future enforcement.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/22590`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over `conlaw-question-details.ts` returned clean.
  - `npx tsx` import/count check returned `4` Con Law details, `30` seed candidates, and `26` remaining seeds without detail pages; Q22590 has key `A`, `4` choices, `4` locks, `3` keys, and `3` drill seeds.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q22590 detail route; route HTML contains `Ripeness Before Merits`, `Good Neighbor Shuttle`, `Claim depends on penalties the city has not imposed`, `GK-CONLAW-RIPENESS-CONTINGENT-01`, and `ripeness`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/22590`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22590-desktop.png` (`1440x4282`, `504349` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22590-mobile.png` (`390x8540`, `477062` bytes)

## Implementation Slice 64 - Q22611 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22611.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ22611.md`.
- [x] Identify transform/body key mismatch: source key `A`; transformed body/YAML/JSON key `B`; transform frontmatter and app seed record incorrectly report `C`.
- [x] Add public-safe Q22611 Con Law detail payload and correct app seed key to `B`.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope:
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-seed-candidates.json`
- App local-only commit: `7769c26 Add Con Law Q22611 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\22611.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ22611.md`.
  - Source key: `A`; transformed body/YAML/JSON key: `B` after answer shuffle.
  - Transform frontmatter and prior app seed record incorrectly reported `C`; app seed key corrected to `B`.
  - Public detail keeps the tested ripeness mechanics but uses a state-actor roster frame, because the CQ private-church surface created an avoidable state-action issue outside the tested rule.
  - Outline lock: selector/source/selected code `43020201`.
  - Current-law spot check: Laird v. Tatum confirms that a subjective chilling effect from a data-gathering practice, without objective harm or a specific future threat, is not a justiciable controversy.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/22611`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts lib/jesuslovesyou/conlaw-seed-candidates.json`
  - public-safe/source-leak scan over Q22611 detail returned clean.
  - `npx tsx` import/count check returned `5` Con Law details, `30` seed candidates, and `25` remaining seeds without detail pages; Q22611 has key `B`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `B`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q22611 detail route; route HTML contains `Speculative Chill Is Not Ripe`, `Community Participation Roster`, `The action is unripe`, `GK-CONLAW-RIPENESS-SPECULATIVE-CHILL-01`, and `Unripe means too early`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/22611`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22611-desktop.png` (`1440x4339`, `496303` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22611-mobile.png` (`390x8409`, `473507` bytes)

## Implementation Slice 65 - Q14231 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14231.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14231.md`.
- [x] Confirm source key `C`, transformed/public detail key `B`, and outline correction from source `44040305` to state-action node `44040100`.
- [x] Add public-safe Q14231 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `4b17031 Add Con Law Q14231 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14231.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14231.md`.
  - Source key: `C`; transformed/public detail key: `B` after answer shuffle.
  - Source row outline code `44040305`; transformed/app seed outline code `44040100` because the credited answer tests state action, not rational-basis classification.
  - Current-law spot check: the Fourteenth Amendment text, Constitution Annotated state-action doctrine, and Jackson v. Metropolitan Edison confirm that equal protection reaches governmental action, not ordinary private pricing by a regulated business.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14231`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q14231 detail returned clean.
  - `npx tsx` import/count check returned `6` Con Law details, `30` seed candidates, and `24` remaining seeds without detail pages; Q14231 has key `B`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `B`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14231 detail route; route HTML contains `State Action Before Scrutiny`, `Covenant Mutual`, `Equal Protection Clause does not apply`, `GK-CONLAW-STATE-ACTION-01`, and `Threshold Before Scrutiny`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14231`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14231-desktop.png` (`1440x4390`, `500416` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14231-mobile.png` (`390x8389`, `471790` bytes)

## Implementation Slice 66 - Q14233 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14233.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14233.md`.
- [x] Confirm source key `C`, transformed/public detail key `A`, and outline correction from source `44040303` to state-action node `44040100`.
- [x] Add public-safe Q14233 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshot.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `51996a2 Add Con Law Q14233 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14233.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14233.md`.
  - Source key: `C`; transformed/public detail key: `A` after answer shuffle.
  - Source row outline code `44040303`; transformed/app seed outline code `44040100` because the credited answer tests state action, not strict scrutiny.
  - Current-law spot check: Constitution Annotated, Blum v. Yaretsky, and Rendell-Baker v. Kohn confirm that public funding/regulation does not make a private entity's own decision state action without state responsibility for the challenged act.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14233`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q14233 detail returned clean.
  - `npx tsx` import/count check returned `7` Con Law details, `30` seed candidates, and `23` remaining seeds without detail pages; Q14233 has key `A`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `A`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14233 detail route; route HTML contains `Public Money Does Not Decide the Act`, `Galilee Nets`, `one-time grant is insufficient`, `GK-CONLAW-STATE-ACTION-GRANT-01`, and `Challenged Act First`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14233`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14233-desktop.png` (`1440x4724`, `586345` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14233-mobile.png` (`390x9340`, `554665` bytes)

## Implementation Slice 67 - Q14237 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14237.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14237.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q14237 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 65]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `7` Con Law details, `30` seed candidates, and `23` remaining; next seed is Q14237 with seed key `C`, outline `44040100`, and coverage group `state_action`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `c46d765 Add Con Law Q14237 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14237.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14237.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040100` for State Action Requirement.
  - App seed key already matched the transformed key `C`; no seed JSON edit was needed.
  - Current-law spot check: Constitution Annotated, Rendell-Baker v. Kohn, and Blum v. Yaretsky confirm that state accreditation, regulation, and public funding do not make a private school's employment decision state action without state responsibility for the challenged firing.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14237`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q14237 detail returned clean.
  - `npx tsx` import/count check returned `8` Con Law details, `30` seed candidates, and `22` remaining seeds without detail pages; Q14237 has key `C`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `C`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14237 detail route; route HTML contains `Funding Is Not the Firing` and `GK-CONLAW-STATE-ACTION-FUNDING-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14237`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14237-desktop.png` (`1440x4493`, `568746` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14237-mobile.png` (`390x9105`, `540960` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q14237 proof artifacts to `origin/main`.

## Implementation Slice 68 - Q14275 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14275.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14275.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q14275 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 66]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `8` Con Law details, `30` seed candidates, and `22` remaining; next seed is Q14275 with seed key `B`, outline `44040100`, and coverage group `state_action`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `abd3333 Add Con Law Q14275 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14275.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14275.md`.
  - Source key: `D`; transformed/public detail key: `B` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040100` for State Action Requirement.
  - App seed key already matched the transformed key `B`; no seed JSON edit was needed.
  - Current-law spot check: Constitution Annotated, Moose Lodge, Blum, Lugar, Brentwood, and Roberts support the threshold frame that neutral public-facility use does not itself make a private group's internal rule state action, while absolute association-rights immunity would overclaim.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14275`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q14275 detail returned clean.
  - `npx tsx` import/count check returned `9` Con Law details, `30` seed candidates, and `21` remaining seeds without detail pages; Q14275 has key `B`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `B`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14275 detail route; route HTML contains `Public Venue Is Not State Action`, `GK-CONLAW-STATE-ACTION-PUBLIC-VENUE-01`, and the credited answer text.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14275`.
  - Playwright CLI captured desktop and mobile screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14275-desktop.png` (`1440x4577`, `548820` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14275-mobile.png` (`390x8897`, `508691` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q14275 proof artifacts to `origin/main`.

## Implementation Slice 69 - Q18457 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\18457.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ18457.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q18457 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 67]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `9` Con Law details, `30` seed candidates, and `21` remaining; next seed is Q18457 with seed key `C`, outline `44040100`, and coverage group `state_action`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `f65229a Add Con Law Q18457 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\18457.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ18457.md`.
  - Source key: `A`; transformed/public detail key: `C` after answer shuffle.
  - Raw source row listed outline code `44040300`, while the transformed CQ and app seed classify Q18457 under `44040100` State Action Requirement.
  - App seed key already matched the transformed key `C`; no seed JSON edit was needed.
  - Current-law spot check: Constitution Annotated, Civil Rights Cases, Jackson, Burton, and Brentwood support the threshold frame that the Fourteenth Amendment reaches government action, and seemingly private conduct requires a close enough attribution bridge before scrutiny tiers matter.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/18457`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q18457 detail returned clean.
  - `npx tsx` import/count check returned `10` Con Law details, `30` seed candidates, and `20` remaining seeds without detail pages; Q18457 has key `C`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `C`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q18457 detail route; route HTML contains `Threshold Before Scrutiny`, the credited answer text, and `GK-CONSTITUTIONAL-LAW-LYDIA-BOOK-CLUB-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/18457`.
  - Playwright CLI captured desktop and mobile full-page screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q18457-desktop.png` (`1440x4341`, `497315` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q18457-mobile.png` (`390x8428`, `467012` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q18457 proof artifacts to `origin/main` in commit `cb6121a`.

## Implementation Slice 70 - Q17114 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17114.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17114.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q17114 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 68]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `10` Con Law details, `30` seed candidates, and `20` remaining; next seed is Q17114 with seed key `C`, outline `44040201`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `a83345d Add Con Law Q17114 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17114.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17114.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040201` for Incorporation of Bill of Rights through the Fourteenth Amendment.
  - App seed key already matched the transformed key `C`; no seed JSON edit was needed.
  - Current-law spot check: Timbs, Constitution Annotated incorporation tables, and Bajakajian support the route that Excessive Fines is incorporated against states and local governments through Fourteenth Amendment Due Process, while excessiveness still requires a gross-disproportionality merits analysis.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/17114`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q17114 detail returned clean.
  - `npx tsx` import/count check returned `11` Con Law details, `30` seed candidates, and `19` remaining seeds without detail pages; Q17114 has key `C`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `C`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q17114 detail route; route HTML contains `Incorporation Before Proportionality`, the credited answer text, and `GK-CONLAW-FARMSTAND-EXCESSIVE-FINE-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17114`.
  - Playwright CLI captured desktop and mobile full-page screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17114-desktop.png` (`1440x4513`, `545995` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17114-mobile.png` (`390x8932`, `525130` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q17114 proof artifacts to `origin/main`.

## Implementation Slice 71 - Q19280 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\19280.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ19280.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q19280 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 69]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `11` Con Law details, `30` seed candidates, and `19` remaining; next seed is Q19280 with seed key `D`, outline `44040202`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `1c31e95 Add Con Law Q19280 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\19280.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ19280.md`.
  - Source key: `B`; transformed/public detail key: `D` after answer shuffle.
  - Source row listed outline code `44040201`, while transformed CQ and app seed classify Q19280 under `44040202` Punitive Damages.
  - App seed key already matched the transformed key `D`; no seed JSON edit was needed.
  - Current-law spot check: BMW v. Gore and State Farm confirm punitive-damages due process guideposts of reprehensibility, ratio to harm, and comparable civil penalties; Mathews confirms procedural due process balancing is a separate procedure-focused frame.
- Route verified:
  - `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/19280`
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts`
  - public-safe/source-leak scan over Q19280 detail returned clean.
  - `npx tsx` import/count check returned `12` Con Law details, `30` seed candidates, and `18` remaining seeds without detail pages; Q19280 has key `D`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `D`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q19280 detail route; route HTML contains `Guideposts, Not Jury Free Rein`, the credited answer text, and `GK-CONSTITUTIONAL_LAW-PATMOS-RELIC-CHALICE-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/19280`.
  - Playwright CLI captured desktop and mobile full-page screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q19280-desktop.png` (`1440x4360`, `504534` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q19280-mobile.png` (`390x8415`, `490999` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q19280 proof artifacts to `origin/main`.

## Implementation Slice 72 - Q14225 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14225.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14225.md`.
- [x] Reconcile source key, transformed key, seed key, and outline code.
- [x] Add public-safe Q14225 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 70]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `12` Con Law details, `30` seed candidates, and `18` remaining; next seed is Q14225 with seed key `C`, outline `44040203`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `6be3386 Add Con Law Q14225 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14225.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14225.md`.
  - Source key: `A`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040203` for Procedural Due Process.
  - App seed key already matched the transformed key `C`; no seed JSON edit is expected.
  - Current-law spot check: Bell supports treating an issued license as a protected interest before revocation, Goldberg supports confrontation/cross-examination where credibility is central, and Mathews supplies the flexible procedural due process balancing frame.
- Verification in progress:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q14225 detail returned clean.
  - `npx tsx` import/count check returned `13` Con Law details, `30` seed candidates, and `17` remaining seeds without detail pages; Q14225 has key `C`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key is also `C`.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q14225 detail route; route HTML contains `Fair Hearing Means Testing The Witnesses`, the credited answer text, and `GK-CONLAW-DPHEAR-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14225`.
  - Playwright CLI captured desktop and mobile full-page screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14225-desktop.png` (`1440x4646`, `598806` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14225-mobile.png` (`390x9303`, `557690` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q14225 proof artifacts to `origin/main`.

## Implementation Slice 73 - Q17163 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17163.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17163.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q17163 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 71]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `13` Con Law details, `30` seed candidates, and `17` remaining; next seed is Q17163 with seed key `C`, outline `44040203`, selector `44040200`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `da723aa Add Con Law Q17163 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17163.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17163.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Raw source row listed outline code `44040201`, while transformed CQ and app seed classify Q17163 under `44040203` for due process negligent-loss doctrine.
  - App seed key already matched the transformed key `C`; no seed JSON edit is expected.
  - Current-law spot check: Daniels holds that negligent official conduct causing unintended loss or injury does not implicate Due Process; Parratt/Hudson support the postdeprivation-remedy background; County of Sacramento confirms substantive due process targets abusive executive action, not mere carelessness.
- Verification in progress:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q17163 detail returned clean.
  - `npx tsx` import/count check returned `14` Con Law details, `30` seed candidates, and `16` remaining seeds without detail pages; Q17163 has key `C`, selector `44040200`/`child_code`, outline `44040203`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key and selector also match.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q17163 detail route; route HTML contains `Negligence Is Not Due Process`, the credited answer text, and `GK-CONSTITUTIONAL-LAW-PERMIT-FEE-LEDGER-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17163`.
  - Playwright CLI captured desktop and mobile full-page screenshots.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17163-desktop.png` (`1440x4381`, `504534` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17163-mobile.png` (`390x8445`, `486224` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q17163 proof artifacts to `origin/main`.

## Implementation Slice 74 - Q19025 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\19025.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ19025.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q19025 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 72]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `14` Con Law details, `30` seed candidates, and `16` remaining; next seed is Q19025 with seed key `A`, outline `44040203`, selector `44040200`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- App local-only commit: `8827aec Add Con Law Q19025 case study`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\19025.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ19025.md`.
  - Source key: `B`; transformed/public detail key: `A` after answer shuffle.
  - Raw source row listed outline code `44040503` Freedom of the Press, while transformed CQ and app seed classify Q19025 under `44040203` for procedural due process stigma-plus doctrine.
  - App seed key already matched the transformed key `A`; no seed JSON edit is expected.
  - Current-law spot check: Paul v. Davis rejects reputation alone as a due process liberty/property interest; Siegert confirms defamation alone is not a Fourteenth Amendment liberty deprivation; Constantineau is the contrast case where stigma came with a legal restriction; Constitution Annotated summarizes the reputation-plus-statutory-entitlement framing.
- Verification in progress:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q19025 detail returned clean.
  - `npx tsx` import/count check returned `15` Con Law details, `30` seed candidates, and `15` remaining seeds without detail pages; Q19025 has key `A`, selector `44040200`/`child_code`, outline `44040203`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key and selector also match.
  - `npm run lint`
  - `npm run build`
  - HTTP 200 for Q19025 detail route; route HTML contains `Stigma Needs A Plus`, the credited answer text, and `GK-CONLAW-STIGMA-PLUS-01`.
  - HTTP 200 for `sitemap.xml`; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/19025`.
  - Playwright CLI wrote desktop and mobile full-page screenshots; hung CLI cleanup processes were stopped after files were written.
  - PowerShell image probe confirmed non-empty desktop/mobile PNGs with expected dimensions and varied sample pixels.
- Playwright screenshots:
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q19025-desktop.png` (`1440x4413`, `513341` bytes)
  - `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q19025-mobile.png` (`390x8452`, `479723` bytes)
- Private proof push:
  - Verified `origin` as `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git` and GitHub visibility as `PRIVATE` before pushing.
  - Pushed Q19025 proof artifacts to `origin/main`.

## Implementation Slice 75 - Q17157 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17157.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17157.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q17157 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 73]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `15` Con Law details, `30` seed candidates, and `15` remaining; next seed is Q17157 with seed key `C`, outline `44040300`, selector `44040300`/`exact`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17157.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17157.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040300` for Equal Protection.
  - App seed key already matched the transformed key `C`; no seed JSON edit is expected.
  - Current-law spot check: Geduldig controls the constitutional Equal Protection rule that pregnancy classification is not automatically sex classification; the Pregnancy Discrimination Act supplies a separate Title VII statutory rule; the Fourteenth Amendment supplies the Equal Protection Clause text.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q17157 detail returned clean.
  - `npx tsx` import/count check returned `16` Con Law details, `30` seed candidates, and `14` remaining seeds without detail pages; Q17157 has key `C`, selector `44040300`/`exact`, outline `44040300`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key and selector also match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/17157`; route HTML contains `Pregnancy Is Not Automatic Intermediate Scrutiny`, the credited answer, and `GK-CONLAW-EP-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17157`.
  - Chromium direct navigation timed out on the route after the HTTP checks passed, so screenshot proof was taken from the verified route HTML with scripts stripped; desktop and mobile PNGs both render the full Q17157 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17157-desktop.png` (`1440x2804`, `247027` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17157-mobile.png` (`390x5300`, `239853` bytes). Pixel probe found non-white rendered content in both files.
- Local app commit: `d91e8a0` (`Add Con Law Q17157 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q17157 proof artifacts to `origin/main`.

## Implementation Slice 76 - Q14234 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14234.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14234.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q14234 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 74]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `16` Con Law details, `30` seed candidates, and `14` remaining; next seed is Q14234 with seed key `B`, outline `44040301`, selector `44040300`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14234.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14234.md`.
  - Source key: `D`; transformed/public detail key: `B` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040301` for Fundamental rights.
  - App seed selector is parent `44040300` with `child_code` match to transformed outline `44040301`; no seed JSON edit is expected.
  - Current-law spot check: Cleburne confirms ordinary social/economic equal-protection review uses rational-basis scrutiny absent a heightened trigger; Lindsey rejects a constitutional guarantee of particular housing access; Heller places the rational-basis burden on the challenger; the Fourteenth Amendment supplies the Equal Protection Clause text.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q14234 detail returned clean.
  - `npx tsx` import/count check returned `17` Con Law details, `30` seed candidates, and `13` remaining seeds without detail pages; Q14234 has key `B`, selector `44040300`/`child_code`, outline `44040301`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, and outline match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14234`; route HTML contains `No Trigger Means Rational Basis`, `Barnabas House`, `Daniel must prove`, and `GK-CONSTITUTIONAL_LAW-RATIONAL-BASIS-REENTRY-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14234`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the Q17157 fallback because direct Chromium route navigation is unreliable in this app session; desktop and mobile PNGs both render the full Q14234 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14234-desktop.png` (`1440x2730`, `250354` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14234-mobile.png` (`390x5585`, `247717` bytes). Pixel probe found non-white rendered content in both files.
- Local app commit: `063617a` (`Add Con Law Q14234 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q14234 proof artifacts to `origin/main`.

## Implementation Slice 77 - Q17170 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17170.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17170.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q17170 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 75]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `17` Con Law details, `30` seed candidates, and `13` remaining; next seed is Q17170 with seed key `C`, outline `44040303`, selector `44040300`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17170.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17170.md`.
  - Source key: `A`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040303` for Strict scrutiny (suspect) classifications.
  - App seed selector is parent `44040300` with `child_code` match to transformed outline `44040303`; no seed JSON edit is expected.
  - Current-law spot check: Croson and Adarand confirm government racial classifications receive strict scrutiny; SFFA states strict scrutiny asks for a compelling interest and narrow tailoring and recognizes remediation of specific identified unlawful discrimination as a narrow potential compelling interest; strict scrutiny is not automatic invalidity.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q17170 detail returned clean.
  - `npx tsx` import/count check returned `18` Con Law details, `30` seed candidates, and `12` remaining seeds without detail pages; Q17170 has key `C`, selector `44040300`/`child_code`, outline `44040303`, `4` choices, `4` locks, `4` keys, and `3` drill seeds; seed key, selector, and outline match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/17170`; route HTML contains `Strict Scrutiny Is Still A Test`, `Good Samaritan shelter-repair`, `compelling remedial interest and narrow tailoring`, and `GK-CONLAW-RACE-STRICT-SCRUTINY-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17170`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q17170 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17170-desktop.png` (`1440x2649`, `231412` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17170-mobile.png` (`390x5197`, `229016` bytes). Pixel probe found non-white rendered content in both files.
- Local app commit: `78f384b` (`Add Con Law Q17170 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q17170 proof artifacts to `origin/main`.

## Implementation Slice 78 - Q14242 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14242.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14242.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q14242 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 76]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `18` Con Law details, `30` seed candidates, and `12` remaining; next seed is Q14242 with seed key `A`, corrected outline `44040305`, selector `44040300`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14242.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14242.md`.
  - Source key: `B`; transformed/public detail key: `A` after answer shuffle.
  - Raw source row lists outline code `44040301`, but the tested doctrine is rational-basis review; transformed CQ and app seed use corrected outline code `44040305`.
  - App seed selector is parent `44040300` with `child_code` match to corrected outline `44040305`; no seed JSON edit is expected.
  - Current-law spot check: Dukes upheld a local economic vendor ordinance with a grandfather clause under rational-basis review; Williamson supports step-by-step regulation in economic classifications; Constitution Annotated states ordinary non-suspect, non-fundamental-right classifications receive rational-basis review.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q14242 detail returned clean.
  - `npx tsx` import/count check returned `19` Con Law details, `30` seed candidates, and `11` remaining seeds without detail pages; Q14242 has key `A`, selector `44040300`/`child_code`, corrected outline `44040305`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and corrected source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14242`; route HTML contains `Grandfather Lines Get Rational Basis`, `linen-mending cart`, `rational basis test`, and `GK-CONLAW-EP-RATIONAL-BASIS-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14242`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q14242 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14242-desktop.png` (`1440x2637`, `250179` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14242-mobile.png` (`390x5405`, `246855` bytes). Pixel probe found non-white rendered content in both files.
- Local app commit: `b7feab1` (`Add Con Law Q14242 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q14242 proof artifacts to `origin/main`.

## Implementation Slice 79 - Q17680 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17680.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17680.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q17680 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 77]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `19` Con Law details, `30` seed candidates, and `11` remaining; next seed is Q17680 with seed key `A`, outline `44040305`, selector `44040300`/`child_code`, and coverage group `due_process_equal_protection_routing`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17680.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17680.md`.
  - Source key: `B`; transformed/public detail key: `A` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040305` for Rational basis review classifications.
  - App seed selector is parent `44040300` with `child_code` match to outline `44040305`; no seed JSON edit is expected.
  - Transform drift correction: the finished transform made the permit denial explicitly anti-Christian, which risks adding Free Exercise or religious-classification strict-scrutiny issues. The app payload preserves the intended rational-basis-with-bite rule by making the town animus target a transitional recovery residence, not a religious classification.
  - Current-law spot check: Moreno and Romer confirm bare animus toward an unpopular group is not a legitimate government interest; Cleburne confirms unsupported fears/stereotypes can fail rational basis in land-use/group-home settings.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q17680 detail returned clean and confirmed the explicit religious-classification phrases from the transform were not present.
  - `npx tsx` import/count check returned `20` Con Law details, `30` seed candidates, and `10` remaining seeds without detail pages; Q17680 has key `A`, selector `44040300`/`child_code`, outline `44040305`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/17680`; route HTML contains `Animus Fails Rational Basis`, `that kind of recovery home`, and `GK-CONLAW-RATIONAL-BASIS-ANIMUS-01`; route HTML does not contain the explicit religious-classification drift phrases from the transform.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17680`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q17680 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17680-desktop.png` (`1440x2556`, `223548` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17680-mobile.png` (`390x5066`, `218852` bytes). Pixel probe found non-white rendered content in both files.
- Local app commit: `a78865c` (`Add Con Law Q17680 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q17680 proof artifacts to `origin/main`.

## Implementation Slice 80 - Q14236 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14236.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14236.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q14236 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 78]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - CodeGraph app index healthy: 312 files indexed, 3,774 nodes, 7,556 edges.
  - Seed import/count check returned `20` Con Law details, `30` seed candidates, and `10` remaining; next seed is Q14236 with seed key `C`, outline `44040501`, selector `44040501`/`exact`, and coverage group `free_exercise`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14236.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14236.md`.
  - Source key: `D`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040501` for Freedom of religion.
  - App seed key already matches the transformed key `C`; no seed JSON edit is expected.
  - First Amendment lane guardrail: the source and transform ask only for a First Amendment Free Exercise claim; RFRA is not included in the public answer path.
  - Current-law spot check: Employment Division v. Smith controls neutral, generally applicable burdens on religious exercise; Lukumi confirms laws targeting religion trigger strict scrutiny; Constitution Annotated summarizes the Smith rule for incidental burdens.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q14236 detail returned clean and confirmed no RFRA detour or original ski-facility wording leaked into the public payload.
  - `npx tsx` import/count check returned `21` Con Law details, `30` seed candidates, and `9` remaining seeds without detail pages; Q14236 has key `C`, selector `44040501`/`exact`, outline `44040501`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14236`; route HTML contains `Free Exercise Needs Targeting`, the credited answer text, `Timothy`, and `GK-CONLAW-FREEEX-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14236`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q14236 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14236-desktop.png` (`1440x2712`, `247271` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14236-mobile.png` (`390x5579`, `242188` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `4507600` (`Add Con Law Q14236 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q14236 proof artifacts to `origin/main`.

## Implementation Slice 81 - Q20153 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\20153.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ20153.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q20153 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 79]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `21` Con Law details, `30` seed candidates, and `9` remaining; next seed is Q20153 with seed key `B`, outline `44040501`, selector `44040501`/`exact`, and coverage group `free_exercise`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\20153.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ20153.md`.
  - Source key: `D`; transformed/public detail key: `B` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040501` for Freedom of religion.
  - App seed key already matches the transformed key `B`; no seed JSON edit is expected.
  - Current-law spot check: Mitchell v. Helms supports neutral, secular-use educational equipment aid available to religious and nonreligious schools on equal terms; Flast v. Cohen supplies the federal taxpayer standing exception for Establishment Clause challenges to congressional taxing-and-spending; Article I, Section 8 supplies Congress's taxing-and-spending power.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q20153 detail returned clean and confirmed no original Aid to Education Act/computer-equipment wording leaked into the public payload.
  - `npx tsx` import/count check returned `22` Con Law details, `30` seed candidates, and `8` remaining seeds without detail pages; Q20153 has key `B`, selector `44040501`/`exact`, outline `44040501`, `4` choices, `4` locks, `4` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/20153`; route HTML contains `Neutral Secular Aid Survives`, `Lampstand Labs Act`, the credited answer text, and `GK-CONLAW-ESTABLISHMENT-NEUTRAL-AID-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/20153`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q20153 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20153-desktop.png` (`1440x2796`, `246831` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20153-mobile.png` (`390x5562`, `245095` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `eb553fc` (`Add Con Law Q20153 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q20153 proof artifacts to `origin/main`.

## Implementation Slice 82 - Q20231 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\20231.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ20231.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q20231 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 80]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `22` Con Law details, `30` seed candidates, and `8` remaining; next seed is Q20231 with seed key `C`, outline `44040501`, selector `44040501`/`exact`, and coverage group `free_exercise`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\20231.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ20231.md`.
  - Source key: `A`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040501` for Freedom of religion.
  - App seed key already matches the transformed key `C`; no seed JSON edit is expected.
  - Public-copy guardrail: teach the belief/conduct distinction without endorsing unlawful conduct or resistance to civil law.
  - Current-law spot check: Reynolds and Cantwell preserve the belief/action distinction; Ballard and Constitution Annotated confirm courts/government may not regulate or judge religious belief as such.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q20231 detail returned clean and confirmed no original civil-law/divine-law phrasing leaked into the public payload.
  - `npx tsx` import/count check returned `23` Con Law details, `30` seed candidates, and `7` remaining seeds without detail pages; Q20231 has key `C`, selector `44040501`/`exact`, outline `44040501`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/20231`; route HTML contains `Belief Cannot Be Punished`, `Crown Above Caesars`, the credited answer text, and `GK-CONLAW-BELIEF-CONDUCT-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/20231`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q20231 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20231-desktop.png` (`1440x2561`, `211909` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20231-mobile.png` (`390x4919`, `212718` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `54b61e6` (`Add Con Law Q20231 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q20231 proof artifacts to `origin/main`.

## Implementation Slice 83 - Q20981 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\20981.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ20981.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q20981 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 81]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `23` Con Law details, `30` seed candidates, and `7` remaining; next seed is Q20981 with seed key `A`, outline `44040501`, selector `44040501`/`exact`, and coverage group `free_exercise`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\20981.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ20981.md`.
  - Source key: `C`; transformed/public detail key: `A` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040501`; student-facing issue is Establishment Clause public religious display analysis even though the seed coverage bucket is `free_exercise`.
  - App seed key already matches the transformed key `A`; no seed JSON edit is expected.
  - Current-law spot check: American Legion supports a history/context approach for longstanding religious public monuments; Kennedy rejects Lemon/endorsement as the controlling shortcut and uses historical practices and understandings; Constitution Annotated summarizes Establishment Clause historical-practices analysis.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q20981 detail returned clean and confirmed no original cross-shaped war memorial/soldier-memorial wording leaked into the public payload.
  - `npx tsx` import/count check returned `24` Con Law details, `30` seed candidates, and `6` remaining seeds without detail pages; Q20981 has key `A`, selector `44040501`/`exact`, outline `44040501`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/20981`; route HTML contains `Public Display Needs Context`, `Lydia Station plaza`, the credited answer text, and `GK-CONLAW-RELIGIOUS-SYMBOLS-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/20981`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q20981 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20981-desktop.png` (`1440x2581`, `227657` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q20981-mobile.png` (`390x4988`, `224317` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `0d99440` (`Add Con Law Q20981 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q20981 proof artifacts to `origin/main`.

## Implementation Slice 84 - Q22592 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\22592.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ22592.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q22592 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 82]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `24` Con Law details, `30` seed candidates, and `6` remaining; next seed is Q22592 with seed key `C`, outline `44040501`, selector `44040501`/`exact`, and coverage group `free_exercise`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\22592.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ22592.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040501` for Freedom of religion.
  - App seed key already matches the transformed key `C`; no seed JSON edit is expected.
  - Public-copy guardrail: soften the public scenario from explicit Christian house-fellowship animal-cruelty framing to a neutral private faith-fellowship ceremony while preserving the forbidden reasonableness inquiry.
  - Current-law spot check: Ballard confirms courts may not decide truth or falsity of religious belief; Thomas confirms religious beliefs need not be acceptable, logical, consistent, or comprehensible to others; Constitution Annotated summarizes laws regulating religious belief.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q22592 detail returned clean and confirmed no original chicken wording or explicit Christian house-fellowship animal-cruelty framing leaked into the public payload.
  - `npx tsx` import/count check returned `25` Con Law details, `30` seed candidates, and `5` remaining seeds without detail pages; Q22592 has key `C`, selector `44040501`/`exact`, outline `44040501`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/22592`; route HTML contains `Sincerity Yes, Reasonableness No`, `private faith-fellowship ceremony`, the credited answer text, and `GK-CONLAW-FREEEX-REASONABLENESS-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/22592`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q22592 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22592-desktop.png` (`1440x2464`, `214668` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q22592-mobile.png` (`390x4809`, `215593` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `362d8ce` (`Add Con Law Q22592 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q22592 proof artifacts to `origin/main`.

## Implementation Slice 85 - Q14223 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14223.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ14223.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Correct Q14223 app seed key and add public-safe Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 83]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `25` Con Law details, `30` seed candidates, and `5` remaining; next seed is Q14223 with seed key `C`, outline `44040502`, selector `44040502`/`exact`, and coverage group `first_amendment_speech_forum`.
- App scope:
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
  - `C:\barmatrix-app\lib\jesuslovesyou\conlaw-seed-candidates.json`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14223.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ14223.md`.
  - Source key: `D`; transformed CQ frontmatter and app seed incorrectly list public key `C`.
  - Transform body is internally inconsistent: its choice C is the least-restrictive-means trap, choice D is the reasonable-fit answer, and the black-letter analysis says choice D is correct.
  - App seed key must be corrected from `C` to `D` for this slice; otherwise the public route would credit the wrong legal reason.
  - Source row, transformed CQ, and app seed all use outline code `44040502` for Freedom of speech and expression.
  - Current-law spot check: Central Hudson supplies the commercial-speech framework; Fox rejects least-restrictive-means as the required commercial-speech tailoring test; Rubin illustrates failure where a commercial-speech restriction does not fit the asserted interest.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts lib/jesuslovesyou/conlaw-seed-candidates.json` passed with only the repo's LF-to-CRLF warnings.
  - Public-safe/source-leak scan over Q14223 detail returned clean and confirmed no original sidewalk-machine/public-sidewalk wording leaked into the public payload.
  - `npx tsx` import/count check returned `26` Con Law details, `30` seed candidates, and `4` remaining seeds without detail pages; Q14223 has corrected key `D`, selector `44040502`/`exact`, outline `44040502`, `4` choices, `4` locks, `3` keys, and `3` drill seeds.
  - Seed correction check confirmed `conlaw-seed-candidates.json` now lists Q14223 key `D`; detail and seed keys match; choice C is a trap and choice D is correct.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14223`; route HTML contains `Commercial Speech Needs Fit`, `15 of the 150`, `Choose D because`, `D / correct`, `C / trap`, and `GK-CONLAW-COMMERCIAL-SPEECH-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14223`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q14223 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14223-desktop.png` (`1440x2579`, `234657` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14223-mobile.png` (`390x5364`, `234324` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `e19b68b` (`Add Con Law Q14223 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q14223 proof artifacts to `origin/main`.

## Implementation Slice 86 - Q14224 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\14224.md`.
- [x] Confirm no selected transformed CQ file exists at `C:\FOC\Workspace\Finished\CQ14224.md`.
- [x] Reconcile source key, seed key, selector, and outline code.
- [x] Add public-safe Q14224 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 84]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `26` Con Law details, `30` seed candidates, and `4` remaining; next seed is Q14224 with seed key `B`, outline `44040502`, selector `44040502`/`exact`, coverage group `first_amendment_speech_forum`, and `has_finished_transform: false`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\14224.md`.
  - No selected transformed CQ file exists for this item, so this slice uses a conservative first-pass public detail derived from the source row.
  - Source key and app seed key both use `B`.
  - Source row and app seed both use outline code `44040502` for Freedom of speech and expression.
  - Current-law spot check: Ward and Clark support the content-neutral time/place/manner framework requiring narrow tailoring to a significant government interest and ample alternative channels; Constitution Annotated confirms this does not require least-restrictive means.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q14224 detail returned clean and confirmed no original historic-district motorist wording leaked into the public payload.
  - `npx tsx` import/count check returned `27` Con Law details, `30` seed candidates, and `3` remaining seeds without detail pages; Q14224 has key `B`, selector `44040502`/`exact`, outline `44040502`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, source-outline values, and `has_finished_transform: false` match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/14224`; route HTML contains `Content Neutral Still Needs Fit`, `Heritage Row`, `B / correct`, and `GK-CONLAW-TPM-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/14224`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q14224 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14224-desktop.png` (`1440x2585`, `223512` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q14224-mobile.png` (`390x5047`, `222315` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `e7bb6a7` (`Add Con Law Q14224 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q14224 proof artifacts to `origin/main`.

## Implementation Slice 87 - Q17574 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\17574.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ17574.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q17574 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 85]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `27` Con Law details, `30` seed candidates, and `3` remaining; next seed is Q17574 with seed key `B`, outline `44040502`, selector `44040502`/`exact`, and coverage group `first_amendment_speech_forum`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\17574.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ17574.md`.
  - Source key: `A`; transformed/public detail key: `B` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040502` for Freedom of speech and expression.
  - App seed key already matches the transformed key `B`; no seed JSON edit is expected.
  - Current-law spot check: Near and New York Times v. United States support the heavy presumption against prior restraints; Constitution Annotated summarizes that any system of prior restraints carries a heavy presumption against constitutional validity.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q17574 detail returned clean and confirmed no original source wording leaked into the public payload.
  - `npx tsx` import/count check returned `28` Con Law details, `30` seed candidates, and `2` remaining seeds without detail pages; next seed is Q18911. Q17574 has key `B`, selector `44040502`/`exact`, outline `44040502`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, and source-outline values match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/17574`; route HTML contains `Advance Approval Is Prior Restraint`, `Christian podcaster in Houston`, the credited answer text, `B / correct`, and `GK-CONLAW-PRIOR-RESTRAINT-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/17574`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q17574 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17574-desktop.png` (`1440x2488`, `213799` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q17574-mobile.png` (`390x4890`, `211176` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `c90e352` (`Add Con Law Q17574 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q17574 proof artifacts to `origin/main`.

## Implementation Slice 88 - Q18911 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\18911.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ18911.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q18911 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 86]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `28` Con Law details, `30` seed candidates, and `2` remaining; next seed is Q18911 with seed key `C`, outline `44040502`, selector `44040502`/`exact`, and coverage group `first_amendment_speech_forum`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\18911.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ18911.md`.
  - Source key: `B`; transformed/public detail key: `C` after answer shuffle.
  - Source row, transformed CQ, and app seed all use outline code `44040502` for Freedom of speech and expression.
  - App seed key already matches the transformed key `C`; no seed JSON edit is expected.
  - Current-law spot check: Mosley supports the content-control rule; Forsyth County confirms hostile audience reaction is not a content-neutral basis for suppressing or burdening speech; Perry and Southeastern Promotions support forum constraints in opened public facilities.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over Q18911 detail returned clean and confirmed no original public-auditorium/immigration-policy wording leaked into the public payload.
  - `npx tsx` import/count check returned `29` Con Law details, `30` seed candidates, and `1` remaining seed without a detail page; next seed is Q21147. Q18911 has key `C`, selector `44040502`/`exact`, outline `44040502`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, source-outline values, and `has_finished_transform: true` match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/18911`; route HTML contains `Listener Anger Is Not Neutral`, `Grace Harbor`, the credited answer text, `C / correct`, and `GK-CONLAW-HECKLER-VETO-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/18911`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q18911 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q18911-desktop.png` (`1440x2597`, `221488` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q18911-mobile.png` (`390x5061`, `221415` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `b85b0fd` (`Add Con Law Q18911 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q18911 proof artifacts to `origin/main`.

## Implementation Slice 89 - Q21147 Con Law Case Study

- [x] Read read-only source row: `C:\FOC\Workspace\QBank\21147.md`.
- [x] Read selected transformed CQ file: `C:\FOC\Workspace\Finished\CQ21147.md`.
- [x] Reconcile source key, transformed key, seed key, selector, and outline code.
- [x] Add public-safe Q21147 Con Law detail payload to the app.
- [x] Verify lint, build, HTTP 200, sitemap inclusion, rendered detail content, and screenshots.
- [x] Commit scoped app change locally and push PDJ proof privately.

Review:

- Current state before edits:
  - `C:\PDJ`: clean `## main...origin/main`.
  - `C:\barmatrix-app`: clean `## codex-review...origin/codex-review [ahead 87]`.
  - `C:\barmatrix-api`: read-only reference; unrelated dirty task files remain present.
  - Seed import/count check returned `29` Con Law details, `30` seed candidates, and `1` remaining; next seed is Q21147 with seed key `B`, outline `44040502`, selector `44040502`/`exact`, and coverage group `first_amendment_speech_forum`.
- App scope: `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
- Source/transform reconciliation:
  - Read-only source row: `C:\FOC\Workspace\QBank\21147.md`.
  - Selected transformed CQ: `C:\FOC\Workspace\Finished\CQ21147.md`.
  - Source key: `C`; transformed/public detail key: `B` after answer shuffle.
  - Source row's `Outline_code` is `44040304`, but that conflicts with the item body because the question tests First Amendment commercial speech, not equal protection intermediate scrutiny.
  - Transformed CQ and app seed correct the selector, outline, and source-outline values to `44040502` for Freedom of speech and expression; the public app detail should follow the corrected seed values.
  - App seed key already matches the transformed key `B`; no seed JSON edit is expected.
  - Current-law spot check: Central Hudson states the threshold lawful-activity gate for commercial speech; Pittsburgh Press confirms advertising for illegal commercial activity lacks First Amendment protection.
- Verification passed:
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/conlaw-question-details.ts` passed with only the repo's LF-to-CRLF warning.
  - Public-safe/source-leak scan over the Q21147 detail object returned clean and confirmed no old drug-market wording leaked into the public payload.
  - `npx tsx` import/count check returned `30` Con Law details, `30` seed candidates, and `0` remaining seeds without detail pages. Q21147 has key `B`, selector `44040502`/`exact`, outline `44040502`, source-outline `44040502`, `4` choices, `4` locks, `3` keys, and `3` drill seeds; seed key, selector, outline, source-outline values, and `has_finished_transform: true` match.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - HTTP 200 detail check passed for `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/21147`; route HTML contains `Central Hudson Has A Front Door`, `private Christian bookstore`, the credited answer text, `B / correct`, and `GK-CONLAW-COMMERCIAL-SPEECH-ILLEGAL-01`.
  - HTTP 200 sitemap check passed; sitemap contains `/Jesuslovesyou/conlaw-pilot-01/seeds/21147`.
  - Screenshot proof was taken from the verified route HTML with scripts stripped, matching the prior fallback boundary; desktop and mobile PNGs both render the full Q21147 content.
  - Screenshot proof: `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q21147-desktop.png` (`1440x2622`, `234610` bytes) and `C:\PDJ\output\playwright\jesuslovesyou-conlaw-q21147-mobile.png` (`390x5336`, `236750` bytes). Pixel grid probe found non-white rendered content in both files.
- Local app commit: `468526d` (`Add Con Law Q21147 case study`).
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed Q21147 proof artifacts to `origin/main`.

## First Group Final Closeout - Con Law 30/30

- [x] Re-run aggregate detail/seed contract check.
- [x] Re-run final lint and build at the completed 30/30 state.
- [x] Sweep all 30 detail routes and sitemap coverage.
- [x] Reconcile older selector metadata exposed by the aggregate check.
- [x] Commit final closeout proof to private PDJ repo.

Review:

- First group implementation status:
  - `30` Con Law seed candidates in `C:\barmatrix-app\lib\jesuslovesyou\conlaw-seed-candidates.json`.
  - `30` public detail payloads in `C:\barmatrix-app\lib\jesuslovesyou\conlaw-question-details.ts`.
  - `0` remaining seed candidates without detail pages.
- Aggregate data proof:
  - Final `npx tsx` contract check returned `details: 30`, `seeds: 30`, `remaining: []`, `duplicateDetails: []`, and `mismatches: []`.
  - The stricter aggregate check initially exposed older selector metadata drift for Q17114, Q19280, and Q14225. Those detail entries now match the seed selector `44040200` / `child_code` while preserving their specific outline/source-outline codes.
  - Local app cleanup commit: `f4b635f` (`Reconcile Con Law seed selector metadata`).
- Final verification:
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`; route table includes `/Jesuslovesyou/conlaw-pilot-01/seeds/[questionId]` with `30` generated paths.
  - All-route sweep checked `30` detail URLs under `http://127.0.0.1:3001/Jesuslovesyou/conlaw-pilot-01/seeds/{questionId}` and returned `failures: []`; each page included its title, credited-answer marker, and sitemap entry.
- Local app commits from this closeout segment:
  - `c90e352` (`Add Con Law Q17574 case study`).
  - `b85b0fd` (`Add Con Law Q18911 case study`).
  - `468526d` (`Add Con Law Q21147 case study`).
  - `f4b635f` (`Reconcile Con Law seed selector metadata`).
- Repository boundary:
  - `C:\barmatrix-app` is clean at `## codex-review...origin/codex-review [ahead 89]`; app commits remain local-only and were not pushed or deployed.
  - `C:\PDJ` was clean on `main...origin/main` before this final closeout note.
  - `C:\barmatrix-api` remained read-only; unrelated dirty task files were not touched.
- Final private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed final 30/30 closeout proof to `origin/main`.

## Goal Audit - Evidence Metadata Reconciliation

- [x] Verify prep workspace and project docs still exist.
- [x] Verify private GitHub target for PDJ.
- [x] Verify CodeGraph status for PDJ and app.
- [x] Re-run aggregate seed/detail contracts for both first-group pilots.
- [x] Fix Evidence seed metadata drift exposed by the aggregate check.
- [x] Re-run lint, build, and all pilot detail routes.
- [x] Commit local app metadata fix and private PDJ proof.

Review:

- Setup evidence:
  - `C:\PDJ\.codex`, `C:\PDJ\.codegraph`, `C:\PDJ\AGENTS.md`, `C:\PDJ\docs\rebuild-prep-report.md`, and `C:\PDJ\incoming\After_Setup_firstgroup.md` are present.
  - `C:\PDJ\docs\rebuild-prep-report.md` records `33` incoming files, `32` text/structured files read, the controlled-vocab workbook inspection, BMO/app/API plumbing, the `/Jesuslovesyou/` route plan, and the CodeGraph setup boundary.
  - `git -C C:\PDJ remote -v` points to `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`; `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - `C:\barmatrix-app` remote is `https://github.com/auronpep/barmatrix-app.git`; `gh repo view auronpep/barmatrix-app --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - CodeGraph status: `C:\PDJ` has `11` indexed files; `C:\barmatrix-app` has `312` indexed files, `3774` nodes, and `7556` edges.
- Evidence metadata fix:
  - Aggregate Evidence check initially showed `50` details, `50` seeds, `0` remaining, but seed/detail mismatches for Q14757, Q14781, and Q14863.
  - Selected transform/source reconciliation showed Q14757 public detail should be key `B` and outline `33040103`; Q14781 key should be `C`; Q14863 key should be `D`.
  - Patched `C:\barmatrix-app\lib\jesuslovesyou\evidence-seed-candidates.json` only; no route/component changes were needed.
- Final verification after patch:
  - Evidence aggregate contract returned `details: 50`, `seeds: 50`, `remaining: []`, `duplicateDetails: []`, and `mismatches: []`.
  - Con Law aggregate contract returned `details: 30`, `seeds: 30`, `remaining: []`, `duplicateDetails: []`, and `mismatches: []`.
  - `git -C C:\barmatrix-app diff --check -- lib/jesuslovesyou/evidence-seed-candidates.json` passed with only the repo's LF-to-CRLF warning.
  - `npm run lint` passed in `C:\barmatrix-app`.
  - `npm run build` passed in `C:\barmatrix-app`.
  - Route sweep checked all `80` first-group detail URLs under `/Jesuslovesyou/conlaw-pilot-01/seeds/{id}` and `/Jesuslovesyou/evidence-pilot-01/seeds/{id}`; result was `failures: []`.
- Local app metadata commit:
  - `752c50d` (`Reconcile Evidence seed metadata`).
- Remaining hard gate:
  - `C:\barmatrix-app` changes remain local-only. No app push, Vercel deploy, or homepage pointer change has been performed because that is a production/repository write gate.
- Private proof push:
  - Verified `origin` is `https://github.com/auronpep/pdj-barmatrix-jesuslovesyou.git`.
  - `gh repo view auronpep/pdj-barmatrix-jesuslovesyou --json nameWithOwner,visibility,url` returned `PRIVATE`.
  - Pushed this audit/proof update to `origin/main`.
