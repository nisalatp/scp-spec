# API & Events: Consent Management

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/consent/check?person={p}&vertical={v}` | Boolean check (Internal). |
| `POST` | `/consent` | Submit new consent. |
| `POST` | `/consent/{id}/withdraw` | Revoke. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `ConsentGrant` | `sec.consent` | `person_id`, `vertical_id` |
| `ConsentWithdrawn` | `sec.consent` | `person_id`, `vertical_id` |
| `ConsentExpired` | `sec.consent` | `person_id` |

## Idempotency
- Submitting identical consent twice should return the existing Active ID.
