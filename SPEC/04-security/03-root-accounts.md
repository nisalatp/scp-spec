# SCP-SPEC-SEC-03: ROOT Accounts

## Purpose

This document defines the behavior and constraints of SCP ROOT (Global Super Admin) accounts.

## In Scope / Out of Scope

**In Scope**
- ROOT identification
- ROOT privileges and bypass rules

**Out of Scope**
- Tenant-level administrators

## Definitions

- ROOT Account: Immutable global super administrator.
- Bypass: Override of all authorization checks.

## Rules (MUST/SHOULD/MAY)

- ROOT accounts MUST authenticate via Google OAuth only.
- ROOT identities MUST be hardcoded as hashed email values in code.
- ROOT accounts MUST bypass all authorization, deny, consent, and masking rules.
- ROOT accounts MAY operate across tenants without a session-bound tenant_id.
- All ROOT actions MUST record target tenant context (single or multi-tenant).
- ROOT actions MAY include a reason code or ticket ID in audit logs.
- ROOT accounts MUST NOT be disabled, modified, or scoped.
- ROOT credential rotation is not supported; changes require code updates under governance control.
- Multiple ROOT accounts MAY exist.

## Edge Cases

- Google identity unavailable
- Compromised ROOT email account

## Audit & Logs

- All ROOT actions MUST be logged with elevated severity.
- ROOT log entries MUST be immutable.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
- SPEC/15-runbooks/02-break-glass-procedure.md
