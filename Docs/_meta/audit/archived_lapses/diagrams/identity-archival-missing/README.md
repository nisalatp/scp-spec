# Lapse: Identity Archival State Missing

**Audit ID:** AUD-019
**Area:** Diagrams
**Status:** OPEN

## Description
The `Docs/System/Identity/diagrams/lifecycle.puml` is missing the mandatory `Archived` state for soft deletion.

## Mismatch
- **SPEC (06-platform-core/03-person-registry.md)**: "Soft delete MUST mark the person as archived and read-only. Archived persons MUST be excluded from operational workflows..."
- **Diagram**: Shows `Provisional`, `Verified (Active/Restricted)`, and `Merged`. Does not show `Archived` or the soft-delete transition.

## Impact
Incomplete implementation requirement. Developers might implement hard deletes or miss the archival workflow entirely.

## Resolution
Update diagram to include `Active --> Archived` transition.
