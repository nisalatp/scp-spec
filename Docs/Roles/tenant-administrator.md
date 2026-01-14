# Tenant Administrator

## Description
The **Tenant Administrator** is the highest-level authority *within* a specific Tenant (e.g., a specific Country Office or Ministry). They are responsible for configuring the tenant's environment, managing users, and defining organizational structures.

## Responsibilities
- **User Management**: Creating users and assigning roles.
- **Organization Structure**: Defining Verticals and Geo Scopes.
- **Integration Registry**: Approving integrations and webhooks.
- **Notification Config**: Setting up SMS/Email gateways.

## Access Scope
- **Scope**: Single Tenant.

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Identity (Person & Household)** | [Register User](../../Docs/System/Identity/features/user-management.md) | `user.create`, `user.manage` |
| **Identity (Person & Household)** | Assign Role | `role.assign` |
| **Vertical Governance** | [Register Vertical](../../Docs/System/Vertical-Governance/features/register-vertical.md) | `vertical.create` |
| **Notifications** | [Configure Notification Channel](../../Docs/System/Notifications/features/configure-notification-channel.md) | `notification.config` |
| **Integrations Layer** | [Register Integration](../../Docs/System/Integrations-Layer/features/register-integration.md) | `integration.register` |
| **Integrations Layer** | [Approve Integration](../../Docs/System/Integrations-Layer/features/approve-integration.md) | `integration.approve` |
| **Configuration Management** | [Manage Feature Flags](../../Docs/System/Configuration-Management/features/manage-feature-flags.md) | `feature.flag.toggle-tenant` |

## Key Workflows
1.  **Setting up a new Project**: Create Verticals, assign Vertical Owners.
2.  **Onboarding Staff**: Create user accounts for Program Managers and Field Agents.
3.  **Connecting Partners**: Approve API Integration requests from external NGOs or Banks.
