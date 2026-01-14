# API & Events: Eligibility Rules Engine

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/rules/{id}/eval` | Run logic. |
| `POST` | `/rules/{id}/simulate` | Batch run. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `PolicyActivated` | `gov.policy` | `policy_id`, `version` |

## Idempotency
- Pure Functions. Input X should always produce Output Y (assuming Reference Data is stable or time-travel supported).
