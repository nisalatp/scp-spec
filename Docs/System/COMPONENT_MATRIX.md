# System Component Matrix

This matrix maps System Components to their Primary Owners, Key Users, and Core Use Cases.

## Core Platform

# System Component Matrix

This matrix maps System Components to their Primary Owners, Key Users, and Core Use Cases.

## Core Platform

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Tenant Management** | ROOT | Platform Admin | Configuring Country-Specific Settings |
| **Identity (Person & Household)** | Tenant Administrator | Case Worker | "Find Beneficiary by NIC" |
| **Geo Engine** | Geo Admin | Field Agent | Locating a Beneficiary |
| **Consent** | Umbrella Authority | All | "Can I see this record?" |
| **Security & Access Control**| System Administrator | System | Logging in |
| **Form Builder** | Program Manager | Field App | Creating "Intake Form" |
| **Form Scripting**| System Administrator | System | deploying `forms.yaml` |
| **Field Operations** | Program Manager | Field Agent | "My Visits Today" |
| **Notifications**| Tenant Administrator | System | Sending SMS Alerts |
| **Integrations Layer** | System Administrator | External Systems | Syncing Payment Gateway |

## Domain & Verticals

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Programs** | Program Manager | Vertical Owner | Defining "Social Safety Net" parameters |
| **Workflows & Case Management** | Program Manager | Case Worker | Lifecycle of an individual intervention |
| **Eligibility Rules** | Vertical Owner | System | "Is Income < 5000?" |
| **Finance** | Finance Manager | Case Worker | "Approve Grant Disbursement" |
| **Marketplace Access** | Umbrella Authority | NGO Partners | "Grant API Access to WHO" |

## Registries

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Facility Registry** | Vertical Owner | Public | "Find nearest Clinic" |
| **Community Center Registry**| Field Agent | Field Agent | "Book Village Hall" |
| **Infrastructure Project Registry**| Vertical Owner | Public | "View Road Construction Status" |
| **Attachments & Documents** | System Administrator | User | "Upload ID Photo" |

## Analytics, Config & Governance

| Component | Owner (Role) | Key Users | Primary Use Case |
|---|---|---|---|
| **Analytics & Data Mesh**| Vertical Owner | Policy Maker | "View National Trends" |
| **Audit Logging** | Auditor | Security Officer | "Who deleted this record?" |
| **Metadata & Versioning** | System Administrator | System | "Load Form v2 for old record" |
| **Vertical Governance** | Vertical Owner | Program Manager | Segregating "Health" from "Education" |
| **Configuration Management** | System Administrator | System | "Turn on Maintenance Mode" |
