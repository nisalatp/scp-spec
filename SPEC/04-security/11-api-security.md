# SCP-SPEC-SEC-11: API Security

## Purpose

This document defines security requirements for SCP APIs.

## In Scope / Out of Scope

**In Scope**
- API authentication and authorization
- Transport security

**Out of Scope**
- Client SDK design

## Definitions

- API Client: Consumer of SCP APIs.
- Token: OIDC access token.

## Rules (MUST/SHOULD/MAY)

- All APIs MUST require authentication.
- Tokens MUST be validated on every request.
- TLS MUST be enforced.
- Rate limits SHOULD be applied.
- mTLS MUST be required for internal APIs.

## Edge Cases

- Token expiration mid-request
- Mis-scoped tokens

## Audit & Logs

- API access MUST be logged.

## Open Questions

- None.

## References

- SPEC/09-integrations/01-integration-overview.md
