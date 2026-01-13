# SCP-SPEC-GOV-03: Vertical Governance

## Purpose

This document defines governance rules specific to verticals, which act as interest and accountability boundaries within SCP.

## In Scope / Out of Scope

**In Scope**
- Vertical lifecycle
- Vertical ownership and responsibilities
- Cross-vertical coordination

**Out of Scope**
- Vertical-specific business logic

## Definitions

- Vertical: An interest-based governance boundary.
- Vertical Owner: Entity responsible for vertical governance.

## Rules (MUST/SHOULD/MAY)

- System verticals MUST always be enabled.
- Custom verticals MUST be approved by umbrella authority.
- Vertical lifecycle MUST include:
  Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
- Cross-vertical actions MUST follow strictest governance rules.
- Vertical owners SHOULD define consent texts and KPIs.
- Deprecated verticals MUST be archived and retained following internationally accepted standards.
- Vertical ownership MAY change through governance approval.

## Edge Cases

- Vertical overlap in programs.
- Programs with multiple verticals require clear primary ownership.
- Vertical suspension during active cases.

## Audit & Logs

- Vertical state changes MUST be logged.
- Cross-vertical access MUST be auditable.

## Open Questions

- None.

## References

- SPEC/01-vision/04-verticals-concept.md
- SPEC/03-domain/05-case-intervention-model.md
