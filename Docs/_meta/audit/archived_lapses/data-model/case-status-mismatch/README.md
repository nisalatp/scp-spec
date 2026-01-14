# Lapse: Case Status 'InProgress' Mismatch

**Audit ID:** AUD-017
**Area:** Models / Diagrams
**Status:** OPEN

## Description
The `Docs/System/Workflows-Case-Management/diagrams/lifecycle.puml` introduces a state `InProgress` which is NOT defined in the SPEC.

## Mismatch
- **SPEC (03-domain/05-case-intervention-model.md)**: Defines statuses as `draft, submitted, verified, active, suspended, stabilized, closed, reopened, archived`.
- **Diagram**: Shows transition `Active --> InProgress --> Stabilized`.

## Impact
Implementation ambiguity. Developers might create a DB enum `IN_PROGRESS` which violates the SPEC's finite state machine.

## Resolution
Diagram must be updated to remove `InProgress` or SPEC must be updated if this granular state is required.
