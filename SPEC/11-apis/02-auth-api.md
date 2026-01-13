# SCP-SPEC-API-02: Authentication API

## Purpose

This document defines authentication-related APIs and token usage patterns.

## In Scope / Out of Scope

**In Scope**
- Token validation
- User session context

**Out of Scope**
- Identity provider UI flows

## Definitions

- OIDC Token: Access token issued by Keycloak.
- Tenant Claim: Token claim identifying tenant.
- Tenant Membership: Association of a user to a tenant.
- Session Tenant: Tenant selected for an authenticated session.

## Rules (MUST/SHOULD/MAY)

- Authentication MUST be delegated to Keycloak.
- APIs MUST validate OIDC tokens.
- Tokens MUST include tenant_id claim.
- ROOT tokens MAY omit tenant_id to allow cross-tenant access.
- Tokens MUST represent a single tenant membership per session for non-ROOT users.
- APIs MUST reject non-ROOT tokens with tenant_id not in the user's memberships.
- Tokens SHOULD include role and scope claims.
- Opaque access tokens MUST be used for all clients, including machine clients, and validated via introspection.
- Refresh MAY be handled by clients.

## API Endpoints

- `POST /auth/introspect`
  - Input: access_token
  - Output: active, subject_id, tenant_id (optional for ROOT), roles, scopes, expires_at
- `GET /auth/context`
  - Input: none (OIDC token in Authorization header)
  - Output: subject_id, tenant_id, roles, scopes, verticals, geo_scopes, is_root
- `GET /auth/tenants`
  - Input: none (OIDC token in Authorization header)
  - Output: tenant_memberships (tenant_id, role_summary, status)

## Edge Cases

- Expired tokens.
- Missing tenant claim.
- Token with tenant_id not in the user's memberships.

## Audit & Logs

- Authentication failures MUST be logged.
- Token validation errors MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/02-authentication.md
- SPEC/04-security/03-root-accounts.md
