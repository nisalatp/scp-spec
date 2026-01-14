# API & Events: Form Scripting

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/admin/forms/import` | Multipart upload of `.yaml`. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `FormImported` | `sys.forms` | `tenant`, `package`, `count` |

## Idempotency
- Pipeline calculates Hash of script content. If `Hash(New) == Hash(Current)`, skip update.
