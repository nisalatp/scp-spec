# API & Events: Metadata Versioning

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/definitions/{key}/versions/latest` | Get current active. |
| `GET` | `/definitions/{key}/versions/{ver}` | Get historical context. |
| `POST` | `/definitions/{key}/versions` | Create Draft. |
| `POST` | `/definitions/{key}/versions/{ver}/publish` | Finalize. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `DefinitionPublished` | `config.update` | `key`, `version` |

## Integration
- `DefinitionPublished` triggers Cache Invalidation on Field Apps.
