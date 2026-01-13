# SCP-SPEC-RUN-01: Incident Response

## Purpose

This runbook defines the standard process for detecting, responding to, and resolving incidents affecting SCP availability, security, or data integrity.

## In Scope / Out of Scope

**In Scope**
- Security incidents
- Availability outages
- Data integrity issues

**Out of Scope**
- End-user training issues
- Feature enhancement requests

## Definitions

- Incident: Unplanned disruption or security event.
- Severity: Classification of incident impact.

## Rules (MUST/SHOULD/MAY)

- All incidents MUST be logged and assigned a severity.
- Security incidents MUST be escalated immediately.
- ROOT access MUST NOT be used unless required.
- Incident response SHOULD follow defined escalation paths.
- SLA response times MUST be defined by severity and configured per tenant.
- Default response times MUST be set by severity as: Sev1 6h, Sev2 1 day, Sev3 3 days, Sev4 1 week, Sev5 1 month, Sev6 1 quarter, Sev7 1 year.
- Incident closure approval MUST be configurable at country level.
- Post-incident reviews MAY be conducted.

## Edge Cases

- Simultaneous multi-tenant incidents.
- Incident occurring during maintenance windows.

## Audit & Logs

- Incident timelines MUST be recorded.
- Actions taken during response MUST be auditable.

## Open Questions

- None.

## References

- SPEC/12-deployment/05-observability.md
- SPEC/04-security/13-threat-model.md
