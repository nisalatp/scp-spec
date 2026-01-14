# Lapse: Program State Nesting

**Audit ID:** AUD-018
**Area:** Diagrams
**Status:** OPEN

## Description
The `Docs/System/Programs/diagrams/lifecycle.puml` incorrectly nests the `Approved` state inside the `Reviewed` state.

## Mismatch
- **SPEC (03-domain/04-program-model.md)**: Defines `reviewed` and `approved` as distinct, sequential sibling states in the lifecycle list.
- **Diagram**: Uses PlantUML nesting:
  ```plantuml
  state Reviewed {
    [*] --> Approved
  }
  ```
  This implies `Approved` is a sub-state of `Reviewed` (e.g. `Reviewed.Approved`), which conflicts with the flat enum definition in the SPEC.

## Impact
Confusion about state hierarchy. Implications for API filter logic (e.g. `status=reviewed` returning approved items?).
