# Feature Matrix: Security & Access Control

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Authenticate** | Login + MFA | All Users | - | UC-00 | Keycloak |
| **Select Session** | Choose Tenant | Multi-Tenant User | - | UC-00 | Token Exchange |
| **Define Role** | Create Role Definition | Tenant Admin | `role.create` | UC-42 | Requires Approval |
| **Assign Permissions**| Grant Role to User | Tenant Admin | `role.assign` | UC-99 | Scoped Assignment |
| **Evaluate Policy** | Check Access (PDP) | System | - | All | Central Logic |
