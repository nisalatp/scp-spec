# API & Events: Integrations Layer

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/admin/integrations` | Register new connector. |
| `POST` | `/hooks/{integration_id}` | Inbound Webhook. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `IntegrationSuspended` | `sys.integrations` | `integration_id`, `reason` |
| `ExternalError` | `sys.integrations` | `partner`, `error_code` |

## Idempotency
- Webhook receivers MUST handle duplicate deliveries (check `X-Event-ID`).
