# Global Inventory - Jan 2026

This document provides a comprehensive list of all system entities, components, and artifacts identified during the Phase 1 of the Full System Reconciliation.

## 1. Components (from SPEC & Docs)
- **Tenant Management**: Tenant management, country-specific settings.
- **Identity (Person & Household)**: Person and Household registries, national ID integration.
- **Geo Engine**: GIS engine, spatial boundaries, geolocation.
- **Consent**: Data sharing agreements, privacy boundary enforcement.
- **Security & Access Control**: PDP/PIP, RBAC, OAuth2/OIDC.
- **Form Builder**: Dynamic schema engine for intake and surveys.
- **Form Scripting**: DSL-based logic for form behavior and data binding.
- **Field Operations**: Mobile sync, task management, route planning.
- **Notifications**: SMS, Email, In-app alerts.
- **Integrations Layer**: External adapters (Payment, SMS, Gov ID).
- **Workflows & Case Management**: State machines, task orchestration.
- **Eligibility Rules**: Logic engine for benefit determination.
- **Finance**: Budgets, pledges, disbursements, ledger.
- **Marketplace Access**: Third-party agency integration portal.
- **Facility Registry**: Clinics, schools, and service points.
- **Community Center Registry**: Local coordination hubs.
- **Infrastructure Project Registry**: Monitoring of physical works.
- **Attachments & Documents**: Secure blob storage and metadata.
- **Analytics & Data Mesh**: National trends, multi-tenant reporting.
- **Audit Logging**: Tamper-evident event trail.

## 2. Roles (Standardized)
- **System Administrator**: Global platform/infra management.
- **Tenant Administrator**: Tenant-specific configuration.
- **Field Agent**: On-ground data collection (Mobile).
- **Case Worker**: Individual case triage and management.
- **Program Manager**: Design and lifecycle of interventions.
- **Vertical Owner**: Oversight of a functional domain (Health, SP).
- **Finance Manager**: Budget authorization and disbursements.
- **Integration Manager**: API/Webhook life-cycle management.
- **Auditor**: Compliance and log review.

## 3. Use Cases (UC-###)
- **UC-01 - UC-15**: Specific vertical scenarios (Health, Edu, SP, Econ).
- **UC-101**: Register Beneficiary (Core Journey).
- **UC-102**: Launch New Program (Core Journey).
- **UC-103**: Process Case Intervention (Core Journey).
- **UC-104**: Disburse Benefits (Core Journey).
- **UC-105**: Onboard Partner (Core Journey).

## 4. Permissions (Namespaces)
- `tenant.*`, `config.*`, `policy.*`, `role.*`
- `geo.*`, `community_center.*`, `vertical.*`
- `program.*`, `case.*`, `person.*`, `household.*`
- `relationship.*`, `consent.*`, `attachment.*`, `form.*`
- `visit.*`, `report.*`, `integration.*`, `pipeline.*`
- `donor.*`, `marketplace.*`

## 5. Data Entities (Key)
- Person, Household, Family
- Geo Node, Location, Boundary
- Community Center, Facility, Project
- Vertical, Program, Case, Outcome
- Service Encounter, Attendance, Visit
- Identity Record, Biometric Template
- Consent Record, Audit Entry
- Dispatch, Notification, SMS/Email
- Budget, Pledge, Disbursement, Ledger Entry
- Integration Partner, Client Credential

## 6. Scripts & Packages
- **Sri Lanka Top 15**: `Scripts/SriLanka/packages/sri-lanka-top15.forms.yaml`
- **Import Automation**: `Scripts/SriLanka/import/import-sri-lanka-top15.sh`

## 7. Diagrams
- **C4**: Context, Container, Component (Level 1-3).
- **UML**: Use Cases, Activity, Sequence, Class, ERD, State.
- **Locations**: `Diagrams/C4/`, `Diagrams/UML/`
