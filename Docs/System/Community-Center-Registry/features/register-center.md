# Register Community Center

## Description
Cataloging a "Hub" for social activity (e.g., "Village Hall 53A"). This differs from a "Facility" as it emphasizes Governance and Assembly rather than specialized service delivery.

## Component
Community Center Registry

## Actors / Roles
- **Field Agent**
- **Tenant Admin**

## Permissions
- `center.create`

## Scope Rules
- **Geo Scope**: Agent must cover the area.

## Preconditions
- Geo Node must exist.

## Main Flow
1.  **Actor**: Creates Center "Prajashala 53".
2.  **Actor**: Selects Type "Community Hall".
3.  **Actor**: Scans GPS.
4.  **Action**: Submit.
5.  **System**: Creates `CommunityCenter` (Status: Active).

## Data Read / Written
- **CommunityCenter**: Write.

## Related Use Cases
- UC-09: Aid Distribution (Distribution Point)

## References
- `SPEC/06-platform-core/05-community-center-registry.md`
