# SCP-SPEC-SEC-02: Authentication

## Purpose

This document defines authentication mechanisms for SCP users and machine clients.

## In Scope / Out of Scope

**In Scope**
- User authentication
- Machine authentication
- MFA requirements

**Out of Scope**
- Authorization decisions
- UI login flows

## Definitions

- IdP: Identity Provider (Keycloak)
- MFA: Multi-factor authentication
- Tenant Membership: Association of a user to a tenant; a user may hold multiple memberships.
- Session Tenant: Tenant selected for an authenticated session.

## Rules (MUST/SHOULD/MAY)

- All authentication MUST be handled by Keycloak.
- Google OAuth and local username/password MUST be supported.
- Email-based MFA MUST be enforced for all users.
- SMS MFA MAY be enabled per tenant in the future.
- Keycloak MUST use a single realm with tenant claims.
- Tokens MUST include tenant_id claim.
- ROOT tokens MAY omit tenant_id to allow cross-tenant access.
- Users MAY have multiple tenant memberships.
- Each non-ROOT session MUST be bound to exactly one tenant membership, reflected in tenant_id claim.
- Requests MUST be denied for non-ROOT users if tenant_id does not match a valid membership.
- Machine clients MUST authenticate via OIDC.

## Authentication Workflow

1. User authenticates via Keycloak (Google OAuth or username/password).
2. MFA challenge is enforced and must be completed.
3. User selects an active tenant membership for the session.
4. Keycloak issues tokens containing tenant_id (unless ROOT).
5. SCP validates the token and tenant membership on each request.

## Edge Cases

- MFA delivery failure
- Google OAuth downtime
- User with multiple tenant memberships selects the wrong tenant

## Audit & Logs

- All authentication attempts MUST be logged.
- MFA challenges and outcomes MUST be logged.

## Open Questions

- None.

## References

- SPEC/04-security/03-root-accounts.md
- SPEC/11-apis/02-auth-api.md
