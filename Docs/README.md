# SCP System Documentation

Welcome to the technical documentation for the Social Protection Platform (SCP).

## Documentation Structure

The documentation is organized into three primary sections:

### 1. [System Components](./System/README.md)
Detailed technical breakdown of the 24 functional components that make up the platform.
*   **Core**: Tenancy, Identity, Security, Consent.
*   **Business**: Verticals, Programs, Workflows, Eligibility.
*   **Ops**: Data Collection, Notifications, Payments.
*   **Support**: Analytics, Audit, Configuration.

### 2. [Roles & Permissions](./Roles/README.md)
Access control definitions mapped to system components.
*   **Admins**: [System](./Roles/system-administrator.md), [Tenant](./Roles/tenant-administrator.md).
*   **Operational**: [Field Agent](./Roles/field-agent.md), [Program Manager](./Roles/program-manager.md).
*   **Governance**: [Vertical Owner](./Roles/vertical-owner.md), [Auditor](./Roles/auditor.md).

### 3. [Use Cases & Journeys](./UseCases/README.md)
End-to-end user stories describing how components work together.
*   [Register Beneficiary](./UseCases/register-beneficiary.md)
*   [Launch Program](./UseCases/launch-program.md)
*   [Process Case](./UseCases/process-case.md)
*   [Disburse Benefits](./UseCases/disburse-benefits.md)

## Reference
*   **Governance Features**: See [Configuration Management](./System/Configuration-Management/features/README.md).
*   **Security Model**: See [Security & Access Control](./System/Security-Access-Control/features/README.md).
*   **Data Dictionary**: See individual Component READMEs.
