# API & Events: Configuration Management

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/config?scope=tenant` | Fetch all active settings. |
| `PATCH` | `/config` | Update a customized setting. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `ConfigChanged` | `config.update` | `key`, `scope`, `version` |

## Integration
- Services subscribe to `ConfigChanged` to reload settings without restart (Hot Reload).
