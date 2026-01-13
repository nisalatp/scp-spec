# SCP-SPEC-API-14: OpenAPI Plan

## Purpose

This document defines the plan for documenting SCP APIs using OpenAPI.

## In Scope / Out of Scope

**In Scope**
- OpenAPI specification generation
- Versioning strategy

**Out of Scope**
- API client generation

## Definitions

- OpenAPI: API specification standard.

## Rules (MUST/SHOULD/MAY)

- All public APIs MUST be documented in OpenAPI.
- Specs MUST be versioned with APIs.
- Security schemes MUST be defined.
- Examples MUST be included.
- Separate OpenAPI specs per tenant MUST NOT be required.

## Edge Cases

- Spec drift from implementation.
- Deprecated endpoints.

## Audit & Logs

- Spec changes SHOULD be logged.
- Publication history MUST be traceable.

## Open Questions

- None.

## References

- SPEC/11-apis/01-api-standards.md
- SPEC/02-architecture/09-architecture-decisions-adr.md
