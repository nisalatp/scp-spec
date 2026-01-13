# SCP-SPEC-API-01: API Standards

## Purpose

This document defines mandatory standards for all SCP APIs to ensure consistency, security, and governance compliance.

## In Scope / Out of Scope

**In Scope**
- API design principles
- Request and response standards
- Error handling conventions

**Out of Scope**
- UI or client SDK design
- Internal service interfaces

## Definitions

- API: Application Programming Interface.
- Client: Any system consuming SCP APIs.

## Rules (MUST/SHOULD/MAY)

- All APIs MUST be RESTful over HTTPS.
- APIs MUST be versioned.
- API versions MUST follow semantic versioning.
- All requests MUST include authentication tokens.
- Tenant context MUST be resolved from token claims for non-ROOT users.
- ROOT requests MAY specify tenant context per request when needed and MAY operate without it.
- APIs SHOULD use consistent error formats.
- APIs MAY support pagination and filtering.
- GraphQL is not required and is replaced by a future MCP-based interface.

## Edge Cases

- Version mismatch between client and server.
- Backward compatibility during upgrades.

## Audit & Logs

- All API calls MUST be logged.
- Errors MUST include correlation identifiers.

## Open Questions

- None.

## References

- SPEC/04-security/11-api-security.md
- SPEC/02-architecture/02-logical-architecture.md
