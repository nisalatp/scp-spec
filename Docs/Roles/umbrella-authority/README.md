# Umbrella Authority

## Purpose
The Umbrella Authority acts as the highest governance body within the SCP tenant. It is responsible for approving policies, enabling verticals, resolving conflicts, and authorizing role definitions. It ensures the platform remains aligned with organizational or national standards.

## Responsibilities
- Approve new Vertical creations or Programs.
- Review and authorize Policy Packs.
- Approve Role definitions proposed by Admins.
- Resolve cross-vertical conflicts (Overrides).
- Authorize cross-tenant data access (if applicable).

## Associated Verticals
- **Standard Verticals**: Governance oversight over ALL.
- **Geo-Verticals**: Governance oversight over ALL.

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Tenant-wide.
- **Vertical scope**: Cross-vertical governance.
- **Program scope**: Approval authority over all.

## Permissions Summary
- **Allowed**: `policy.approve`, `vertical.approve`, `program.approve`, `role.approve`, `conflict.resolve`, `override.apply`.
- **Denied**: Direct operational data entry (e.g., `case.create`, `person.create`) unless explicitly granted a parallel operational role.
- **Conditional**: Can access sensitive data only when investigating a specific **Conflict** or **Audit** event (Break-glass or Audit context).

## Data Access Boundaries
- **PII access**: Minimum necessary for conflict resolution.
- **Sensitive health data**: Denied by usual flows; accessible via Audited Override only.
- **Welfare eligibility data**: Visible during Program approvals (aggregate/anonymized usually).
- **Audit log visibility**: Full visibility into Governance and Conflict logs.

## Consent Requirements
- Umbrella actions (approving a policy) do not require beneficiary consent.
- Accessing a specific beneficiary record for conflict resolution **requires** an override if valid consent is not present (e.g., analyzing a duplicate identity).

## Audit Expectations
- **ALL** Umbrella decisions must be logged with a justification.
- Overrides are high-severity audit events.

## Typical Workflows / Use Cases
- Approving a new "Social Welfare" program.
- Resolving a dispute between Health and Education regarding a household.
- Authorizing a new data sharing policy.

## Edge Cases
- Conflict of interest (Umbrella member is also a Vertical Owner).
- Emergency overrides during a crisis.

## References
- `SPEC/05-governance/02-umbrella-authority-model.md`
- `SPEC/05-governance/06-conflict-management.md`
