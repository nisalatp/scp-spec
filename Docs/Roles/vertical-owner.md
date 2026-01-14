# Vertical Owner

## Description
The **Vertical Owner** is the governance authority for a specific functional domain or "Vertical" (e.g., Health, Education, Agriculture). They ensure that data within their domain is managed correctly and that programs align with higher-level goals.

## Responsibilities
- **Governance**: Approving programs and major policy changes within the vertical.
- **Data Stewardship**: Managing data products and sharing settings.
- **User Delegation**: Assigning Program Managers for specific initiatives.

## Access Scope
- **Scope**: Specific Vertical (e.g., "Health").

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Vertical Governance** | [Configure Vertical](../../Docs/System/Vertical-Governance/features/configure-vertical.md) | `vertical.configure` |
| **Vertical Governance** | [Assign Vertical Owner](../../Docs/System/Vertical-Governance/features/assign-vertical-owner.md) | `vertical.delegate` |
| **Workflows & Case Management** | [Approve Program](../../Docs/System/Workflows-Case-Management/features/approve-program.md) | `program.approve` |
| **Analytics & Data Mesh** | [Publish Data Product](../../Docs/System/Analytics-DataMesh/features/publish-data-product.md) | `data.publish` |
| **Audit Logging** | [Search Audit Logs](../../Docs/System/Audit-Logging/features/search-audit-logs.md) | `audit.view-vertical` |

## Key Workflows
1.  **Approving a Program**: Reviewing the design and budget of a new "Vaccination Drive" program before it goes live.
2.  **Data Sharing**: Authorizing the "Education Department" to view "Health" data for school meal planning.
3.  **Compliance Audit**: Reviewing access logs to see who has been viewing sensitive medical records in their vertical.
