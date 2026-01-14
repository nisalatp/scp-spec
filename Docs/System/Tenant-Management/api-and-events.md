# API & Events: Tenancy

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/admin/tenants` | Create new tenant (ROOT). |
| `GET` | `/admin/tenants` | List tenants. |
| `GET` | `/tenant/config` | Get current tenant config. |
| `PATCH` | `/tenant/config` | Update specific setting. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `TenantCreated` | `sys.tenancy` | `tenant_id`, `code` |
| `TenantSuspended` | `sys.tenancy` | `tenant_id`, `reason` |

## Idempotency
- Tenant Creation is idempotent by `code` (cannot double-create "LKA").
