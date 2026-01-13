# SCP-SPEC-TEST-04: Contract Testing

## Purpose

This document defines contract testing for SCP APIs and integrations.

## In Scope / Out of Scope

**In Scope**
- API request and response contracts
- Integration interface validation

**Out of Scope**
- Full end-to-end integration tests

## Definitions

- Contract Test: Test verifying agreed API behavior.
- Consumer: Client using SCP APIs.

## Rules (MUST/SHOULD/MAY)

- All public APIs MUST have defined contracts.
- Contracts MUST enforce schema and validation rules.
- Breaking changes MUST be detected before deployment.
- Contract tests SHOULD be automated.
- Consumer-driven contracts MAY be supported.
- Separate contracts MUST be supported per tenant when configured.

## Edge Cases

- Backward compatibility during version upgrades.
- Optional fields becoming mandatory.

## Audit & Logs

- Contract test results SHOULD be logged.
- Contract violations MUST be auditable.

## Open Questions

- None.

## References

- SPEC/11-apis/14-openapi-plan.md
- SPEC/09-integrations/01-integration-overview.md
