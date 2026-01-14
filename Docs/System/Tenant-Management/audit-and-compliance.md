# Audit & Compliance: Tenancy

## Logged Events
- `tenant.create`
- `tenant.suspend`
- `tenant.config.update`

## Fields
- `actor_id`
- `tenant_id` (Target)
- `old_value` / `new_value` (for Config)

## Retention
- Tenant lifecycle logs are retained **Indefinitely** (Audit Trail).
