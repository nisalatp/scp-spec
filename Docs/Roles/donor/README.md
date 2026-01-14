# Donor

## Purpose
The Donor role enables external funding entities to monitor the progress and impact of the programs they fund. This usage is strictly read-only and aggregated. Donors should never see individual PII unless they are also operating as a Partner (which would require a different role).

## Responsibilities
- Review Program aggregated reports.
- Monitor financial utilization (if exposed).
- View impact metrics.

## Associated Verticals
- **Standard Verticals**: Assigned to one or more (e.g., "Health Donor").
- **Geo-Verticals**: Can be scoped.

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Can be Global or Region-specific.
- **Vertical scope**: Specific Vertical.
- **Program scope**: Specific Program.

## Permissions Summary
- **Allowed**: `report.view`, `program.view`, `chart.view`.
- **Denied**: `case.view` (PII), `person.*`, `export.pii`.
- **Conditional**: Can only see reports linked to their funded programs.

## Data Access Boundaries
- **PII access**: **STRICTLY DENIED**.
- **Sensitive health data**: Denied.
- **Welfare eligibility data**: Aggregated only ("500 families eligible").
- **Audit log visibility**: None.

## Consent Requirements
- **Aggregated Data**: Consent is not required for viewing anonymized aggregates (e.g., "Number of vaccines delivered").
- **Exceptions**: If a donor requires unit-level data for audit, this must be handled offline or via "System Auditor" role with masking.

## Audit Expectations
- Donor logins and report views are logged to ensure no data misuse.

## Typical Workflows / Use Cases
- **Monthly Review**: Logging in to check if the "School Building Project" is on schedule.
- **Funding Decision**: Reviewing impact stats to decide on next tranche.

## Edge Cases
- Donor funding multiple competing programs.

## References
- `SPEC/08-operations/03-donor-operations.md`
