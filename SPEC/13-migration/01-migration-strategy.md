# SCP-SPEC-MIG-01: Migration Strategy

## Purpose

This document defines the overall migration strategy for moving from the existing Laravel-based SCP implementation to the new .NET modular monolith architecture.

## In Scope / Out of Scope

**In Scope**
- Data and configuration migration
- Authentication and authorization transition
- Phased cutover strategy

**Out of Scope**
- UI migration or UI compatibility layers
- Feature parity guarantees beyond defined scope

## Definitions

- Source System: Existing Laravel-based SCP.
- Target System: New .NET-based SCP.
- Migration Phase: Controlled stage of transition.

## Rules (MUST/SHOULD/MAY)

- Migration MUST prioritize data integrity and auditability.
- Migration MUST NOT require UI bridging between systems.
- Migration SHOULD be performed tenant by tenant.
- Migration MAY be phased by domain (auth, data, operations).
- Source system MUST remain read-only during final cutover.
- A dry-run migration MUST be performed for each tenant.
- Dual-run MAY be permitted indefinitely until governance confirms full cutover.

## Edge Cases

- Partial migration failures.
- Data discovered missing or inconsistent during migration.

## Audit & Logs

- All migration steps MUST be logged.
- Data reconciliation results MUST be auditable.

## Open Questions

- None.

## References

- SPEC/02-architecture/03-modular-monolith-architecture.md
- SPEC/12-deployment/02-environments.md
