# Feature Matrix: Configuration

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Set Property** | Change Setting | Tenant Admin | `config.update` | UC-01 | Encrypted if needed |
| **Approve Change** | Governance | Umbrella Auth | `config.approve` | UC-01 | |
| **Manage Flags** | Feature Toggles | Platform Admin | `feature.toggle` | - | Canary |
