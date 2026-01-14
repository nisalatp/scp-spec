# API & Events: Infrastructure Project Registry

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/projects` | List active projects. |
| `GET` | `/projects?geo_id=123` | "What's happening in my village?". |
| `POST` | `/projects` | Register. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `ProjectActivated` | `registry.project` | `project_id`, `type`, `geo_ids` |
| `ProjectCompleted` | `registry.project` | `project_id` |

## Integration
- `ProjectCompleted` might trigger a workflow to creating a `Facility` (e.g., "School Construction Completed" -> Create "School Facility").
