# Roles & Permissions: Facility Registry

## Participating Roles
- **Facility Manager**: Updates status of *their* facility.
- **Ministry Admin**: Adds/Removes facilities.
- **Public/Guest**: Can view the list of facilities (if configured public).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `create` | `facility` | Tenant | Ministry Admin | |
| `update_status` | `facility` | Facility | Facility Manager | e.g. "Mark Closed for Renovation" |
| `read` | `facility` | None | All | Often Reference Data |

## Deny Wins
- If a Facility is `Suspended` by the Ministry, the Facility Manager cannot "Re-open" it.
