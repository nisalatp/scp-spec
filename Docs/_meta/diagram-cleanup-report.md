# Diagram Cleanup & Alignment Report

## Executive Summary
All diagrams under `\Diagrams\UML` and `\Diagrams\C4` have been audited and updated to match the current authoritative `\SPEC`. Redundant diagrams were archived or merged.

## Key Updates
1.  **C4 Models**:
    *   Pinned to PlantUML v2.5.0 to resolve rendering errors.
    *   Context, Container, and Component diagrams aligned with `SPEC-02` and `SPEC-06`.
2.  **System ERD**:
    *   Complete rewrite of `system-erd.puml` to match `SPEC-10-data/02-logical-data-schema.md`.
    *   Added `Agents`, `Programs`, `Consents`, `ServiceEncounters` entities.
3.  **Sequence Diagrams**:
    *   `core-flows.puml`: Added Spec references for Offline Sync and Webhooks.
    *   `authz-evaluation.puml`: Added Scope Resolution step (`SPEC-04-security`).
    *   `person-registration.puml`: Added Household Association logic (`SPEC-06-core`).
    *   `form-submission.puml`: Added Version Check (`SPEC-06-core`).
4.  **State Models**:
    *   `system-state-machines.puml`: Clarified Person Suspension logic.
    *   `form-lifecycle-state.puml`: Added `Approved` and `Restricted` states (`SPEC-06-core`).
5.  **Traceability**:
    *   **ALL** updated diagrams now contain a `TRACE` block at the bottom referencing the specific SPEC files used for validation.

## Repository State
*   **Source of Truth**: `\SPEC` remains the only authority.
*   **Visualizations**: `\UML` and `\C4` strictly follow SPEC.
*   **Documentation**: Docs now reference these canonical diagrams.

## Validation
*   All diagrams compile (using PlantUML stdlib v2.5.0).
*   No diagrams contradict the known SPEC.
