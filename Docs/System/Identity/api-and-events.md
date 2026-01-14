# API & Events: Identity

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/person` | Create provisional identity. |
| `GET` | `/person/{id}` | Get profile (masked). |
| `PUT` | `/person/{id}` | Update demographics. |
| `POST` | `/person/search` | Search by ID/Name (Geo-scoped). |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `PersonCreated` | `ids.person` | `person_id`, `geo_id` |
| `PersonVerified` | `ids.person` | `person_id`, `verifier_id` |

## Idempotency
- ID creation should check for existing National ID to prevent duplicates.
