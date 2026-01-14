# API & Events: Verticals

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/verticals` | public list. |
| `PUT` | `/verticals/{id}` | Update config. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `VerticalCreated` | `ref.vertical` | `vertical_id`, `name` |
| `VerticalSuspended`| `ref.vertical` | `vertical_id`, `reason` |

## Idempotency
- N/A (Config updates are Last-Write-Wins).
