# Audit & Compliance: Integrations Layer

## Logged Events
- `integration.invoke` (Metadata Only).
- `integration.auth_failure`.

## Fields
- **PII Masking**: Logs must NEVER contain the PII payload. Only `person_id`.
- **Latency**: Important for SLA monitoring.

## Retention
- 1 Year (Standard Compliance).
