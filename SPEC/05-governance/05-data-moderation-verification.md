# SCP-SPEC-GOV-05: Data Moderation and Verification

## Purpose

This document defines moderation and verification processes for data collected and managed within SCP.

## In Scope / Out of Scope

**In Scope**
- Data verification workflows
- Moderation roles and responsibilities

**Out of Scope**
- Automated data validation rules
- UI moderation tools

## Definitions

- Verification: Confirmation of data accuracy.
- Moderation: Review and approval of submitted data.

## Rules (MUST/SHOULD/MAY)

- Collected data MUST be verified before becoming authoritative.
- Verification MUST follow multi-level approval where required.
- Moderators SHOULD be independent from data collectors.
- Unverified data MUST NOT be used for cases or program enrollment.
- Automated verification aids MAY be used where approved by governance.
- Unverified data MAY remain pending indefinitely but MUST remain non-authoritative.

## Edge Cases

- Conflicting verification outcomes.
- Data updated during verification.

## Audit & Logs

- All moderation actions MUST be logged.
- Verification decisions MUST be traceable.

## Open Questions

- None.

## References

- SPEC/03-domain/06-workflow-approval-model.md
- SPEC/08-operations/01-agent-field-operations.md
