# Roles & Permissions: Security & Access Control

## Participating Roles
- **Platform Admin**: Assigns roles to users.
- **Umbrella Authority**: Approves new Role Definitions.
- **ROOT**: Bypasses the entire subsystem.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `check` | `authz` | None | System/Internal | - | The PDP call itself |
| `create` | `role` | Tenant | Platform Admin | - | Subject to Umbrella |
| `assign` | `role` | Tenant | Platform Admin | - | Connects User to Role |
| `bypass` | `*` | Global | ROOT | All Others | Break-glass |

## Consent Interactions
- **Step 3 of Evaluation**: `Consent Check`. If the target resource is PII (`person.*`, `case.*`) and the User is NOT ROOT, AuthZ queries Consent Manager. If Negative, Decision = DENY.

## Deny Wins
- Explicit Deny Rules (e.g., "Ban User from Finance Vertical") are evaluated **before** Allow Rules.
