# SCP-SPEC-GOV-07: KPI Reconciliation

## Purpose

This document defines how KPIs from different verticals and programs are reconciled at tenant and umbrella levels.

## In Scope / Out of Scope

**In Scope**
- Vertical KPI aggregation
- Umbrella-level reconciliation

**Out of Scope**
- External benchmarking
- Predictive analytics

## Definitions

- KPI: Key performance indicator.
- Reconciliation: Process of resolving KPI differences.

## Rules (MUST/SHOULD/MAY)

- Vertical KPIs MUST be defined and versioned.
- KPI aggregation MAY be performed at umbrella level across verticals using consented data only.
- Reconciliation MUST be transparent and auditable.
- Umbrella authority MAY define canonical metrics.
- Qualitative KPIs MUST be supported and quantified using Likert scales.
- KPI reconciliation MUST be performed manually by KPI owners on a schedule they control.

## Edge Cases

- Conflicting KPI definitions.
- Incomplete or sparse data.

## Audit & Logs

- KPI calculations MUST be logged.
- Reconciliation decisions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/01-vision/05-success-metrics.md
- SPEC/03-domain/10-analytics-reporting-model.md
