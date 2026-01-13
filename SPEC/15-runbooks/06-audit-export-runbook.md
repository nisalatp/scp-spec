# SCP-SPEC-RUN-06: Audit Export Runbook

## Purpose

This runbook defines procedures for exporting audit logs for review or compliance.

## In Scope / Out of Scope

**In Scope**
- Audit log extraction
- Compliance reporting

**Out of Scope**
- Real-time monitoring dashboards

## Definitions

- Audit Log: Immutable record of system actions.
- Export: Extraction of logs for external use.

## Rules (MUST/SHOULD/MAY)

- Audit exports MUST be read-only.
- Exports MUST be approved by authorized roles.
- Exported data MUST respect tenant boundaries.
- Sensitive fields MUST be masked where required.
- Export formats SHOULD include CSV.
- Automated audit exports MUST be supported.
- Exported files MUST be retained for at least 3 months and may be manually removed thereafter by authorized roles.

## Edge Cases

- Large audit datasets.
- Requests spanning long time ranges.

## Audit & Logs

- Export requests MUST be logged.
- Download events MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/12-audit-logging.md
- SPEC/11-apis/11-reporting-api.md
