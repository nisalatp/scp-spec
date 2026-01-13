# SCP-SPEC-ARCH-06: Eventing and Audit Architecture

## Purpose

This document defines how SCP handles events and audit logging to ensure traceability, compliance, and observability.

## In Scope / Out of Scope

**In Scope**
- Domain events
- Audit event generation and storage

**Out of Scope**
- External analytics tooling
- Real-time monitoring dashboards

## Definitions

- Event: A significant state change within SCP.
- Audit Log: An immutable record of actions and decisions.

## Rules (MUST/SHOULD/MAY)

- All critical actions MUST generate audit events.
- Audit logs MUST be append-only.
- Events SHOULD include tenant and vertical context.
- Non-critical events MAY be sampled.
- External event exposure MUST be configurable per tenant.
- Audit logs MUST be queryable at scale via both a dedicated audit query service and external analytics tooling.

## Edge Cases

- Event storms during batch operations.
- Failed event persistence.

## Audit & Logs

- Audit logs MUST be tamper-evident.
- Retention policies MUST be enforced per tenant.

## Open Questions

- None.

## References

- SPEC/04-security/12-audit-logging.md
- SPEC/10-data/06-retention-archival.md
