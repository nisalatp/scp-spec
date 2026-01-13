# SCP-SPEC-GOV-02: Umbrella Authority Model

## Purpose

This document defines the umbrella authority model, which provides top-level oversight and conflict resolution within SCP.

## In Scope / Out of Scope

**In Scope**
- Umbrella authority powers and responsibilities
- Override and escalation mechanisms

**Out of Scope**
- Day-to-day operational management

## Definitions

- Umbrella Authority: The highest governing entity within SCP.
- Override: An explicit decision that supersedes lower-level governance.

## Rules (MUST/SHOULD/MAY)

- Umbrella authority MUST approve:
  - Program activation
  - Vertical creation or restriction
  - Cross-tenant data access
- Overrides MUST be explicit and justified.
- Umbrella decisions SHOULD be rare and exceptional.
- Delegation MAY occur but responsibility remains with umbrella authority.
- Umbrella authority members MUST be configured by system admins within the platform.
- Umbrella authority decisions MUST NOT be appealable.

## Edge Cases

- Umbrella authority conflict of interest.
- Multiple umbrella bodies in federated deployments.

## Audit & Logs

- All umbrella decisions MUST be logged with justification.
- Overrides MUST be traceable to decision makers.

## Open Questions

- None.

## References

- SPEC/03-domain/04-program-model.md
- SPEC/05-governance/06-conflict-management.md
