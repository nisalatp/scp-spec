# Roles & Permissions: Infrastructure Project Registry

## Participating Roles
- **Project Manager**: Updates status of their project.
- **Planner**: Creates new projects.
- **Public**: Views active projects.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `create` | `project` | Tenant/Vertical | Planner | e.g. "Water Roadplan" |
| `update_status` | `project` | Owner | Project Manager | |
| `audit` | `project` | None | Auditor | |

## Deny Wins
- If a project is `Suspended` (e.g. Environmental Hold), no status updates allowed until unlocked.
