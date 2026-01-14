# Roles & Permissions: Finance

## Participating Roles
- **Finance Officer**: Can approve Budgets and View financial reports.
- **Case Worker**: Can *request* financial assistance (Create Draft Obligation), but usually cannot *Approve* it.
- **Auditor**: Full Read Access to all financial records.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `define` | `budget` | Vertical | Finance Officer | |
| `request` | `obligation` | Case | Case Worker | e.g. "Request $50 grant" |
| `approve` | `obligation` | Program limits | Program Manager | Triggers "Ready for Payment" |

## Deny Wins
- If a Program is "Over Budget", the System *automatically* denies new Obligations (Fail-Safe), requiring override.
