# Remaining Gaps (Jan 2026)

This document tracks any minor inconsistencies or unresolved items identified during the Full System Reconciliation that do not block system implementation but should be addressed in future maintenance cycles.

## 1. Documentation
- **API Specs**: Component-level OpenAPI (Swagger) files are currently being evolved in parallel and require a final sync with the reconciled `Exposed Interfaces` sections in READMEs.
- **Tutorials**: Existing setup tutorials might refer to old component names (e.g., "Tenancy") in step-by-step text; these require a prose-only sweep.

## 2. UML Diagrams
- **Sequence Diagrams**: While core journey diagrams (UC-101-105) have been aligned, some secondary vertical sequence diagrams (e.g., `UC-12-Scholarship`) still use legacy component names in their participants block.

## 3. Scripts
- **CLI Tooling**: The local CLI tool (`cli`) uses some legacy terminology in help text, though command functionality remains unchanged.

## 4. Lapses
- **Resolved**: All high-priority lapses identifying missing core roles or data entities have been closed.
