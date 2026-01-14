# System Component Matrix

This matrix maps System Components to their Primary Owners, Key Users, and Core Use Cases.

## Core Platform

# System Component Matrix

This matrix maps System Components to their Primary Owners, Key Users, and Core Use Cases.

## Core Platform

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Tenant Management** | ROOT | Platform Admin | Configuring Country-Specific Settings |
| **Identity (Person & Household)** | National ID Authority | Case Worker | "Find Beneficiary by NIC" |
| **Geo Engine** | Surveyor General | Field Agent | Locating a Beneficiary |
| **Consent** | Privacy Officer | All | "Can I see this record?" |
| **Security & Access Control**| Security Lead | System | Logging in |
| **Form Builder** | Program Designer | Field App | Creating "Intake Form" |
| **Form Scripting**| DevOps | System | deploying `forms.yaml` |
| **Field Operations** | Field Manager | Field Agent | "My Visits Today" |
| **Notifications**| Comms Officer | System | Sending SMS Alerts |
| **Integrations Layer** | System Architect | External Systems | Syncing Payment Gateway |

## Domain & Verticals

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Workflows & Case Management** | Program Manager | Case Worker | Lifecycle of "Maternal Nutrition Program" |
| **Eligibility Rules** | Policy Maker | System | "Is Income < 5000?" |
| **Finance** | Finance Officer | Case Worker | "Approve Grant Disbursement" |
| **Marketplace Access** | Umbrella Admin | NGO Partners | "Grant API Access to WHO" |

## Registries

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Facility Registry** | Ministry Admin | Public | "Find nearest Clinic" |
| **Community Center Registry**| Community Leader | Field Agent | "Book Village Hall" |
| **Infrastructure Project Registry**| Planner | Public | "View Road Construction Status" |
| **Attachments & Documents** | Security (Auto) | User | "Upload ID Photo" |

## Analytics, Config & Governance

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Analytics & Data Mesh**| Domain Analyst | Policy Maker | "View National Trends" |
| **Audit Logging** | Auditor | Security Officer | "Who deleted this record?" |
| **Metadata & Versioning** | System Architect | System | "Load Form v2 for old record" |
| **Vertical Governance** | Vertical Admin | Program Manager | Segregating "Health" from "Education" |
| **Configuration Management** | DevOps | System | "Turn on Maintenance Mode" |
