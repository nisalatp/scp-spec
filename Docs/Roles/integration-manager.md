# Integration Manager

## Description
The **Integration Manager** serves as the technical point of contact for external partnerships. They configure how the SCP system talks to the outside world, managing API credentials, webhooks, and data exchange agreements.

## Responsibilities
- **Partner Onboarding**: Configuring credentials for external systems.
- **Webhook Management**: Setting up event subscriptions for partners.
- **Monitoring**: Debugging failed integration requests.

## Access Scope
- **Scope**: Tenant (Integration Module).

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Integrations Layer** | [Register Integration](../../Docs/System/Integrations-Layer/features/register-integration.md) | `integration.register` |
| **Integrations Layer** | [Manage Webhooks](../../Docs/System/Integrations-Layer/features/manage-webhooks.md) | `webhook.configure` |
| **Security & Access Control** | Manage API Keys | `api.key.generate` |
| **Audit Logging** | View Integration Logs | `integration.logs` |

## Key Workflows
1.  **Bank Integration**: Configuring the secure connection to "National Bank" for payment processing.
2.  **Webhook Setup**: Setting up a webhook to notify a "Health MIS" whenever a new pregnancy is registered.
3.  **Troubleshooting**: Investigating why a batch of API requests from a partner failed.
