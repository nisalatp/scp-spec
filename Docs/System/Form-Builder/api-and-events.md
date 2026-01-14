# API & Events: Form Builder

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/forms` | List definitions. |
| `GET` | `/forms/{key}/versions/{ver}` | Get specific schema. |
| `POST` | `/forms` | Create Draft. |
| `PUT` | `/forms/{key}/publish` | Activate Draft. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `FormPublished` | `sys.forms` | `form_key`, `version`, `vertical` |

## Idempotency
- Publishing the same draft twice should result in one version.
