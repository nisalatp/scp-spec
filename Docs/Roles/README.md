# System Roles & Permissions

This section documents the standard roles within the SCP system. Roles define the capabilities and access levels assigned to users, governing their interaction with the various System Components.

## Role Model
SCP uses a Role-Based Access Control (RBAC) model.
- **Users** are assigned one or more **Roles**.
- **Roles** are collections of **Permissions**.
- **Permissions** are granular entitlements to perform specific actions (e.g., `program:create`, `case:approve`).

## Standard Roles

| Role | Scope | Description |
| :--- | :--- | :--- |
| [System Administrator](./system-administrator.md) | Platform | Manages tenants, infrastructure, and global settings. |
| [Tenant Administrator](./tenant-administrator.md) | Tenant | Manages tenant-specific configuration, users, and organizational structure. |
| [Field Agent](./field-agent.md) | Geo / Catchment | Front-line worker using the mobile app to collect data and deliver services. |
| [Program Manager](./program-manager.md) | Program | Designs and manages specific intervention programs (e.g., Cash Transfer, Fertilizer Subsidy). |
| [Vertical Owner](./vertical-owner.md) | Vertical | Governing authority for a functional domain (e.g., Ministry of Health). |
| [Finance Manager](./finance-manager.md) | Finance | Manages budgets, pledges, and approves disbursements. |
| [Integration Manager](./integration-manager.md) | Tenant | Manages external system connections, webhooks, and API keys. |
| [Auditor](./auditor.md) | Tenant / Vertical | Read-only access to audit logs and reports for compliance verification. |
| [Case Worker](./case-worker.md) | Vertical / Geo | Manages individual cases and beneficiary interactions at a backend level. |

## Application
Roles are applied at different scopes:
- **Global**: System Admin.
- **Tenant**: Tenant Admin, Integration Manager.
- **Vertical**: Vertical Owner.
- **Program**: Program Manager.
- **Geo/Location**: Field Agent.
