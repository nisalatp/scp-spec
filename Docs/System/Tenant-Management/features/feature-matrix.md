# Feature Matrix: Tenancy

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Provision New Tenant** | Create new Country Instance | ROOT, Umbrella Auth | `tenant.create` | UC-01 | Requires DB Provisioning |
| **Configure Tenant** | Update Settings | Tenant Admin, Umbrella Auth | `tenant.config.update` | UC-42 | Approval Workflow may apply |
| **Manage Lifecycle** | Suspend/Archive | ROOT | `tenant.suspend` | - | Operational Safety |
| **Manage Access** | Add/Remove Members | Tenant Admin | `tenant.membership.manage` | UC-99 | |
