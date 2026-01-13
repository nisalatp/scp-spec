# SCP-SPEC-APP-05: Architecture Decision Record Template

## Purpose

This document defines the standard template for Architecture Decision Records (ADRs) in SCP.

## In Scope / Out of Scope

**In Scope**
- ADR structure
- Required sections

**Out of Scope**
- Decision content

## Definitions

- ADR: Architecture Decision Record.
- Decision: Chosen architectural option.

## Rules (MUST/SHOULD/MAY)

- All significant architectural decisions MUST have an ADR.
- ADRs MUST include context, decision, and consequences.
- ADRs SHOULD be immutable after acceptance.
- Superseded ADRs MAY be marked accordingly.
- ADRs MUST support tenant-specific variants where required.
- ADR tooling MUST be provided.

## Edge Cases

- Emergency decisions without prior ADR.
- Partial reversals of decisions.

## Audit & Logs

- ADR creation and updates SHOULD be logged.
- ADR approval SHOULD be traceable.

## Open Questions

- None.

## References

- SPEC/02-architecture/09-architecture-decisions-adr.md
