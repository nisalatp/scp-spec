# SCP-SPEC-ARCH-02: Logical Architecture

## Purpose

This document defines the logical architecture of SCP, describing major logical components and their responsibilities without binding to physical deployment details.

## In Scope / Out of Scope

**In Scope**
- Core platform layers and responsibilities
- Separation of concerns between modules

**Out of Scope**
- Physical infrastructure
- Programming language specifics

## Shared Services Capabilities (Lapse Resolution)

The specific capabilities below are mandated to resolve critical usage gaps:
1.  **GIS-Service** (L-01): Provides spatial operations (Buffer, Intersect) and Hazard Layer management.
2.  **Routing-Service** (L-05): Provides travel time matrix calculation for Access Analysis.
3.  **Simulation-Service** (L-04): Provides "Digital Twin" policy impact simulation.
4.  **Data Warehouse** (L-03): Central OLAP store for Cross-Vertical analytics.


## Definitions

- Logical Component: A conceptual grouping of responsibilities.
- Layer: A horizontal separation of concerns.

## Rules (MUST/SHOULD/MAY)

- SCP MUST separate domain logic, security, and integration concerns.
- Authorization and consent MUST be enforced centrally.
- Modules SHOULD communicate via defined interfaces.
- New components MAY be added without breaking existing contracts.
- The architecture MUST allow adding cross-cutting layers in future without redesign.
- Experimental components MUST be isolated using feature flags.

## Edge Cases

- Cross-cutting concerns spanning multiple logical components.
- Temporary coupling during migration phases.

## Audit & Logs

- Inter-component calls SHOULD be traceable.
- Logical boundaries MUST be reflected in audit records.

## Open Questions

- None.

## References

- SPEC/04-security/04-authorization-overview.md
- SPEC/06-platform-core/01-tenant-management.md
