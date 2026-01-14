# Platform Admin (Tenant Admin)

## Purpose
The Platform Admin (or Tenant Admin) is responsible for the technical configuration and user management of a specific Tenant. They ensure the platform is operational but do not strictly govern business rules (which is the Umbrella Authority's domain).

## Responsibilities
- Configure tenant settings (logo, feature flags).
- Manage users, groups, and role assignments.
- Define role structures (subject to Umbrella approval).
- Monitor system health.

## Associated Verticals
- **Standard Verticals**: None (Cross-vertical administrative access).
- **Geo-Verticals**: None.

## Scope Rules
- **Tenant scope**: strictly bound to their assigned `tenant_id`.
- **Geo scope**: Tenant-wide.
- **Vertical scope**: System-wide (for config) but usually **no data access** inside verticals unless providing support (explicitly granted).
- **Program scope**: N/A.

## Permissions Summary
- **Allowed**: `tenant.config`, `user.*`, `group.*`, `role.propose`, `audit.view` (admin logs only).
- **Denied**: `case.*` (PII access), `person.view` (PII), `vertical.create` (requires Umbrella), `policy.approve`.
- **Conditional**: Can assign roles to others, but cannot assign `ROOT` or `Umbrella Authority` privileges without higher approval.

## Data Access Boundaries
- **PII access**: **None** by default. Must not see beneficiary data.
- **Sensitive health data**: Denied.
- **Welfare eligibility data**: Denied.
- **Audit log visibility**: Visible for system events, user logins; restricted for sensitive PII access logs.

## Consent Requirements
- Not applicable as they do not access data subject records.

## Audit Expectations
- All configuration changes are high-impact audit events.
- Creating new users or roles is strictly audited.

## Typical Workflows / Use Cases
- Onboarding new staff users.
- Configuring tenant branding.
- Investigating login failures.

## Edge Cases
- Admin locking themselves out (requires specific recovery workflow).
- Admin attempting to access beneficiary data (should be denied).

## References
- `SPEC/04-security/07-scopes-groups-roles.md`
