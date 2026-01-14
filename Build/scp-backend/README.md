# SCP Backend Implementation

This is the standalone backend implementation for the Smart Community Platform (SCP).

## Relationship to SPEC & Docs
This project implements the business logic and data persistence as defined in the following authoritative sources:
- [System Specification (SPEC)](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/README.md) - Source of Truth.
- [Domain Model](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/03-domain/README.md) - Entity structures.
- [Security Principles](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/04-security/README.md) - AuthZ and Consent.
- [API Standards](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/11-apis/README.md).

## Policy Implementation Requirements
- **Deny-by-Default**: Every endpoint MUST default to denial unless a valid policy is matched.
- **Scope Enforcement**: Every query MUST be scoped by `TenantID` and `GeoNodeID`.
- **Consent Check**: Core PII endpoints MUST verify active consent via the `ConsentService` before returning data.
- **Audit Requirement**: Every write operation MUST emit an event to the `AuditLogService`.

## Local Development Runbook
1.  **Environment**: Copy `configs/.env.example` to `.env`.
2.  **Infrastructure**: `docker-compose up -d` (PostgreSQL, Redis, Keycloak).
3.  **Migrations**: `npm run migrate`.
4.  **Seed Data**: `npm run seed:dev`.
5.  **Start**: `npm run start:dev`.

## Implementation Docs
- [Implementation Guide](docs/IMPLEMENTATION-GUIDE.md)
- [API Standards](docs/API-STANDARDS.md)
- [Auth & Scoping](docs/AUTH-AND-SCOPING.md)
- [Consent Model](docs/CONSENT-MODEL.md)
- [Audit Logging](docs/AUDIT-LOGGING.md)
- [Data Model](docs/DATA-MODEL.md)
