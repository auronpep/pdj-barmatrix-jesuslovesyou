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
- CodeGraph `C:\PDJ`: initialized; 9 files indexed; 0 nodes; 0 edges; YAML only.
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

## Review

Preparation complete. Private GitHub registration and initial push complete.
