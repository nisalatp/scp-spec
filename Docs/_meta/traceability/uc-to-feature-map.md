# Use Case to Feature Traceability Map

This map traces high-level use cases to their implementing components, features, and technical requirements.

| UC-### | Component(s) | Feature(s) | Role(s) | Permission(s) | API/Event(s) | Data touched |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **UC-101** | Data Coll, Identity, People, Geo | [Field Visit](../../Docs/System/Data-Collection/features/execute-field-visit.md), [HH Registration](../../Docs/System/People-Households-Families/features/register-household.md) | Field Agent | `visit:execute`, `household:create`, `person:create` | `POST /field/sync`, `VisitSubmitted` | Person, HH, GPS |
| **UC-102** | Programs, Rules, Finance, Gov | [Define Program](../../Docs/System/Programs/features/define-program.md), [Define Rules](../../Docs/System/Eligibility-Rules/features/define-rule-set.md) | Prog Mgr, Vert Owner | `program:create`, `rules:write`, `program:approve` | `POST /programs`, `PolicyActivated` | Program, GenericPolicy |
| **UC-103** | Workflows, Case Mgmt | [Create Case](../../Docs/System/Workflows-Case-Management/features/create-case.md), [Approve Case](../../Docs/System/Workflows-Case-Management/features/approve-workflow.md) | Agent, Case Worker | `case:create`, `case:approve` | `POST /cases`, `CaseApproved` | Case, StepHistory |
| **UC-104** | Finance, Eligibility, Integrations | [Obligation](../../Docs/System/Finance/features/record-obligation.md), [Eval Rules](../../Docs/System/Eligibility-Rules/features/test-rule-set.md) | Finance Mgr, Sys | `obligation:manage`, `finance:view` | `POST /finance/obligations`, `ObligationApproved` | Obligation, Ledger |
| **UC-105** | Integrations, Security | [Register Integration](../../Docs/System/Integrations/features/register-integration.md), [Access Grants](../../Docs/System/Security-Access-Control/features/grant-access.md) | Tenant Admin, Integr Mgr | `integration:register`, `api-key:generate` | `POST /admin/integrations`, `RoleAssigned` | APIKey, Webhook |
| **UC-201** | Analytics, Geo | [KPI Def](../../Docs/System/Analytics-DataMesh/features/define-kpi.md), [Geo Resolve](../../Docs/System/Geo/features/geospatial-query.md) | Vert Owner, Auditor | `report:generate`, `audit:view-all` | `GET /audit/search`, `GET /geo/hierarchy` | AuditLogs, GeoMetrics |

*Note: UC IDs are mapped from the core Use Case documents in Docs/UseCases.*
