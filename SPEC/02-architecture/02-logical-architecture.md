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
