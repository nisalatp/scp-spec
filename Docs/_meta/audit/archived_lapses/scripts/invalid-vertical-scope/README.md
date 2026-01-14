# Lapse: Invalid Vertical Scope in Scripts

**Audit ID:** AUD-023
**Area:** Scripts
**Status:** OPEN

## Description
The Sri Lanka Form Scripts (e.g., `01-birth-registration`) use an invalid vertical scope `"core"`.

## Mismatch
- **SPEC (07-verticals/01-system-verticals.md)**: Defines specific System Verticals (Health, Education, Data, etc.). `"core"` is not a valid Vertical.
- **Script**: `scope.vertical: "core"`.

## Impact
Governance bypass. "Core" implies platform-level ownership, bypassing the Vertical Governance model (Umbrella/Owner). Data captured here effectively has no Vertical Owner to manage consent or policy.

## Resolution
Rebind forms to the correct System Vertical (e.g., `Data` for Civil Registry or `Health` for Birth Health Data).
