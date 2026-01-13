# SCP-SPEC-RUN-03: Tenant Provisioning Runbook

## Purpose

This runbook defines steps for provisioning a new tenant (country) in SCP.

## In Scope / Out of Scope

**In Scope**
- Tenant database creation
- Base configuration and seeding
- Initial admin setup

**Out of Scope**
- Data migration from legacy systems

## Definitions

- Tenant: Country-level SCP instance.
- Provisioning: Process of creating a tenant.

## Rules (MUST/SHOULD/MAY)

- Tenant provisioning MUST be performed by authorized admins.
- A separate database MUST be created per tenant.
- Base geo hierarchy MUST be seeded.
- System verticals MUST be initialized.
- Tenant provisioning SHOULD be idempotent.
- Automated provisioning MUST be supported.
- Rollback steps MUST NOT be defined by default.

## Edge Cases

- Partial provisioning failure.
- Re-provisioning an existing tenant.

## Audit & Logs

- Provisioning actions MUST be logged.
- Configuration values MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/01-tenant-management.md
- SPEC/10-data/08-seeding-and-bootstrap.md
