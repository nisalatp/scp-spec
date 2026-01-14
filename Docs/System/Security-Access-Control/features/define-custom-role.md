# Define Custom Role

## Description
Creating a named set of permissions (e.g., "Junior Field Nurse"). Roles are defined by Tenant Admins but must be approved by Umbrella Authority to ensure least-privilege compliance.

## Component
Security & Access Control (RBAC)

## Actors / Roles
- **Tenant Admin** (Proposer)
- **Umbrella Authority** (Approver)

## Permissions
- `role.create`
- `role.approve`

## Scope Rules
- **Tenant Scope**: Roles are specific to a tenant (though Standard Roles may exist globally).

## Preconditions
- Permissions must exist in the Catalog.

## Main Flow
1.  **Tenant Admin**: Defines Role "Nurse". Adds `person.view`, `health.record.create`.
2.  **System**: Validates scopes (e.g., can a Nurse see Finance data? No.).
3.  **System**: Saves as `Draft`.
4.  **Umbrella Auth**: Reviews and Approves.
5.  **System**: Activates Role.

## Data Read / Written
- **RoleDefinition**: Write.

## Audit & Compliance
- **SoD**: Separation of Duties checks happen here.

## Related Use Cases
- UC-42: Configure Permissions

## References
- `SPEC/04-security/07-scopes-groups-roles.md`
