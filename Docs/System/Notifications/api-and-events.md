# API & Events: Notifications & Email

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/internal/notify` | Send message. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `NotificationSent` | `sys.notify` | `request_id`, `recipient_hash` |
| `NotificationBounced` | `sys.notify` | `request_id`, `reason` |

## Idempotency
- Requests should prevent double-send. `request_id` is unique.
