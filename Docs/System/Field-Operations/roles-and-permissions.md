# Roles & Permissions: Data Collection

## Participating Roles
- **Field Agent**: The primary user. Creates Visits.
- **Case Worker**: Verifies Visits.
- **Ops Manager**: Assigns Agents to Areas.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `visit` | Geo-Scoped | Field Agent | - | Core function |
| `verify` | `visit` | Vertical | Case Worker | Field Agent | Duo-control |
| `sync` | `data` | Geo-Scoped | Field Agent | - | Offline capability |
| `assign` | `agent` | Tenant | Ops Manager | - | Admin task |

## Consent Interactions
- **Capture**: Agents capture the initial Consent Evidence during a visit.

## Deny Wins
- If an Agent is Suspended, `Sync` is blocked immediately. They cannot upload even pending work (Device wipe / Lock).
