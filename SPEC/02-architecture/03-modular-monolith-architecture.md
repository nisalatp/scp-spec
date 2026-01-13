# SCP-SPEC-ARCH-03: Modular Monolith Architecture

## Purpose

This document describes the modular monolith architectural approach used by SCP, combining strong internal modularity with a single deployable unit.

## In Scope / Out of Scope

**In Scope**
- Modular design within a .NET application
- Clear module boundaries and contracts

**Out of Scope**
- Full microservice decomposition
- UI layer concerns

## Definitions

- Modular Monolith: A single deployment composed of well-isolated internal modules.
- Module: A cohesive unit with clear responsibilities.

## Rules (MUST/SHOULD/MAY)

- Modules MUST not directly access each other's internal data.
- Cross-module interaction MUST occur via interfaces.
- The platform SHOULD be deployable as a single unit.
- Modules MAY be extracted into services in the future.
- All modules SHOULD be designed as extraction candidates; no module is exempt from potential service extraction.
- Shared libraries MUST be governed through formal policy and approval controls.

## Edge Cases

- Accidental tight coupling between modules.
- Shared utilities becoming implicit dependencies.

## Audit & Logs

- Module boundaries SHOULD be visible in logs.
- Cross-module calls SHOULD include correlation identifiers.

## Open Questions

- None.

## References

- SPEC/02-architecture/02-logical-architecture.md
- SPEC/12-deployment/01-kubernetes-topology.md
