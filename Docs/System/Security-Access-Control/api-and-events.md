# API & Events: Security & Access Control

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/auth/me` | Get current user context/claims. |
| `POST` | `/admin/roles` | Create Role. |
| `POST` | `/admin/user/{id}/assign` | Assign Role. |

## Internal Events
- `EvaluationRequest`: Traced in spans.

## Published Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `RoleAssigned` | `sec.access` | `user_id`, `role_id`, `scope` |
| `UserSuspended` | `sec.access` | `user_id`, `reason` |

## Idempotency
- Role assignment is idempotent (assigning same role twice does nothing).
