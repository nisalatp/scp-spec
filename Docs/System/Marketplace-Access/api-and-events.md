# API & Events: Marketplace Access

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/marketplace/requests` | Submit application. |
| `POST` | `/marketplace/requests/{id}/approve` | Grants access. |
| `DELETE` | `/marketplace/grants/{id}` | Revoke immediately. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `AccessGranted` | `governance.market` | `client_id`, `scopes`, `expiry` |
| `AccessRevoked` | `governance.market` | `client_id` |

## Integration
- `AccessGranted` event triggers the **IAM Service** to provision API Keys or Client Certificates.
