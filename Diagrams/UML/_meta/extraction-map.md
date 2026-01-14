# System Extraction Map

**Source**: `c:/Users/NisalaBandara/Downloads/scp-spec/SPEC/`
**Generated**: 2026-01-14

## 1. Modules & Bounded Contexts
- **Security**: AuthZ, Authentication (Keycloak), Audit, Data Masking.
- **Governance**: Policies, Authority Registry, Conflict Resolution.
- **Platform Core**: Tenants, Geo Engine, Person Registry, Household Registry, Forms.
- **Verticals**: Health, Education, Economy, Finance, Data.
- **Operations**: Field Ops, Reporting, Notifications.
- **Integrations**: Adapters for Payment, SMS, Gov ID.

## 2. Actors
- **Beneficiary**: The end user receiving aid.
- **Field Agent**: Mobile app user collecting data.
- **Donor**: Funder viewing reports.
- **Gov Official**: Auditor/Compliance.
- **NGO Manager**: Program manager.
- **Admin**: System/Tenant configuration.

## 3. Key Entities (Database)
- **Identity**: `persons`, `households`, `identifiers`, `consent`
- **Geo**: `geo_nodes`, `community_centers`, `facilities`
- **Program**: `programs`, `verticals`, `cases`, `interventions`
- **Config**: `tenants`, `users`, `roles`, `policies`, `forms`
- **Integration**: `integrations`, `webhooks`
- **Ops**: `reports`, `broadcasts`, `audit_logs`

## 4. API Surface
- **Core**: `/persons`, `/households`, `/geo`, `/tenants`
- **Business**: `/cases`, `/programs`, `/verticals`, `/interventions`
- **Support**: `/reports`, `/forms`, `/auth`, `/admin`

## 5. Deployment Nodes
- **Kubernetes Cluster**
- **Ingress Controller**
- **Modular Monolith (.NET Core)**
- **PostgreSQL (Primary + Read)**
- **Redis (Cache)**
- **Keycloak (IDP)**
- **MinIO/S3 (Blob Storage)**
- **Mobile App (Offline Client)**
- **Web Portal (SPA)**
