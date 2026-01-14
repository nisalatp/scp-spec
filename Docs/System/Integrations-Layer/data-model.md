# Data Model: Integrations Layer

## Entities

### IntegrationConfig
- `integration_id` (PK)
- `tenant_id`
- `partner_name`
- `status` (Active, Suspended)
- `vertical_scopes` (Array)
- `auth_config_ref` (Pointer to Vault)
- `rate_limit_policy`

### IntegrationLog
- `log_id`
- `integration_id`
- `direction` (Inbound/Outbound)
- `payload_size`
- `response_code`
- `duration_ms`

## Storage Strategy
- **Logs**: High churn. Partitioned by Date.

## Diagrams
- `UML/Core/system-class-diagram.puml`
