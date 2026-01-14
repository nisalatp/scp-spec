# Define Coverage (Geo Scope)

## Description
Linking the Project to the specific Villages or Districts it benefits. Critical for "De-confliction" (Avoiding two wells in the same spot).

## Component
Infrastructure Project Registry

## Actors / Roles
- **Project Manager**

## Permissions
- `project.update`

## Scope Rules
- **Geo Scope**.

## Main Flow
1.  **Actor**: Selects Project.
2.  **Actor**: Selects Geo Nodes "Village A, Village B".
3.  **Action**: Save.
4.  **System**: Checks for Overlaps (Audit Warning).

## Data Read / Written
- **ProjectGeoScope**: Write.

## Uses
- Preventing Duplicate Spending.

## Related Use Cases
- UC-42: Policy Simulation

## References
- `SPEC/06-platform-core/12-infrastructure-project-registry.md`
