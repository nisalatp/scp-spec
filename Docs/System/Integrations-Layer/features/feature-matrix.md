# Feature Matrix: Integrations

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Register Integration** | Create Draft Connection | Tenant Admin, Partner | `integration.create` | UC-01 | |
| **Approve Integration** | Governance Check | Umbrella Auth | `integration.approve` | UC-01 | Creates Credentials |
| **Manage Webhooks** | Event Callbacks | Admin, Partner | `webhook.manage` | - | Signed Payloads |
