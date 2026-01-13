# SCP-SPEC-DATA-06: Data Retention and Archival

## Purpose

This document defines data retention, archival, and immutability rules for SCP.

## In Scope / Out of Scope

**In Scope**
- Retention periods
- Archival workflows
- Immutability constraints

**Out of Scope**
- Physical deletion mechanisms
- Legal interpretation

## Definitions

- Retention: Duration data remains active.
- Archival: Long-term storage without modification.

## Rules (MUST/SHOULD/MAY)

- Identity records MUST NOT be deleted.
- Archived records MUST be read-only.
- Retention periods MUST be tenant-configurable within legal limits.
- Retention periods MUST support per-vertical rules.
- Audit logs MUST be retained indefinitely.
- Archival MAY move data to lower-cost storage.
- Selective redaction MUST be allowed where legally permitted.

## Edge Cases

- Conflicting legal retention requirements.
- Restoration of archived records.

## Audit & Logs

- Archival actions MUST be logged.
- Retention policy changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/14-privacy-compliance.md
- SPEC/02-architecture/06-eventing-and-audit-architecture.md
