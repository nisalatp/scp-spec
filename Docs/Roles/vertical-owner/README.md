# Vertical Owner

## Purpose
The Vertical Owner is the administrative lead for a specific Vertical (e.g., "Director of Education"). They are responsible for the configuration, policy definitions, and program strategy within their vertical. They generally do *not* perform fieldwork but have broad visibility over their domain.

## Responsibilities
- Define Vertical Policies (e.g., eligibility rules, consent texts).
- Create and Manage Programs.
- Monitor Vertical KPIs and Budgets.
- Manage "Case Worker" and "Program Manager" roles within the vertical.

## Associated Verticals
- **Standard Verticals**: Assigned to ONE (e.g., Health).
- **Geo-Verticals**: Can be scoped to a Geo (e.g., "Provincial Health Director").

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Can be Tenant-wide or Region-specific.
- **Vertical scope**: **Strictly limited** to their assigned Vertical(s).
- **Program scope**: All programs within their vertical.

## Permissions Summary
- **Allowed**: `vertical.update`, `program.create`, `program.update`, `policy.propose`, `report.view`, `case.view` (aggregate/managed).
- **Denied**: `tenant.config`, `vertical.create` (Platform role function).
- **Conditional**: Access to other verticals' data requires explicit Data Sharing Agreements (Consent or Policy).

## Data Access Boundaries
- **PII access**: Allowed for subjects enrolled in their vertical (subject to consent).
- **Sensitive health data**: Visible IF owning the Health vertical. Hidden otherwise.
- **Welfare eligibility data**: Visible IF owning the Social Welfare vertical.
- **Audit log visibility**: Visibility into actions *within* their vertical.

## Consent Requirements
- Vertical Owners define the "Use of Data" policy that subjects consent to.
- They respect consent withdrawal; systems auto-hide data when consent is lost.

## Audit Expectations
- Program creations and policy changes are audited.

## Typical Workflows / Use Cases
- **Launching a Program**: Creating "Vocational Training 2026".
- **Policy Update**: Changing the age criteria for a scholarship.

## Edge Cases
- A Vertical Owner managing two verticals (requires two role assignments or a composite role).

## References
- `SPEC/05-governance/03-vertical-governance.md`
