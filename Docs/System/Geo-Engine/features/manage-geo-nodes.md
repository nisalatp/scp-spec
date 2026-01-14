# Manage Geo Nodes

## Description
Creating and updating specific locations (e.g., "Western Province", "Colombo District"). This builds the actual map.

## Component
Geo Engine

## Actors / Roles
- **Geo Admin** (Surveyor General)

## Permissions
- `geo.node.create`
- `geo.node.update`

## Scope Rules
- **Tenant Scope**.
- **Geo Scope**: Can only create children under assigned parents.

## Preconditions
- Hierarchy Levels must exist.
- Parent Node must exist.

## Main Flow
1.  **Actor**: Selects Parent "Western Province".
2.  **Actor**: Creates Child "Colombo District".
3.  **Actor**: Enters Code "DIST-01".
4.  **System**: Validates Code Uniqueness.
5.  **System**: Saves `GeoNode`.

## Alternate / Error Flows
- **Cycle**: Identifying a node as its own ancestor -> Deny.

## Data Read / Written
- **GeoNode**: Write.

## Audit & Compliance
- **Reference Data**: These IDs are used by all other components.

## Related Use Cases
- UC-44: Risk Index Definition (targeting nodes)

## References
- `SPEC/06-platform-core/02-geo-engine.md`
