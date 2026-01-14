# Roles & Permissions: Configuration Management

## Participating Roles
- **Platform Admin (ROOT)**: Can change Global Settings.
- **Tenant Admin**: Can change Tenant-Scoped Settings.
- **System**: Reads settings.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `update` | `config` | Global | ROOT | e.g. "Maintenance Mode" |
| `update` | `config` | Tenant | Tenant Admin | e.g. "DateFormat" |
| `read` | `config` | None | All Services | |

## Deny Wins
- Tenant Admin *cannot* override a setting marked `locked` by ROOT.
