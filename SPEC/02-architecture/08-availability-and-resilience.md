# SCP-SPEC-ARCH-08: Availability and Resilience

## Purpose

This document defines how SCP achieves availability and resilience against failures.

## In Scope / Out of Scope

**In Scope**
- High availability via Kubernetes
- Failure detection and recovery

**Out of Scope**
- Disaster recovery drills
- External dependency SLAs

## Definitions

- Availability: Percentage of time the system is operational.
- Resilience: Ability to recover from failures.

## Rules (MUST/SHOULD/MAY)

- SCP MUST tolerate node failures.
- No single failure SHOULD impact all tenants.
- Graceful degradation SHOULD be supported.
- Manual intervention MAY be required for rare cases.
- Active-active deployments MUST be supported.
- Target availability per tenant MUST be 99.9%.

## Edge Cases

- Region-wide outages.
- Partial tenant outages.

## Audit & Logs

- Availability incidents MUST be logged.
- Recovery actions SHOULD be auditable.

## Open Questions

- None.

## References

- SPEC/12-deployment/01-kubernetes-topology.md
- SPEC/15-runbooks/01-incident-response.md
