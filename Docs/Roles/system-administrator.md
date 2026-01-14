# System Administrator

## Description
The **System Administrator** is a super-user role responsible for the overall health, configuration, and tenancy of the SCP platform. They operate at the global implementation level and do not typically interact with business data (beneficiaries, cases) directly unless debugging.

## Responsibilities
- **Tenant Management**: Provisioning and configuring new Tenants.
- **System Configuration**: Managing global settings, environment variables, and system-wide feature flags.
- **Infrastructure Monitoring**: Ensuring system uptime and performance.
- **Security Oversight**: Managing global security policies and certificates.

## Access Scope
- **Scope**: Platform-wide (Cross-Tenant capable, but usually scoped to the Platform Management Console).

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Tenant Management** | [Register Tenant](../../Docs/System/Tenant-Management/features/register-tenant.md) | `tenant.create` |
| **Tenant Management** | [Configure Tenant](../../Docs/System/Tenant-Management/features/configure-tenant.md) | `tenant.configure`, `tenant.update` |
| **Configuration Management** | [Set System Property](../../Docs/System/Configuration-Management/features/set-system-property.md) | `system.config.write` |
| **Configuration Management** | [Manage Feature Flags](../../Docs/System/Configuration-Management/features/manage-feature-flags.md) | `feature.flag.manage-global` |
| **Security & Access Control** | Manage IDP | `idp.configure` |
| **Audit Logging** | [Search Audit Logs](../../Docs/System/Audit-Logging/features/search-audit-logs.md) | `audit.view-all` |

## Key Workflows
1.  **Onboarding a new Government Partner**: Create a new Tenant, configure their domains and IDP.
2.  **Platform Upgrade**: Enable new system-wide features via Feature Flags.
3.  **Investigating Incidents**: Accessing global audit logs to trace system performance or security issues.
