# SCP-SPEC-DATA-07: Backup, Restore, and Disaster Recovery

## Purpose

This document defines backup, restore, and disaster recovery (DR) requirements for SCP data.

## In Scope / Out of Scope

**In Scope**
- Backup strategies
- Restore procedures
- DR principles

**Out of Scope**
- Infrastructure-level DR automation

## Definitions

- Backup: Point-in-time copy of data.
- Restore: Recovery from backup.
- DR: Disaster recovery.

## Rules (MUST/SHOULD/MAY)

- Tenant databases MUST be backed up regularly.
- Backups MUST respect data residency.
- Restore procedures MUST be tested periodically.
- Backups SHOULD be encrypted.
- DR plans MAY differ per tenant.
- Default RPO and RTO targets MUST be 6 hours unless tenant policy specifies otherwise.
- Point-in-time recovery MUST be enabled.
- Cross-region backups MAY be permitted if data residency requirements are met.

## Edge Cases

- Partial restores.
- Corrupted backups.

## Audit & Logs

- Backup and restore actions MUST be logged.
- DR drills SHOULD be documented.

## Open Questions

- None.

## References

- SPEC/02-architecture/08-availability-and-resilience.md
- SPEC/15-runbooks/01-incident-response.md
