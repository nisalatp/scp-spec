# Audit & Compliance: Data Collection

## Logged Events
- `visit.create` (at sync time)
- `agent.login`, `agent.sync`
- `device.register`

## Fields
- `device_id`
- `app_version`
- `geo_location` (for fraud analysis)

## Retention
- Visit logs are operational data (Permanent).
- Specific Sync Debug logs (Metadata) kept for 30 days.
