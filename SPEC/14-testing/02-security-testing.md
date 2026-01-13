# SCP-SPEC-TEST-02: Security Testing

## Purpose

This document defines security testing requirements to validate SCP protection mechanisms.

## In Scope / Out of Scope

**In Scope**
- Authentication and authorization testing
- Consent and data masking validation
- API security testing

**Out of Scope**
- Physical security testing
- Social engineering tests

## Definitions

- Security Testing: Validation of protections against threats.
- PDP: Policy Decision Point for authorization.

## Rules (MUST/SHOULD/MAY)

- Keycloak integration MUST be tested for all auth flows.
- Invalid and expired tokens MUST be rejected.
- Deny rules MUST override allow rules in all scenarios.
- Field-level masking MUST be verified.
- Security tests SHOULD include negative cases.
- Penetration testing MAY be conducted periodically.
- Automated DAST is not required in the current phase.
- Third-party audits are not planned in the current phase.

## Edge Cases

- Token with missing tenant claim.
- Consent revoked mid-session.

## Audit & Logs

- Security test outcomes MUST be logged.
- Detected vulnerabilities MUST be tracked.

## Open Questions

- None.

## References

- SPEC/04-security/02-authentication.md
- SPEC/04-security/09-consent-and-data-sharing.md
