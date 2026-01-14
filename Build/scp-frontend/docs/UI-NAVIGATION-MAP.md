# UI Navigation Map

This document maps user roles (personas) to the top-level screens required to satisfy SCP core use cases.

## Primary Personas & Entry Points

| Role | Primary Dashboard | Key Navigation Modules | Feature References |
| :--- | :--- | :--- | :--- |
| **Field Agent** | Field Operations | Enrollment, Visit List, Map View | `visit.*`, `person.create` |
| **Case Worker** | Case Management | Inbox, Member Profile, Attachments | `case.*`, `member.*` |
| **Program Manager** | Program Insight | Form Builder, Rules Manager, Reports | `program.*`, `form.*` |
| **Tenant Administrator** | Tenant Config | User List, Integration Hub, Settings | `user.*`, `tenant.*` |
| **System Administrator** | Platform Ops | Global Config, Audit Logs, Multi-Tenant | `system.*`, `audit.*` |

## UC-### Coverage Screen Map

1.  **UC-101 (Register Beneficiary)**
    - Target: Field Agent, Case Worker
    - Screens: Search Citizen -> Consent Capture -> Personal Info -> Household Linkage -> Annexures.
2.  **UC-102 (Launch Program)**
    - Target: Program Manager, Vertical Owner
    - Screens: Program Definitions -> Vertical Selection -> Rules DSL -> Approval Workflow.
3.  **UC-103 (Process Case)**
    - Target: Case Worker
    - Screens: Verification Dashboard -> Case Detail -> Intervention Action -> Progress Record.
4.  **UC-104 (Disburse Benefits)**
    - Target: Finance Manager
    - Screens: Payment Batch -> Budget View -> Authorized Disbursement -> Receipt Confirmation.
5.  **UC-105 (Onboard Partner)**
    - Target: Tenant Administrator, Integration Manager
    - Screens: Partner Profile -> API Key Management -> Webhook Configuration.
