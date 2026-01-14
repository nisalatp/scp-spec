# Register Project

## Description
Defining a high-level initiative that builds physical assets (e.g., "Well Construction Program 2024"). Tracks "What" and "Where".

## Component
Infrastructure Project Registry

## Actors / Roles
- **Tenant Admin**
- **Vertical Owner**

## Permissions
- `project.create`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Funding (Budget) usually pre-allocated (though not strictly linked in MVP).

## Main Flow
1.  **Actor**: Creates Project "Well Construction - Galle".
2.  **Actor**: Selects Type "Water".
3.  **Action**: Submit.
4.  **System**: Sets `status = Requested`.

## Data Read / Written
- **InfrastructureProject**: Write.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/12-infrastructure-project-registry.md`
