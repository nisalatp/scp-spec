# Approve Project

## Description
Governance check to ensure the project aligns with National Development Goals.

## Component
Infrastructure Project Registry

## Actors / Roles
- **Umbrella Authority**

## Permissions
- `project.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Actor**: Reviews Scope & Coverage.
2.  **Action**: Approve.
3.  **System**: Sets `status = Active`.
4.  **System**: Publishes Coverage Map.

## Data Read / Written
- **InfrastructureProject**: Update Status.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/12-infrastructure-project-registry.md`
