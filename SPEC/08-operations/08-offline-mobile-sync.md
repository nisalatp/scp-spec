# SCP-SPEC-OPS-08: Offline Mobile Sync

## Purpose

This document defines offline data capture and synchronization for mobile field operations.

## In Scope / Out of Scope

**In Scope**
- Offline data capture
- Sync workflows
- Conflict resolution

**Out of Scope**
- Mobile UI implementation
- Device storage encryption details

## Definitions

- Offline Capture: Data collected without connectivity.
- Sync: Reconciliation with central system.

## Rules (MUST/SHOULD/MAY)

- Offline capture MUST be supported for agents.
- Synced data MUST go through verification workflows.
- Conflicts MUST be detected and resolved.
- Offline data SHOULD be encrypted on device.
- Consent withdrawal MUST revoke visibility of previously downloaded sensitive data on next sync.
- Offline-created person records MUST remain unverified until reviewed.
- Offline-created duplicate person records MUST be flagged for manual review.
- Delta sync MUST be supported and is sufficient.
- Maximum offline duration MUST be configurable per tenant.

## Edge Cases

- Partial sync failures.
- Duplicate records created offline.

## Audit & Logs

- Sync attempts MUST be logged.
- Conflict resolutions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/06-form-builder.md
- SPEC/05-governance/05-data-moderation-verification.md
