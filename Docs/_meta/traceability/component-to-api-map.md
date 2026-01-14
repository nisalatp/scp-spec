# Component to API Traceability Map

This map centralizes the primary APIs and Events for each system component.

| Component | Endpoint/Event | Purpose | Auth | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Tenancy** | `POST /admin/tenants` | Create Tenant | ROOT | Idem: code |
| **Tenancy** | `TenantCreated` | Event: New Tenant | - | Topic: sys.tenancy |
| **Identity** | `POST /person` | Create Identity | Field Agent | Idem: NatID check |
| **Identity** | `PersonCreated` | Event: New Person | - | Topic: ids.person |
| **Data Collection**| `POST /field/sync` | Mobile Sync | Field Agent | Batch Upload |
| **Data Collection**| `VisitSubmitted` | Event: Field Visit | - | Topic: ops.field |
| **Programs** | `POST /programs/{id}/enroll`| Enrollment | Prog Mgr / Agent | Idem: OK if exists |
| **Programs** | `ProgramLaunched` | Event: Activation | - | Topic: biz.program |
| **Workflows** | `POST /worklows/{id}/transition`| Approval Flow | Case Worker | State-dependent |
| **Workflows** | `CaseApproved` | Event: Decision | - | Topic: biz.case |
| **Eligibility** | `POST /rules/{id}/eval`| Run Evaluation | System | Internal use |
| **Finance** | `POST /finance/obligations`| Record Pledge | Finance Mgr | Pre-payment check |
| **Finance** | `ObligationApproved`| Event: Authorization | - | Topic: finance.core |
| **Integrations** | `POST /hooks/{id}` | Inbound Hook | External | Verified CID/Secret |
| **Geo Engine** | `POST /geo/resolve` | Point Translation | Any | Spatial resolution |
| **Notifications** | `POST /internal/notify`| Internal Alert | System | Unique RequestID |
| **Audit Logging** | `GET /audit/search` | Query Logs | Auditor / Admin | Elastic search |
| **People** | `POST /households` | Create Group | Field Agent | Link People to Home |
