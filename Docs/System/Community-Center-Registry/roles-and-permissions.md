# Roles & Permissions: Community Center Registry

## Participating Roles
- **Community Leader**: Manages the Center record (contacts, keys).
- **Field Agent**: Uses Center as a checkpoint.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `update` | `center` | Owner | Community Leader | |
| `read` | `center` | None | All | Public Info |

## Deny Wins
- If `verification_status` is Failed, the Center cannot be used for official distributions.
