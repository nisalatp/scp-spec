# API & Events: Workflows & Case Management

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/cases` | Create. |
| `POST` | `/worklows/{id}/transition` | Move Step (Approve/Reject). |
| `GET` | `/cases/{id}/history` | Audit trail. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `CaseCreated` | `biz.case` | `case_id`, `vertical` |
| `CaseApproved`| `biz.case` | `case_id`, `approver` |

## Idempotency
- Transitions are state-dependent. "Approve" on an already "Approved" case should fail or return current state (Safe).
