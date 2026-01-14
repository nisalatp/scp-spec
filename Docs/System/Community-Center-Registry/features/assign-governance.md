# Assign Governance (Owner)

## Description
Designating a Person or Role responsible for the Center (e.g., "The Grama Niladhari").

## Component
Community Center Registry

## Actors / Roles
- **Tenant Admin**
- **Geo Admin**

## Permissions
- `center.update`

## Scope Rules
- **Geo Scope**.

## Main Flow
1.  **Actor**: Selects Center "Prajashala 53".
2.  **Actor**: Assigns Owner "G.N. Perera".
3.  **Action**: Save.

## Data Read / Written
- **CommunityCenter**: Update (Owner ID).

## Audit & Compliance
- **Accountability**: Who holds the key to the building?

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/05-community-center-registry.md`
