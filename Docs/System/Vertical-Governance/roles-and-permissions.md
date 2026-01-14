# Roles & Permissions: Verticals

## Participating Roles
- **Vertical Owner**: The "Mini-CEO" of the Vertical. Can create programs, config metrics.
- **Tenant Admin**: Creates the Vertical itself.
- **Auditor**: Reviews cross-vertical leaks.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `vertical` | Tenant | Tenant Admin | - | High level governance |
| `configure` | `vertical` | Vertical | Vertical Owner | - | E.g. Set specific KPIs |
| `audit` | `vertical` | Tenant | Auditor | - | Compliance |

## Consent Interactions
- **The Boundary**: Consent is binary per Vertical. `Consent(Person, Health) = True/False`.

## Deny Wins
- If a Vertical is Suspended (e.g., for investigation), ALL access to its data is frozen, even if Person Consent exists.
