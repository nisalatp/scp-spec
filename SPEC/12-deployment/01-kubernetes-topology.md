# SCP-SPEC-DEP-01: Kubernetes Topology

## Purpose

This document defines the Kubernetes topology for deploying the SCP modular monolith and supporting services.

## In Scope / Out of Scope

**In Scope**
- Cluster topology
- Namespace and workload separation
- Core supporting services

**Out of Scope**
- Cloud provider specific constructs
- Bare metal deployments

## Definitions

- Cluster: Kubernetes control plane and worker nodes.
- Namespace: Logical isolation unit within a cluster.

## Rules (MUST/SHOULD/MAY)

- SCP MUST be deployed on Kubernetes.
- The .NET modular monolith MUST run as a stateless Deployment.
- Supporting services (Keycloak, ingress) SHOULD run in dedicated namespaces.
- Tenants MUST NOT share databases.
- Network policies SHOULD restrict inter-namespace traffic.
- Multiple clusters MAY be used for data residency.
- A service mesh MUST be used for inter-service traffic management.
- Separate clusters per country MUST NOT be required by default.

## Edge Cases

- Cluster upgrades impacting availability.
- Namespace misconfiguration causing cross-tenant access.

## Audit & Logs

- Deployment changes MUST be logged.
- Cluster access MUST be audited.

## Open Questions

- None.

## References

- SPEC/02-architecture/03-modular-monolith-architecture.md
- SPEC/04-security/11-api-security.md
