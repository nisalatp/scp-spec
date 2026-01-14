# System Auditor

## Purpose
The System Auditor role provides read-only access to platform audit logs and reports for compliance and security verification. This role is strictly separated from operational data access.

## Responsibilities
- Review system and security logs.
- Verify compliance with governance rules.
- Investigate security incidents.

## Associated Verticals
- **Standard Verticals**: Oversight over all.
- **Geo-Verticals**: Oversight over all.

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Tenant-wide.
- **Vertical scope**: Cross-vertical visibility (for logs).
- **Program scope**: N/A.

## Permissions Summary
- **Allowed**: `audit.view`, `report.view`, `config.view`.
- **Denied**: **ALL** write/update/delete actions. `case.view` (beneficiary data), `person.view`.
- **Conditional**: Can see *metadata* about cases (via audit logs) but not the *content* of cases unless the log entry contains it (which strict logging rules usually prevent for PII).

## Data Access Boundaries
- **PII access**: **None**.
- **Audit log visibility**: **Full**, including Admin actions and Data Access metadata.

## Consent Requirements
- Auditors verify that consent rules are being followed; they do not require consent to view the *logs* of consent verification.

## Audit Expectations
- Auditor's own actions (viewing logs) are also audited ("Watch the watchers").

## Typical Workflows / Use Cases
- **Annual Audit**: Reviewing role changes over the past year.
- **Incident Response**: Correlating logs to find who accessed a VIP profile.

## Edge Cases
- Auditor attempting to export logs (requires `audit.export` permissions, distinct from `view`).

## References
- `SPEC/04-security/12-audit-logging.md`
