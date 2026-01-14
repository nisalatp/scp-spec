# Register Vertical

## Description
Defining a new Functional Domain capability within the Tenant (e.g., "Health", "Social Welfare"). This partitions data and logic.

## Component
Verticals

## Actors / Roles
- **Tenant Admin**
- **Umbrella Authority** (Approver)

## Permissions
- `vertical.create`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Tenant Active.

## Main Flow
1.  **Actor**: Names Vertical "Maternal Health".
2.  **Actor**: Uploads Icon/Logo.
3.  **Action**: Save.
4.  **System**: Creates `VerticalDefinition`.
5.  **System**: Bootstraps Base Roles (Owner, Viewer).

## Data Read / Written
- **VerticalDefinition**: Write.

## Audit & Compliance
- **Isolation**: Creating a vertical implies creating a new legal data boundary.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/05-governance/03-vertical-governance.md`
