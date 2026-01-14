# Assign Vertical Owner

## Description
Designating the person responsible for Data Governance within the Vertical. This user becomes the "Admin" of that specific domain.

## Component
Verticals

## Actors / Roles
- **Tenant Admin**
- **Umbrella Authority**

## Permissions
- `vertical.admin`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Selects Vertical "Health".
2.  **Actor**: Input Identity "Dr. Perera".
3.  **Action**: Assign Role "Vertical Owner".
4.  **System**: Grants `vertical.*` permissions on `scope=Health`.

## Data Read / Written
- **RoleAssignment**: Write.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/05-governance/03-vertical-governance.md`
