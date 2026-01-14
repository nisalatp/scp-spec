# API & Events: Data Collection

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/field/sync` | Batch upload/download. |
| `GET` | `/field/assignments` | "Where do I go today?" |
| `POST` | `/visits/{id}/verify` | Approve visit data. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `VisitSubmitted` | `ops.field` | `visit_id`, `agent_id` |
| `VisitVerified` | `ops.field` | `visit_id`, `verifier_id` |

## Idempotency
- `UUID` generated on the mobile device is the key. Retrying upload of `Visit ID X` is safe.
