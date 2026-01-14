# Auditor

## Description
The **Auditor** is a specialized role with extensive *read-only* access. Their primary function is to verify compliance, investigate security incidents, and ensure that the system is being used appropriately. They cannot modify data.

## Responsibilities
- **Compliance Checks**: Verifying that processes followed the defined workflow.
- **Fraud Investigation**: Looking for patterns of abuse in financial or beneficiary data.
- **Security Review**: Monitoring access logs for suspicious activity.

## Access Scope
- **Scope**: Tenant / Vertical / Program (depending on assignment).

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Audit Logging** | [Search Audit Logs](../../Docs/System/Audit-Logging/features/search-audit-logs.md) | `audit.view-all` |
| **Audit Logging** | [Capture Audit Event](../../Docs/System/Audit-Logging/features/capture-audit-event.md) | `audit.export` (Download logs) |
| **Analytics & Data Mesh** | [Generate Report](../../Docs/System/Analytics-DataMesh/features/generate-report.md) | `report.generate` |
| **All Components** | Read-Only View | `*.view` (Often granted broad read permissions) |

## Key Workflows
1.  **Annual Audit**: Randomly sampling 100 cases to verify that proper approvals were obtained before payment.
2.  **Incident Response**: Investigating an alert about a user attempting to access 5000 profiles in 10 minutes.
3.  **Process Verification**: Confirming that all "High Risk" cases were approved by a Vertical Owner.
