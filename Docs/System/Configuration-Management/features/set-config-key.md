# Set System Property (Config)

## Description
Adjusting the behavior of the system within a specific Tenant (e.g., "Set Default Currency = LKR", "Set Max Upload Size = 10MB").

## Component
Configuration Management

## Actors / Roles
- **Tenant Admin**
- **Platform Admin** (Global)

## Permissions
- `config.update`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Key must be defined in "Allowed Configs".

## Main Flow
1.  **Actor**: Search Key `system.notifications.smtp.enabled`.
2.  **Actor**: Set Value `true`.
3.  **Action**: Save.
4.  **System**: Sets `status = Pending Approval`.

## Data Read / Written
- **ConfigEntry**: Write.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/10-configuration-management.md`
