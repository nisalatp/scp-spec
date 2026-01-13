# SCP-SPEC-CORE-01: Tenant Management

## Purpose

This document defines how tenants are created, isolated, configured, and governed within SCP. A tenant represents a sovereign country boundary.

## In Scope / Out of Scope

**In Scope**
- Tenant lifecycle
- Country-level isolation
- Tenant configuration

**Out of Scope**
- Sub-tenant billing
- Cross-country analytics without approval

## Definitions

- Tenant: A country-level SCP instance.
- Tenant Boundary: Hard isolation of data and configuration.
- Tenant Membership: Explicit assignment of a user to a tenant.

## Rules (MUST/SHOULD/MAY)

- Each tenant MUST represent exactly one country.
- Each tenant MUST have its own database.
- Tenant data MUST NOT be shared by default.
- Tenant memberships MUST be explicitly granted and revoked.
- Access MUST require a valid membership in the selected tenant.
- ROOT access MAY operate across tenants without a session-bound tenant_id, with explicit audit context.
- Tenant creation MUST be approved by ROOT or umbrella authority.
- Tenant configuration SHOULD be versioned.
- Tenant admin configuration changes MUST be approved by umbrella authority.
- ROOT MAY change tenant configuration without approval.
- Tenants MAY define local extensions within global limits.
- Tenants MAY be merged or split under governance approval.
- Tenant archival MUST be reversible under governance approval.

## Edge Cases

- Users with memberships across multiple tenants.
- Tenant suspension due to compliance issues.

## Audit & Logs

- Tenant creation and state changes MUST be logged.
- Cross-tenant access MUST be auditable.

## Open Questions

- None.

## References

- SPEC/02-architecture/04-tenant-architecture.md
- SPEC/04-security/02-authentication.md
