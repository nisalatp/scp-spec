# API & Events: Audit Logging

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/audit/search` | Query logs (Elastic). |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `AuditBatchArchived` | `sys.audit` | `bucket`, `range` |

## Idempotency
- Duplicate ingestion (retries) should be deduped specific by `event_id`.
