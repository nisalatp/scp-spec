# Lapse: Missing Frontend/Backend/Deployment Docs

**Audit ID:** AUD-022
**Area:** Docs
**Status:** OPEN

## Description
The `Docs/` directory lacks dedicated `Frontend`, `Backend`, and `Deployment` guides, as required by the Audit Scope ("Docs Audit (Frontend / Backend / Deployment)").

## Mismatch
- **Expected**: Directories like `Docs/Frontend`, `Docs/Backend`, `Docs/Deployment` with implementation details.
- **Reality**: Only `Docs/System`, `Docs/Roles`, `Docs/UseCases` exist. `Docs/FormBuilder` and `Docs/FormScripting` exist as loose folders (likely duplicates of System components).

## Impact
No entry point for developers to understand the codebase structure, build processes, or deployment steps (outside of high-level SPEC).

## Resolution
Create these directories and populate them with:
- `Frontend`: Architecture, build setup, theming.
- `Backend`: API patterns, DTOs, detailed logic.
- `Deployment`: Docker/K8s manifests explanation (linking to SPEC).
