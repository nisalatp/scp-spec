# SCP-SPEC-TEST-01: Test Strategy

## Purpose

This document defines the overall testing strategy for SCP to ensure correctness, security, performance, and governance compliance in an API-only system.

## In Scope / Out of Scope

**In Scope**
- Unit, integration, and system testing
- Security, performance, and contract testing
- Governance and audit verification

**Out of Scope**
- UI testing
- Third-party system testing beyond contracts

## Definitions

- Test Strategy: Structured approach to testing activities.
- API-only Phase 1: SCP phase where all access is via APIs.

## Rules (MUST/SHOULD/MAY)

- Testing MUST cover authorization PDP evaluation.
- Deny-wins behavior MUST be explicitly tested.
- Consent enforcement MUST be validated per vertical.
- Tenant isolation MUST be verified in all test levels.
- Automated tests SHOULD be used where possible.
- Manual exploratory testing MAY supplement automation.
- Minimum automated test coverage MUST be 80 percent.
- Synthetic tenants MUST be used for testing.

## Edge Cases

- Conflicting permissions across geo and vertical scopes.
- Partial failures in multi-step workflows.

## Audit & Logs

- Test execution results SHOULD be logged.
- Security-relevant test failures MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
- SPEC/11-apis/01-api-standards.md
