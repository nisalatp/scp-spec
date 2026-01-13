# SCP-SPEC-VERT-02: Custom Verticals

## Purpose

This document defines how tenants may introduce custom verticals to represent additional interest domains while preserving governance and isolation.

## In Scope / Out of Scope

**In Scope**
- Creation and lifecycle of custom verticals
- Governance and approval requirements

**Out of Scope**
- Hardcoded custom logic per vertical

## Definitions

- Custom Vertical: A tenant-defined vertical approved by umbrella authority.
- Vertical Owner: Entity responsible for a vertical.

## Rules (MUST/SHOULD/MAY)

- Custom verticals MUST be approved by umbrella authority.
- System vertical policies MUST take precedence over custom vertical policies.
- Custom verticals MUST be defined using a Vertical Definition Pack that includes:
  - unique vertical_id and display name
  - owner role and purpose or description
  - consent text (versioned, active_from, active_until, evidence_required)
  - policy pack reference and default governance inheritance
  - required data profile for person, household, and family fields with classification
  - KPI definitions and reporting or export constraints
  - retention policy reference and default program types
  - aliases (optional) that are unique per tenant
- Custom verticals SHOULD inherit default governance policies.
- Custom verticals MUST follow the standard lifecycle.
- Custom verticals MAY be restricted, suspended, deprecated, or archived.
- There MUST be no fixed platform limit on the number of custom verticals.
- The Vertical Definition Pack MUST be versioned; updates MUST follow policy change control.
- New custom verticals MUST start in Draft and move to Active only after umbrella approval; ROOT MAY create or activate directly.
- Required data profiles MUST be implemented via metadata-driven forms and consent-scoped access.

## Edge Cases

- Overlapping scope with system verticals.
- Custom vertical no longer legally permitted.
- Missing or incomplete Vertical Definition Pack.
- Alias conflicts within the same tenant.

## Audit & Logs

- Custom vertical creation and changes MUST be logged.
- Approval decisions MUST be auditable.
- Vertical Definition Pack updates MUST be logged.

## Open Questions

- None.

## References

- SPEC/05-governance/02-umbrella-authority-model.md
- SPEC/07-verticals/01-system-verticals.md
- SPEC/04-security/09-consent-and-data-sharing.md
- SPEC/05-governance/04-policy-change-control.md
- SPEC/06-platform-core/06-form-builder.md
- SPEC/11-apis/06-verticals-api.md
