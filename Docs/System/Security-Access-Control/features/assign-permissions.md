# Assign Permissions (Grant)

## Description
Connecting a User to a Role within a specific Scope (e.g., "John is a Nurse in District A").

## Component
Security & Access Control (RBAC)

## Actors / Roles
- **Tenant Admin**
- **Field Manager** (Delegated)

## Permissions
- `role.assign`

## Scope Rules
- **Delegation**: Manager can only assign roles *below* their own level.
- **Scope Limit**: Cannot assign "District A Nurse" to "Western Province" user. Scope must match or be narrower.

## Main Flow
1.  **Actor**: Selects User "John".
2.  **Actor**: Selects Role "Nurse".
3.  **Actor**: Selects Scope "Galle District" + "Health Vertical".
4.  **System**: Validates constraints.
5.  **System**: creates `RoleAssignment`.

## Alternate / Error Flows
- **Conflict**: User already has conflicting role (e.g., "Auditor" and "Accountant") -> Deny.

## Data Read / Written
- **RoleAssignment**: Write.

## Audit & Compliance
- **Access Review**: Assignments are the primary target of periodic access audits.

## Related Use Cases
- UC-99: User Onboarding

## References
- `SPEC/04-security/07-scopes-groups-roles.md`
