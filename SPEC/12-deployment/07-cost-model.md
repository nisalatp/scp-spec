# SCP-SPEC-DEP-07: Cost Model

## Purpose

This document defines cost considerations and allocation principles for SCP deployments.

## In Scope / Out of Scope

**In Scope**
- Infrastructure cost drivers
- Cost attribution

**Out of Scope**
- Billing and invoicing systems

## Definitions

- Cost Driver: Resource contributing to cost.
- Attribution: Assigning costs to tenants or services.

## Rules (MUST/SHOULD/MAY)

- Costs SHOULD be attributable per tenant.
- Database and storage costs MUST be tenant-isolated.
- Monitoring SHOULD track major cost drivers.
- Cost optimization MAY be performed centrally.
- Chargeback MUST be supported.
- Cost caps MUST be enforceable per tenant, per vertical, and per program type.

## Edge Cases

- Shared infrastructure costs.
- Unexpected cost spikes.

## Audit & Logs

- Cost model changes SHOULD be documented.
- Allocation rules MUST be auditable.

## Open Questions

- None.

## References

- SPEC/02-architecture/08-availability-and-resilience.md
- SPEC/10-data/07-backup-restore-dr.md
