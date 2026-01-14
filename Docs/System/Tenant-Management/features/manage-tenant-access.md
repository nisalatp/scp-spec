# Manage Tenant Access (Membership)

## Description
Granting or Revoking a User's right to access a specific Tenant. A user (Human or Machine) can belong to multiple tenants (e.g., an International Auditor).

## Component
Tenancy

## Actors / Roles
- **Tenant Admin**
- **ROOT**

## Permissions
- `tenant.membership.add`
- `tenant.membership.remove`

## Scope Rules
- **Tenant Scope**.
- **Allowed**: LK Admin adds "John Doe" to "LK".
- **Denied**: LK Admin adds "John Doe" to "KE".

## Main Flow
1.  **Tenant Admin**: Invites "analyst@who.org".
2.  **System**: Looks up User Global ID.
3.  **System**: Creates `TenantMembership` link.
4.  **System**: Assigns Default Role (e.g., "Guest").
5.  **User**: Next Login includes "LK" in `available_tenants`.

## Alternate / Error Flows
- **User Not Found**: Prompt to Register Global User first.

## Data Read / Written
- **TenantMembership**: Write.

## Audit & Compliance
- **Cross-Border Access**: Explicitly logged if the User's "Home Country" differs from the "Target Tenant".

## Related Use Cases
- UC-99: User Onboarding

## References
- `SPEC/06-platform-core/03-person-registry.md`
