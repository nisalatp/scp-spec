# Case Worker

## Purpose
The Case Worker is an operational role responsible for managing interventions (Cases) throughout their lifecycle. Unlike Field Agents who collect data, Case Workers verify data, approve services, manage enrollment, and handle case suspension/closure.

## Responsibilities
- Review and Verify incoming Visits/Applications.
- Manage active Cases (Suspend, Resume, Close).
- Evaluate eligibility for programs.
- Coordinate with other verticals (if participant).

## Associated Verticals
- **Standard Verticals**: Assigned to ONE (e.g., Social Welfare Case Worker).
- **Geo-Verticals**: Likely scoped to a District or Division.

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Assigned Geo Node (e.g., "Galle District").
- **Vertical scope**: Specific Vertical.
- **Program scope**: Specific Program (optional).

## Permissions Summary
- **Allowed**: `case.create`, `case.update`, `case.verify`, `case.suspend`, `person.view`, `visit.verify`.
- **Denied**: `policy.*`, `config.*`, `audit.view`.
- **Conditional**: Cannot view cases outside their Geo or Vertical without explicit transfer/referral.

## Data Access Boundaries
- **PII access**: **Yes**. Required for case management.
- **Sensitive health data**: Only if in Health Vertical.
- **Welfare eligibility data**: Only if in Social Welfare Vertical.
- **Audit log visibility**: None.

## Consent Requirements
- **Strict Enforcement**: Cannot view a Case if consent is Withdrawn or Expired.
- **Grace Period**: Read-only access during consent expiry grace period.

## Audit Expectations
- All case status changes (`verify`, `suspend`) are logged.
- Accessing PII (`person.view`) is logged as a Data Access event.

## Typical Workflows / Use Cases
- **Verification**: Reviewing a Household Registration submitted by a Field Agent.
- **Intervention**: Approving a "School Uniform Support" payout.

## Edge Cases
- Handling a case transferred from another district (requires scope update).

## References
- `SPEC/03-domain/05-case-intervention-model.md`
