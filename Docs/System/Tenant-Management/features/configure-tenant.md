# Configure Tenant

## Description
Managing tenant-specific settings such as Default Language, Timezone, Feature Flags, and Branding. Changes may require governance approval.

## Component
Tenancy

## Actors / Roles
- **Tenant Admin** (Proposer)
- **Umbrella Authority** (Approver)
- **ROOT** (Override)

## Permissions
- `tenant.config.view`
- `tenant.config.update`
- `tenant.config.approve`

## Scope Rules
- **Tenant Scope**: Strict. Config applies ONLY to the target tenant.
- **Allowed**: LK Admin changes LK Timezone.
- **Denied**: LK Admin cannot view/change KE Config.

## Preconditions
- Tenant must be Active.

## Main Flow
1.  **Tenant Admin**: Requests change `defaults.currency = 'LKR'`.
2.  **System**: Checks if config key is `Locked` (Global Policy).
3.  **System**: Stores "Draft Config".
4.  **Umbrella Authority**: Reviews Draft. Clicks "Approve".
5.  **System**: Applies Draft to Active Config. Incr Versions.
6.  **Audit**: Logs `CONFIG_CHANGE` with Approver ID.

## Alternate / Error Flows
- **Locked Key**: Attempt to change `system.db.host` (Locked by ROOT) -> Access Denied.
- **Auto-Approval**: Some keys (e.g., UI Theme) may not require Umbrella Approval.

## Data Read / Written
- **TenantConfig**: Read/Write.

## Audit & Compliance
- Changes to "Sensitive" configs (e.g., Security Level) usually trigger alerts.

## Related Use Cases
- UC-42: Configure Risk Policy

## References
- `SPEC/06-platform-core/10-configuration-management.md`
