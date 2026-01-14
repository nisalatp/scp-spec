# Use Case Realization Map

This document maps each Use Case to its canonical Roles, Components, and Permissions, verifying alignment with the SPEC.

| UC ID | Title | Primary Role | Core Components | Key Permissions | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| UC-01 | Emergency Blood Match | Case Worker | Identity, Health | `person.read`, `health.read` | [x] Aligned |
| UC-02 | High-Risk Pregnancy | Field Agent | Identity, Health | `person.read`, `health.update` | [x] Aligned |
| UC-03 | Chronic Disease | Case Worker | Identity, Health | `health.read`, `visit.create` | [x] Aligned |
| UC-04 | Vaccination Gaps | Program Manager | Analytics, Health | `report.read`, `campaign.create` | [x] Aligned |
| UC-05 | School Supplies | Program Manager | Education, Finance | `program.read`, `finance.disburse` | [x] Aligned |
| UC-06 | Dropout Risk | Case Worker | Education, Workflow | `education.read`, `case.create` | [x] Aligned |
| UC-07 | Scholarship Targeting | Program Manager | Education, Finance | `program.enrol`, `finance.budget` | [x] Aligned |
| UC-08 | Youth Skills | Integration Mgr | Education, Economy | `integration.sync`, `skill.verify` | [x] Aligned |
| UC-09 | Sanitation Planning | Vertical Owner | Geo Engine, Health | `geo.read`, `facility.create` | [x] Aligned |
| UC-10 | Clean Water | Field Agent | Geo Engine, Health | `visit.create`, `geo.report` | [x] Aligned |
| UC-11 | Housing Repair | Program Manager | Economy, Finance | `program.create`, `finance.payout` | [x] Aligned |
| UC-12 | Env Risk Mapping | Vertical Owner | Geo Engine, Health | `geo.analyze`, `alert.send` | [x] Aligned |
| UC-13 | Elderly Support | Case Worker | Identity, Social Protection | `person.read`, `visit.schedule` | [x] Aligned |
| UC-14 | Disability Support | Case Worker | Health, Social Protection | `health.verify`, `finance.disburse` | [x] Aligned |
| UC-15 | Food Assistance | Program Manager | Economy, Social Protection | `economy.audit`, `finance.disburse` | [x] Aligned |
| UC-101 | Register Beneficiary | Field Agent | Identity, Consent | `person.create`, `consent.capture` | [x] Aligned |
| UC-102 | Launch Program | Program Manager | Programs, Rules | `program.create`, `policy.define` | [x] Aligned |
| UC-103 | Process Case | Case Worker | Workflow, Notifications | `case.update`, `notify.send` | [x] Aligned |
| UC-104 | Disburse Benefits | Finance Manager | Finance, Integrations | `finance.approve`, `payment.sync` | [x] Aligned |
| UC-105 | Onboard Partner | Tenant Admin | Integrations, Security | `integration.create`, `role.assign` | [x] Aligned |

## Reconciliation Notes
- All UCs have been checked for "Naming Drift" (e.g., ensuring "Case Worker" is used).
- Permission prefixes have been synchronized to the canonical component keys.
- Each UC now includes an explicit "Auth & Scope" block in its documentation.
