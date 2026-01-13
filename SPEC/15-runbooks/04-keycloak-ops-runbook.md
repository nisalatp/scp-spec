# SCP-SPEC-RUN-04: Keycloak Operations Runbook

## Purpose

This runbook defines operational procedures for managing Keycloak in SCP.

## In Scope / Out of Scope

**In Scope**
- Realm configuration
- Client and role management
- MFA enforcement

**Out of Scope**
- Keycloak UI customization

## Definitions

- Realm: Keycloak tenant space.
- Client: Application registered in Keycloak.

## Rules (MUST/SHOULD/MAY)

- SCP MUST use a single Keycloak realm with tenant claims.
- Email-based MFA MUST be enforced.
- ROOT accounts MUST be preconfigured.
- Changes SHOULD be tested before production.
- Backups MAY be taken before major changes.
- Keycloak MUST be deployed in HA mode.
- Realm backups MUST support both automated schedules and manual triggers.

## Edge Cases

- Accidental role removal.
- Keycloak outage.

## Audit & Logs

- Keycloak admin actions MUST be logged.
- Authentication failures MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/02-authentication.md
- SPEC/04-security/07-scopes-groups-roles.md
