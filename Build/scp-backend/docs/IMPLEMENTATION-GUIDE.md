# Backend Implementation Guide

This guide provides technical instructions for implementing SCP Backend modules.

## Tech Stack (Recommended)
- **Framework**: .NET Core or Node.js (per [Modular Monolith Architecture](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/02-architecture/03-modular-monolith-architecture.md))
- **Database**: PostgreSQL (PostGIS enabled)
- **Cache**: Redis
- **Auth**: Keycloak / OpenID Connect

## Architectural Rules
1.  **Modular Monolith**: Every module MUST be self-contained in `/src/modules/`.
2.  **Inter-Module Communication**: Use the internal `EventBus` for cross-module side effects. Avoid direct database joins between module schemas.
3.  **Policy Engine**: Centralize all permission checks in the `/src/policies/` layer.
4.  **Domain Driven Design**: Use Entities and Value Objects defined in [SPEC/03-domain](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/03-domain/README.md).

## Security Guardrails
- Data at rest MUST be encrypted for PII fields.
- Use TLS 1.3 for all inter-service communication.
- Sanitize all inputs against SQLi and XSS.
