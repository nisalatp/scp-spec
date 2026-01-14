# Feature Matrix: Marketplace Access

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Request Access** | Apply for Data | Partner | `access.request` | UC-01 | Portal |
| **Grant Access** | Issue Permit | Umbrella Auth | `access.approve` | UC-01 | Time-bound |
| **Revoke Access** | Ban Partner | Security, Auth | `access.revoke` | UC-99 | Kill Switch |
