# SCP-SPEC-DATA-08: Seeding and Bootstrap

## Purpose

This document defines data seeding and bootstrap processes for new tenants.

## In Scope / Out of Scope

**In Scope**
- Initial data seeding
- Reference data population
- Bootstrap workflows

**Out of Scope**
- Production data migration

## Definitions

- Seeding: Initial population of required data.
- Bootstrap: Preparing a tenant for first use.

## Rules (MUST/SHOULD/MAY)

- System verticals MUST be seeded automatically.
- Tenant-defined geo hierarchy base nodes MUST be seeded.
- Reference data SHOULD be versioned.
- Bootstrap actions MUST be idempotent.
- CSV imports MAY be used during bootstrap.
- Tenants MAY customize seed data within governance limits.
- Failed bootstrap runs MUST support rollback.

## Edge Cases

- Failed bootstrap mid-process.
- Re-running bootstrap on existing tenant.

## Audit & Logs

- Seeding actions MUST be logged.
- Bootstrap completion MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/01-tenant-management.md
- SPEC/07-verticals/01-system-verticals.md
