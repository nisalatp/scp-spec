# Audit & Compliance: Security & Access Control

## Logged Events
- `auth.login_success`, `auth.login_fail`
- `role.create`, `role.assign`, `role.revoke`
- `access.deny` (High volume, often sampled or aggregated).

## Fields
- `decision` (Allow/Deny)
- `policy_version`
- `denial_reason` (e.g., "GeoMismatch")

## Retention
- Security Logs: 1 Year minimum.
