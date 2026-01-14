# Finance Manager

## Description
The **Finance Manager** is responsible for the monetary aspects of the system. They manage budgets, approve funding requests, and oversee disbursements to payment providers.

## Responsibilities
- **Budgeting**: Allocating funds to Verticals and Programs.
- **Obligation Management**: Ensuring enough funds are reserved for commitments.
- **Reconciliation**: Verifying that payments have been successfully delivered.

## Access Scope
- **Scope**: Tenant / Finance Module.

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Finance** | [Define Budget](../../Docs/System/Finance/features/define-budget.md) | `budget.create`, `budget.update` |
| **Finance** | [Record Obligation](../../Docs/System/Finance/features/record-obligation.md) | `obligation.manage` |
| **Finance** | [View Financial Status](../../Docs/System/Finance/features/view-financial-status.md) | `finance.view` |
| **Workflows & Case Management** | [Approve Program](../../Docs/System/Workflows-Case-Management/features/approve-program.md) | `program.approve-financial` (Financial clearance) |
| **Analytics & Data Mesh** | [Export Data](../../Docs/System/Analytics-DataMesh/features/export-data.md) | `export.financial` |

## Key Workflows
1.  **Budget Allocation**: Setting the annual budget for the "Social Welfare" vertical.
2.  **Pre-Disbursement Check**: Verifying that there are enough funds in the "Emergency Relief" pot before a payment run is triggered.
3.  **Reconciliation**: Uploading bank statement files to reconcile successful payments against system records.
