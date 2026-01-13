# SCP-SPEC-OPS-07: Reporting and Exports

## Purpose

This document defines operational reporting and data export capabilities.

## In Scope / Out of Scope

**In Scope**
- Operational reports
- Data exports (CSV, Excel)
- Access-controlled reporting

**Out of Scope**
- BI dashboards
- External analytics pipelines

## Definitions

- Report: Structured operational output.
- Export: Downloadable dataset.

## Rules (MUST/SHOULD/MAY)

- Reports MUST respect authorization and consent.
- Exports MUST support CSV and Excel formats.
- Reports and exports MUST exclude consent-withdrawn records, including from aggregates.
- Reports and exports for multi-vertical programs MUST pass the intersection of participating verticals for non-ROOT users.
- ROOT access MAY return full datasets regardless of consent state, with optional reason codes logged.
- Sensitive fields MUST be masked or excluded.
- Reports and exports MUST include case suspension status when cases are visible to the requester.
- Export actions SHOULD be logged.
- Scheduled exports MAY be supported.
- Export watermarking MUST be supported.

## Edge Cases

- Large dataset exports.
- Export interrupted mid-process.

## Audit & Logs

- Report generation MUST be logged.
- Export downloads MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/10-analytics-reporting-model.md
- SPEC/11-apis/11-reporting-api.md
