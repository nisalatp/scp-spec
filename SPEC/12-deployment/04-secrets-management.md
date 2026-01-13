# SCP-SPEC-DEP-04: Secrets Management

## Purpose

This document defines how secrets are stored, accessed, and rotated in SCP deployments.

## In Scope / Out of Scope

**In Scope**
- Application secrets
- Integration credentials
- SMTP and gateway secrets

**Out of Scope**
- End-user credentials

## Definitions

- Secret: Sensitive configuration value.
- Secret Store: Secure storage mechanism.

## Rules (MUST/SHOULD/MAY)

- Secrets MUST NOT be stored in code or images.
- Secrets MUST be encrypted at rest.
- Access to secrets MUST be restricted.
- SMTP credentials MUST be tenant-scoped.
- Secrets SHOULD be rotated periodically.
- External secret managers MUST NOT be required; Keycloak MUST NOT be used as a secret store.
- Secret rotation MUST follow a sensible default of 90 days unless overridden by policy.

## Edge Cases

- Secret rotation without downtime.
- Compromised secrets.

## Audit & Logs

- Secret access MUST be logged.
- Rotation events MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/09-notifications-email.md
- SPEC/04-security/11-api-security.md
