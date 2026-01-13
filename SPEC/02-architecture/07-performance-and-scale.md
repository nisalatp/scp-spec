# SCP-SPEC-ARCH-07: Performance and Scale

## Purpose

This document outlines performance and scalability considerations for SCP to support growth across tenants and users.

## In Scope / Out of Scope

**In Scope**
- API performance
- Horizontal scaling in Kubernetes

**Out of Scope**
- Client-side performance optimization
- Hardware procurement details

## Definitions

- Scalability: Ability to handle increased load.
- Latency: Time taken to respond to requests.

## Rules (MUST/SHOULD/MAY)

- SCP MUST scale horizontally.
- Authorization checks MUST be performant.
- Caching SHOULD be used where safe.
- Performance MAY vary by tenant size.
- Latency targets MUST be defined per API and may vary by endpoint criticality.
- Per-tenant throttling MUST be enforced at the API gateway.

## Edge Cases

- Sudden spikes during emergencies.
- Long-running batch operations.

## Audit & Logs

- Performance metrics SHOULD be logged.
- SLA breaches MUST be recorded.

## Open Questions

- None.

## References

- SPEC/12-deployment/06-scaling-strategy.md
- SPEC/04-security/05-authz-engine-evaluation.md
