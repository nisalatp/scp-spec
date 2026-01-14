# Terminology & ID Normalization Log

This log records the standardization of system terminology to ensure alignment across SPEC, Docs, and UML.

## 1. Components & Modules

| Original / Variant | Canonical Name (SPEC) | Rationale |
| :--- | :--- | :--- |
| Tenancy | **Tenant Management** | SPEC/06-01 |
| Identity / Person Registry | **Identity (Person & Household)** | Combined registry concept |
| Geo | **Geo Engine** | SPEC/06-02 |
| Consent | **Consent Management** | SPEC/04-09 |
| Security-Access-Control | **Security & Access Control** | SPEC/04 |
| FormBuilder | **Form Builder** | SPEC/06-06 |
| FormScripting | **Form Scripting** | SPEC/06-13 |
| Data-Collection / Field Ops | **Field Operations** | SPEC/08-01 |
| Case Mgmt / Case Management | **Workflow & Case Management** | SPEC/03-05, SPEC/08-05 |
| Eligibility | **Eligibility Rules** | SPEC/03-04 |
| Finance | **Finance** | SPEC/03-11 |
| Marketplace | **Marketplace Access** | SPEC/03-12 |

## 2. Roles

| Original / Variant | Canonical Role (SPEC/Docs) | Notes |
| :--- | :--- | :--- |
| ROOT / Global Admin | **ROOT** | Global super-admin bypass. |
| System Administrator | **Platform Admin** | Global platform management. |
| Tenant Administrator | **Tenant Admin** | Tenant-level configuration. |
| Field Agent | **Field Agent** | Mobile app user. |
| Case Manager / Worker | **Case Worker** | Individual case handling. |
| NGO Manager / Program Lead | **Program Manager** | Program design & ops. |
| Vertical Lead | **Vertical Owner** | Domain governing authority. |
| Finance Lead | **Finance Manager** | Budget & Payout approval. |
| Integration Manager | **Integration Manager** | API & Webhook management. |
| Auditor | **Auditor** | Read-only compliance review. |

## 3. Verticals

| Original / Variant | Canonical Vertical (SPEC/07-01) | Key |
| :--- | :--- | :--- |
| Health, WASH | **Health and Environment** | `health` |
| Edu, Skills | **Education, Sports, and Skill Development** | `education` |
| Economy, Jobs | **Economy and Livelihood** | `economy` |
| Finance, Aid | **Finance** | `finance` |
| Data, Stats | **Data** | `data` |
| Social Protection | **Social Protection** (Custom/Domain) | `social_protection` |

## 4. Permission Namespaces
Standardized to `resource.action` using canonical component keys.
- `tenant.*`, `config.*`, `policy.*`, `role.*`, `geo.*`, `program.*`, `case.*`, `person.*`, `household.*`, `relationship.*`, `consent.*`, `attachment.*`, `form.*`, `visit.*`, `report.*`, `integration.*`, `pipeline.*`, `donor.*`, `marketplace.*`
