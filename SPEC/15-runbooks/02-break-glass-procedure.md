# SCP-SPEC-RUN-02: Break Glass Procedure

## Purpose

This runbook defines the emergency access (break-glass) procedure using ROOT accounts.

## In Scope / Out of Scope

**In Scope**
- Emergency ROOT access
- Temporary privilege escalation

**Out of Scope**
- Routine administrative operations

## Definitions

- Break Glass: Controlled emergency access override.
- ROOT Account: Hard-coded global super admin account.

## Rules (MUST/SHOULD/MAY)

- Break-glass access MUST be used only during emergencies.
- ROOT accounts MUST bypass authorization, consent, and masking checks.
- All break-glass usage MUST be logged.
- Access SHOULD be time-limited.
- Post-usage review MUST occur.
- Break-glass approval MUST be ROOT-only and does not require multi-party approval.
- ROOT credential rotation is not supported; ROOT identities are hard-coded and tied to Google OAuth.

## Edge Cases

- Multiple simultaneous break-glass requests.
- Loss of primary administrators.

## Audit & Logs

- Break-glass activation MUST be auditable.
- Justification MUST be recorded.

## Open Questions

- None.

## References

- SPEC/04-security/03-root-accounts.md
- SPEC/04-security/12-audit-logging.md
