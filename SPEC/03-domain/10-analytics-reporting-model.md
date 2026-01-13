# SCP-SPEC-DOM-10: Analytics and Reporting Model

## Purpose

This document defines analytics and reporting concepts in SCP.

## In Scope / Out of Scope

**In Scope**
- Aggregated reporting
- KPI computation
- Cross-vertical reconciliation

**Out of Scope**
- Real-time BI dashboards
- Predictive analytics

## Definitions

- Report: A structured aggregation of data.
- Metric: A measured value.

## Rules (MUST/SHOULD/MAY)

- Reports MUST respect tenant and vertical boundaries.
- Sensitive data MUST be masked or aggregated.
- Consent-withdrawn records MUST be excluded from reports, including aggregates.
- Reports SHOULD be reproducible.
- Ad-hoc reports MAY be allowed with permissions.
- Umbrella-level reports MAY include cross-vertical aggregates using consented data only.
- ROOT-level reporting MAY bypass consent restrictions with audit logging and optional reason codes.
- Reports SHOULD include case suspension status when applicable.
- Custom metrics MUST be validated against internationally accepted standards and tenant governance.
- Scheduled reports MUST be supported.
- Reporting MUST support baseline vs outcome comparisons using measurement-tagged form submissions.
- Longitudinal reports SHOULD allow before-and-after comparisons by program, case, or household.

## Edge Cases

- Sparse data in small communities.
- Conflicting KPI definitions.

## Audit & Logs

- Report generation MUST be logged.
- Export actions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/11-apis/11-reporting-api.md
- SPEC/05-governance/07-kpi-reconciliation.md
