# Define Geo Hierarchy

## Description
Configuring the levels of the administrative tree (e.g., "Province > District > Division"). This defines the structure that all Geo Nodes must follow.

## Component
Geo Engine

## Actors / Roles
- **Tenant Admin**
- **Geo Admin**

## Permissions
- `geo.hierarchy.manage`

## Scope Rules
- **Tenant Scope**: Hierarchy is unique per tenant.

## Preconditions
- Tenant must be active.
- No existing nodes that violate the new structure (if updating).

## Main Flow
1.  **Actor**: Defines Level 1 = "Province", Level 2 = "District".
2.  **System**: Validates acyclic structure.
3.  **System**: Saves `GeoLevel` definitions.
4.  **Audit**: Logs `HIERARCHY_UPDATE`.

## Alternate / Error Flows
- **Reduction**: Removing a level that contains active nodes is denied. Must migrate nodes first.

## Data Read / Written
- **GeoLevel**: Write.

## Audit & Compliance
- **Structural Integrity**: Changes here have massive downstream effects on Reporting.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/02-geo-engine.md`
