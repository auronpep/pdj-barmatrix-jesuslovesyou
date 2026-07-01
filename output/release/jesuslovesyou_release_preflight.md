# Jesuslovesyou Release Preflight

Release allowed without user authorization: **false**

## Checks

| Check | Passed | Detail |
| --- | --- | --- |
| pdj_state_recorded | True | ## main...origin/main; dirty_count=4 |
| app_clean | True | ## codex-review...origin/codex-review |
| app_branch_state_recorded | True | ahead 0 |
| app_repo_private | True | auronpep/barmatrix-app PRIVATE |
| pdj_repo_private | True | auronpep/pdj-barmatrix-jesuslovesyou PRIVATE |
| vercel_project | True | barmatrix-app / prj_LwBgARXTft6aeyoRwhIqEDWh5p4P |
| api_left_read_only | True | ## codex/diagnostic-red-zone-funnel-2026-06-20...origin/codex/diagnostic-red-zone-funnel-2026-06-20; dirty_count=3 |
| app_lint | True | exit 0 |
| app_build | True | exit 0 |
| local_route_manifest | True | exit 0 |

## Current State

- PDJ: ## main...origin/main
- App: ## codex-review...origin/codex-review
- API: ## codex/diagnostic-red-zone-funnel-2026-06-20...origin/codex/diagnostic-red-zone-funnel-2026-06-20, dirty count 3, preserved read-only
- Vercel project: barmatrix-app / prj_LwBgARXTft6aeyoRwhIqEDWh5p4P
- Local route verify: checked 106 routes, failures 0

## Next Authorized Release Steps

- Verify C:\barmatrix-app remains clean and auronpep/barmatrix-app is private.
- If new app commits appear, push only after private-target verification.
- Deploy from C:\barmatrix-app, not C:\BMO\app-repo.
- Verify Vercel project barmatrix-app before deploy.
- Smoke production /Jesuslovesyou routes and prefixed checkout.
- Change homepage pointer only after production smoke passes.
