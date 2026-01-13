# SCP-SPEC-VERT-06: Vertical Analytics

## Purpose

This document defines analytics and reporting within a vertical, independent of other verticals.

## In Scope / Out of Scope

**In Scope**
- Vertical KPIs
- Program-level analytics

**Out of Scope**
- Cross-tenant analytics
- Predictive modeling

## Definitions

- Vertical KPI: Metric defined and owned by a vertical.
- Analytics View: Aggregated data representation.

## Rules (MUST/SHOULD/MAY)

- Vertical analytics MUST be isolated by default.
- KPIs MUST be defined and versioned per vertical.
- Analytics MUST respect consent and masking rules.
- Consent-withdrawn records MUST be excluded from analytics, including aggregates.
- Umbrella authority MAY perform cross-vertical aggregation using consented data only.
- Near-real-time analytics MUST be supported.

## Edge Cases

- Sparse data leading to re-identification risk.
- KPI definition changes over time.

## Audit & Logs

- Analytics generation MUST be logged.
- KPI changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/05-governance/07-kpi-reconciliation.md
- SPEC/03-domain/10-analytics-reporting-model.md
