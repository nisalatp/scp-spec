# SCP-SPEC-ARCH-04: Tenant Architecture

## Purpose

This document defines how SCP supports multi-tenancy, with a focus on country-level tenant isolation and governance.

## In Scope / Out of Scope

**In Scope**
- Country as tenant boundary
- Database-per-tenant model
- Tenant-specific configuration

**Out of Scope**
- Sub-tenant billing models
- Cross-country data analytics without approval

## Definitions

- Tenant: A country-level isolated SCP deployment.
- Tenant Isolation: Separation of data and configuration per tenant.
- Tenant Membership: Association of a user to a tenant.

## Rules (MUST/SHOULD/MAY)

- Each tenant MUST have its own database.
- Tenant data MUST NOT be mixed without explicit approval.
- Users MAY be associated with multiple tenants via memberships.
- Each non-ROOT session MUST be scoped to one tenant; cross-tenant access is prohibited.
- ROOT sessions MAY operate across tenants without a session-bound tenant_id.
- Tenants SHOULD be provisioned using standardized automation.
- Tenants MAY define local extensions within global rules.
- Tenant mergers and splits MUST follow tenant policy based on international best practices and require umbrella approval.
- Read-only global views MUST be supported under governance controls.

## Edge Cases

- User with memberships across tenants selects the wrong tenant.
- Shared integrations spanning tenants.

## Audit & Logs

- Tenant provisioning and access MUST be logged.
- Cross-tenant operations MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/01-tenant-management.md
- SPEC/04-security/02-authentication.md
