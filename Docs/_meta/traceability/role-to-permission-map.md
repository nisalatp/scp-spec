# Role to Permission Traceability Map

This map defines the permissions and scope constraints for each standard role in the SCP system.

| Role | Permissions | Scope Constraints | Notes |
| :--- | :--- | :--- | :--- |
| **System Administrator** | `tenant:create`, `tenant:configure`, `tenant:update`, `system:config:write`, `feature-flag:manage-global`, `idp:configure`, `audit:view-all` | Global / Platform-wide | Manages multiple tenants. |
| **Tenant Administrator** | `user:create`, `user:manage`, `role:assign`, `vertical:create`, `notification:config`, `integration:register`, `integration:approve`, `feature-flag:toggle-tenant` | Single Tenant | Highest authority within a tenant. |
| **Field Agent** | `profile:view`, `visit:execute`, `sync:perform`, `household:create`, `member:add`, `member:remove`, `case:create`, `facility:create` | GEO Scope (Village/District) | Mobile app focus, offline capability. |
| **Program Manager** | `program:create`, `program:update`, `enrollment:manage`, `rules:write`, `rules:test`, `forms:upload`, `report:generate` | Specific Programs | Designs and monitors interventions. |
| **Vertical Owner** | `vertical:configure`, `vertical:delegate`, `program:approve`, `data:publish`, `audit:view-vertical` | Single Vertical | Governance and data stewardship. |
| **Finance Manager** | `budget:create`, `budget:update`, `obligation:manage`, `finance:view`, `program:approve-financial`, `export:financial` | Multi-Vertical / Tenant | Manages fiscal limits and disbursements. |
| **Integration Manager** | `integration:register`, `webhook:configure`, `api-key:generate`, `integration:logs` | Tenant (Integrations) | Technical point for partners. |
| **Auditor** | `audit:view-all`, `audit:export`, `report:generate`, `*:view` | Tenant / Vertical / Program | Read-only access for compliance. |
| **Case Worker** | `case:approve`, `case:reject`, `case:close`, `case:suspend`, `member:update`, `attachment:view` | Vertical / Program / GEO | Backend operational management. |
