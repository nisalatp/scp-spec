# Roles & Permissions: Geo Engine

## Participating Roles
- **Platform Admin**: Definition of Hierarchy Levels.
- **Vertical Owner**: Can define metrics for geos (e.g., "Dengue Risk").
- **Field Agent**: Consumes Geo Data (Read-Only).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `geo.level` | Tenant | Platform Admin | - | Config |
| `update` | `geo.node` | Tenant | Platform Admin | - | Maintenance |
| `view` | `geo.node` | Tenant | All | - | Public Ref Data |
| `update` | `geo.metric` | Vertical | Vertical Owner | - | E.g. Risk score |

## Consent Interactions
- **N/A**: Geo Nodes are public administrative data.

## Deny Wins
- Standard rules.
