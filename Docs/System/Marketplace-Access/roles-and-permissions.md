# Roles & Permissions: Marketplace Access

## Participating Roles
- **Partner Admin**: The external user asking for access.
- **Umbrella Admin**: The government official Approving the access.
- **Security Officer**: Can revoke access in emergencies.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `request` | `access` | None | Accountable External Entity | |
| `approve` | `access` | Tenant | Umbrella Admin | |
| `revoke` | `grant` | Tenant | Security Officer | Immediate Kill Switch |

## Deny Wins
- If a Grant is "Revoked", even if the Expiry Date is in the future, access is denied.
