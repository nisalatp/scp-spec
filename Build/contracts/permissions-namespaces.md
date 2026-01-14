# Canonical Permission Namespaces

These namespaces MUST be used in both the Backend (Policy Engine) and Frontend (UI Guardrails).

| Namespace | Resource Description | Common Actions |
| :--- | :--- | :--- |
| `tenant.*` | Tenant configuration and onboarding | `create`, `view`, `configure`, `update` |
| `user.*` | Identity management and profile | `create`, `update`, `view`, `manage` |
| `role.*` | RBAC assignments | `assign`, `revoke`, `view` |
| `person.*` | Individual citizen registry | `create`, `update`, `view`, `search` |
| `household.*` | Familial grouping and linkage | `create`, `update`, `view`, `link` |
| `geo.*` | GIS and administrative nodes | `create`, `view`, `map` |
| `program.*` | Development initiative lifecycle | `create`, `approve`, `view`, `decommission` |
| `case.*` | Individual program intervention | `create`, `approve`, `close`, `view` |
| `budget.*` | Financial allocation | `allocate`, `view`, `authorize` |
| `form.*` | Dynamic data capture definitions | `create`, `design`, `view`, `publish` |
| `visit.*` | Field agent activities | `execute`, `verify`, `view` |
| `audit.*` | System activity logs | `view-all`, `export` |
| `integration.*`| External partner connections | `register`, `approve`, `configure` |
