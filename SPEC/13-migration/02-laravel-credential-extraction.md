# SCP-SPEC-MIG-02: Laravel Credential Extraction

## Purpose

This document defines how authentication and credential-related information is extracted from the existing Laravel SCP system to initialize Keycloak and API clients.

## In Scope / Out of Scope

**In Scope**
- Google OAuth client settings
- Application-level credentials
- User email identity mapping

**Out of Scope**
- User passwords
- Session or token migration

## Definitions

- Credential Extraction: Process of retrieving auth configuration.
- OAuth Client: Registered client in Keycloak.

## Rules (MUST/SHOULD/MAY)

- Google OAuth client IDs and secrets MUST be extracted securely.
- Extracted credentials MUST be re-registered in Keycloak.
- User identities MUST be matched by email address only.
- Passwords MUST NOT be migrated.
- Extraction scripts SHOULD be one-time use.
- Multiple OAuth clients MUST NOT be required per environment.
- Legacy test credentials MUST be handled using internationally accepted practices.

## Edge Cases

- Missing or invalid OAuth configuration in source system.
- Users without email addresses.

## Audit & Logs

- Credential extraction MUST be logged.
- Access to source secrets MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/02-authentication.md
- SPEC/11-apis/02-auth-api.md
