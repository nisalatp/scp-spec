# SCP-SPEC-VERT-04: Vertical Scoring Models

## Purpose

This document defines scoring models used within verticals to assess need, priority, or progress.

## In Scope / Out of Scope

**In Scope**
- Vertical-specific scoring definitions
- Governance of scoring models

**Out of Scope**
- Machine learning implementations

## Definitions

- Scoring Model: A rule-based or statistical assessment framework.
- Score: Output value used for prioritization.

## Rules (MUST/SHOULD/MAY)

- Scoring models MUST be vertical-specific.
- Scoring logic MUST be documented.
- Scores MUST NOT be shared across verticals without approval.
- Models SHOULD be versioned.
- Scores MAY influence prioritization but not replace human decision.
- Explainability requirements are not mandatory.

## Edge Cases

- Conflicting scores across verticals.
- Scoring models producing biased outcomes.

## Audit & Logs

- Scoring model changes MUST be logged.
- Score calculations SHOULD be traceable.

## Open Questions

- None.

## References

- SPEC/03-domain/10-analytics-reporting-model.md
- SPEC/05-governance/07-kpi-reconciliation.md
