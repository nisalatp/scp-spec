# SCP-SPEC-DOM-01: Domain Overview

## Purpose

This document provides an overview of the SCP domain model, describing the core concepts, boundaries, and relationships that underpin all platform functionality.

## In Scope / Out of Scope

**In Scope**
- Core domain concepts used across SCP
- High-level relationships between people, households, programs, and cases
- Governance-driven domain boundaries

**Out of Scope**
- Physical data schemas
- API-level representations
- UI-specific domain views

## Definitions

- Domain Model: A conceptual representation of real-world entities and their relationships.
- Core Domain: The minimal set of concepts required for SCP to function.

## Rules (MUST/SHOULD/MAY)

- The domain model MUST be governance-first and neutral.
- Domain concepts MUST support tenant and vertical isolation.
- Domain entities SHOULD be extensible without breaking invariants.
- Domain logic MAY evolve through approved ADRs.
- The domain model MUST allow expansion for jurisdiction-specific concepts when required by governance.
- Deprecated domain concepts MUST be archived and retained as read-only history.

## Edge Cases

- Domain concepts that differ significantly across countries.
- Overlapping domain responsibilities across verticals.

## Audit & Logs

- Domain changes MUST be versioned and auditable.
- Mapping changes SHOULD include rationale.

## Open Questions

- None.

## References

- SPEC/02-architecture/02-logical-architecture.md
- SPEC/05-governance/01-governance-overview.md
