# SCP-SPEC-VERT-07: Cross-Vertical Interventions

## Purpose

This document defines how interventions spanning multiple verticals are governed and executed.

## In Scope / Out of Scope

**In Scope**
- Multi-vertical case participation
- Governance and consent enforcement

**Out of Scope**
- Automatic cross-vertical data sharing

## Definitions

- Cross-Vertical Intervention: A case involving more than one vertical.
- Primary Vertical: Vertical owning the case.

## Rules (MUST/SHOULD/MAY)

- Each intervention MUST have exactly one primary vertical.
- Participating verticals MUST explicitly opt in.
- Consent MUST be valid for each participating vertical.
- Authorization MUST use strictest intersection rules.
- Donor priorities MUST NOT override governance.
- Secondary verticals MAY initiate actions, subject to intersection rules.
- Cross-vertical KPIs MUST be reconciled using weight-factored aggregation rules.

## Edge Cases

- Donor funding one vertical but not another.
- Consent withdrawn for one vertical only.

## Audit & Logs

- Cross-vertical participation MUST be logged.
- Access decisions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/05-case-intervention-model.md
- SPEC/04-security/05-authz-engine-evaluation.md
