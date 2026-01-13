# SCP-SPEC-TEST-05: User Acceptance Testing Plan

## Purpose

This document defines the user acceptance testing (UAT) approach for SCP.

## In Scope / Out of Scope

**In Scope**
- Validation of business workflows via APIs
- Governance and approval scenarios
- Reporting and export validation

**Out of Scope**
- UI usability testing
- Load or security testing

## Definitions

- UAT: User Acceptance Testing.
- Business Scenario: End-to-end use case.

## Rules (MUST/SHOULD/MAY)

- UAT MUST validate key governance workflows.
- Consent and authorization scenarios MUST be tested.
- UAT SHOULD be conducted in a staging environment.
- Issues found MUST be tracked and resolved.
- UAT MUST be performed per tenant.
- Formal UAT sign-off MUST be recorded by a designated role selected per tenant.

## Edge Cases

- UAT data differing from production data.
- Incomplete test coverage for rare workflows.

## Audit & Logs

- UAT execution and sign-off MUST be recorded.
- Test evidence SHOULD be retained.

## Open Questions

- None.

## References

- SPEC/05-governance/01-governance-overview.md
- SPEC/11-apis/01-api-standards.md
