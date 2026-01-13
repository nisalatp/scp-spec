# SCP-SPEC-DEP-05: Observability

## Purpose

This document defines observability requirements for SCP deployments.

## In Scope / Out of Scope

**In Scope**
- Logging
- Metrics
- Tracing

**Out of Scope**
- Business analytics dashboards

## Definitions

- Observability: Ability to understand system state.
- Tracing: Request-level visibility.

## Rules (MUST/SHOULD/MAY)

- Application logs MUST include correlation IDs.
- Audit logs MUST be immutable.
- Metrics SHOULD cover availability and performance.
- Traces MAY be sampled.
- Distributed tracing MUST be enabled in Phase 1.
- Tenant-specific metrics MUST be exposed.

## Edge Cases

- High log volume during incidents.
- Missing traces across boundaries.

## Audit & Logs

- Observability data access MUST be logged.
- Retention policies MUST be enforced.

## Open Questions

- None.

## References

- SPEC/04-security/12-audit-logging.md
- SPEC/02-architecture/06-eventing-and-audit-architecture.md
