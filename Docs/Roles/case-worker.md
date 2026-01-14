# Case Worker

## Description
The **Case Worker** is a backend operational role responsible for managing individual cases that require manual intervention. Unlike Field Agents, they typically work from an office/desktop environment and handle complex workflows.

## Responsibilities
- **Case Management**: Reviewing incoming cases and ensuring data completeness.
- **Approvals**: Providing first-level approval or rejection for eligibility.
- **Exception Handling**: Resolving data issues or disputes.

## Access Scope
- **Scope**: Specific Vertical / Program / Geo.

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Workflows & Case Management** | [Approve Workflow](../../Docs/System/Workflows-Case-Management/features/approve-workflow.md) | `case.approve`, `case.reject` |
| **Workflows & Case Management** | [Close Case](../../Docs/System/Workflows-Case-Management/features/close-case.md) | `case.close` |
| **Workflows & Case Management** | [Manage Suspension](../../Docs/System/Workflows-Case-Management/features/manage-suspension.md) | `case.suspend` |
| **Identity (Person & Household)** | [Manage Membership](../../Docs/System/Identity/features/manage-membership.md) | `member.update` |
| **Attachments & Documents** | [View Attachment](../../Docs/System/Attachments-Documents/features/view-attachment.md) | `attachment.view` |

## Key Workflows
1.  **Eligibility Review**: Checking uploaded documents (ID, Income Certificate) to verify a beneficiary's claim.
2.  **Complaint Resolution**: Handling a grievance filed by a citizen who was denied benefits.
3.  **Data Correction**: Fixing a spelling error in a beneficiary's name based on a support ticket.
