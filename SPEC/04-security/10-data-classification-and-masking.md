# SCP-SPEC-SEC-10: Data Classification and Masking

## Purpose

This document defines how sensitive data is classified and masked.

## In Scope / Out of Scope

**In Scope**
- Field sensitivity
- Record classification

**Out of Scope**
- Encryption algorithms

## Definitions

- Classification: Sensitivity level of data.
- Masking: Obscuring data values.

## Rules (MUST/SHOULD/MAY)

- Fields MUST be classifiable.
- Classification MUST be enforced during access.
- Masking SHOULD be configurable.
- ROOT access MUST bypass masking and classification, with elevated audit logging.
- Highly sensitive data MAY require additional approvals.
- Dynamic masking rules MUST be supported.

## Edge Cases

- Mixed sensitivity records
- Derived data masking

## Audit & Logs

- Masking decisions MUST be logged.

## Open Questions

- None.

## References

- SPEC/04-security/09-consent-and-data-sharing.md
