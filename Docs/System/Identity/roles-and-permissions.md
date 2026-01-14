# Roles & Permissions: Identity

## Participating Roles
- **Field Agent**: Collection (Create).
- **Case Worker**: Verification (Update/Verify).
- **Vertical Owner**: Policy setting (Consent).
- **Platform Admin**: No access (PII).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `person` | Geo-Scoped | Field Agent | - | Registration |
| `view` | `person` | Geo/Vertical | Case Worker | Admin | PII Access |
| `update` | `person` | Geo/Vertical | Case Worker | - | Demographics |
| `verify` | `person` | Geo/Vertical | Case Worker (Senior) | - | Status change |
| `search` | `person` | Geo-Scoped | Field Agent | - | Avoid duplicates |

## Consent Interactions
- **View Check**: `person.view` MUST check `ConsentManager`. If consent for the calling Vertical is withdrawn, return 403 or Masked data.

## Deny Wins
- If a specific Person record is "Restricted/Sealed" (e.g., Witness Protection), explicitly Deny access even to Case Workers.
