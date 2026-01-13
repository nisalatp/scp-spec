# SCP-SPEC-DATA-01: Data Architecture

## Purpose

This document defines the overall data architecture of SCP, including storage boundaries, governance constraints, and data lifecycle principles.

## In Scope / Out of Scope

**In Scope**
- Tenant-isolated data architecture
- Core data domains and flows
- Governance and compliance constraints

**Out of Scope**
- Application code data access patterns
- BI or external analytics platforms

## Definitions

- Data Architecture: Structural design of data storage and movement.
- Tenant Database: Country-scoped database instance.

## Rules (MUST/SHOULD/MAY)

- Each tenant MUST have its own database.
- Data MUST NOT cross tenant boundaries by default.
- Data architecture MUST support metadata-driven schemas.
- Sensitive data MUST be protected by consent and masking.
- Data residency MUST be enforced per tenant.
- Read replicas MAY be allowed across regions if data residency requirements are met.
- Schema drift detection MUST use both automated validation and manual review.

## Edge Cases

- Cross-tenant read-only aggregation approved by umbrella authority.
- Temporary data duplication during migration.

## Audit & Logs

- Data access patterns SHOULD be logged.
- Cross-tenant operations MUST be auditable.

## Open Questions

- None.

## References

- SPEC/02-architecture/04-tenant-architecture.md
- SPEC/04-security/14-privacy-compliance.md
