# API & Events: Community Center Registry

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/centers` | List nearby. |
| `POST` | `/centers` | PROPOSE a new center. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `CenterVerified` | `registry.center` | `center_id` |

## Integration
- `CenterVerified` enables the "Schedule Event" button for this location in the Program Mgmt UI.
