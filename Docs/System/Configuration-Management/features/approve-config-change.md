# Approve Config Change

## Description
Governance gate for system settings. Prevents a local admin from accidentally disabling a critical compliance feature.

## Component
Configuration Management

## Actors / Roles
- **Umbrella Authority**

## Permissions
- `config.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Pending Approval`.

## Main Flow
1.  **Actor**: Reviews Change (`max.upload: 5MB -> 50GB`).
2.  **Actor**: Flags Risk ("This will crash storage").
3.  **Action**: Reject.
4.  **System**: Reverts to Previous Value.

## Data Read / Written
- **ConfigEntry**: Update Status.

## Related Use Cases
- UC-99: Change Management

## References
- `SPEC/06-platform-core/10-configuration-management.md`
