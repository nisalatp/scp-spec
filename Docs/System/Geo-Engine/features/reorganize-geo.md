# Reorganize Geo (Split/Merge)

## Description
Handling administrative boundary changes (e.g., "District A splits into A1 and A2"). This is a complex operation requiring data migration.

## Component
Geo Engine

## Actors / Roles
- **Geo Admin**
- **ROOT** (if large scale)

## Permissions
- `geo.reorg` (Dangerous Permission)

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Selects "Split Node A".
2.  **Actor**: Defines New Nodes A1, A2.
3.  **Actor**: Defines logic (e.g., "All households North of River go to A1").
4.  **System**:
    - Creates A1, A2.
    - Updates Parents.
    - Triggers "Referential Integrity Job" to re-link Households and Facilities.
5.  **System**: Marks A as `Archived`.
6.  **System**: Emits `GeoReorganized`.

## Alternate / Error Flows
- **Validation**: Cannot split if resulting nodes have no parents.

## Data Read / Written
- **GeoNode**: Write.
- **Related Entities**: Update `geo_id`.

## Audit & Compliance
- **Traceability**: Must be able to query "What was the district of this House in 2020?".

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/02-geo-engine.md`
