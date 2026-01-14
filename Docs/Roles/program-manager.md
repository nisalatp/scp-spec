# Program Manager

## Description
The **Program Manager** is responsible for designing and managing specific social protection programs (e.g., "Senior Citizen Cash Transfer", "Emergency Flood Relief"). They define the eligibility criteria, benefits, and workflows for their programs.

## Responsibilities
- **Program Design**: Defining benefits, cycles, and target audiences.
- **Policy Configuration**: Creating eligibility rules and scoring logic.
- **Monitoring**: Tracking program performance and enrollment numbers.

## Access Scope
- **Scope**: Specific Programs within a Vertical.

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Workflows & Case Management** | [Define Program](../../Docs/System/Workflows-Case-Management/features/define-program.md) | `program.create`, `program.update` |
| **Workflows & Case Management** | [Enroll Beneficiary](../../Docs/System/Workflows-Case-Management/features/enroll-beneficiary.md) | `enrollment.manage` |
| **Eligibility Rules** | [Define Rule Set](../../Docs/System/Eligibility-Rules/features/define-rule-set.md) | `rules.write` |
| **Eligibility Rules** | [Test Rule Set](../../Docs/System/Eligibility-Rules/features/test-rule-set.md) | `rules.test` |
| **Form Scripting** | [Import Form Package](../../Docs/System/Form-Scripting/features/import-form-package.md) | `forms.upload` |
| **Analytics & Data Mesh** | [Generate Report](../../Docs/System/Analytics-DataMesh/features/generate-report.md) | `report.generate` |

## Key Workflows
1.  **Launching a New Policy**: Designing the eligibility rules for a new subsidy and simulating it against existing data.
2.  **Enrollment Review**: Approving a batch of beneficiaries who have applied for the program.
3.  **Performance Tracking**: Viewing the dashboard to see how many disbursements have been successful this month.
