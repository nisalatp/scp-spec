# SCP-SPEC-RUN-05: Backup and Restore Runbook

## Purpose

This runbook defines procedures for backing up and restoring SCP data.

## In Scope / Out of Scope

**In Scope**
- Database backups
- Restore operations
- Disaster recovery actions

**Out of Scope**
- Application code rollback

## Definitions

- Backup: Point-in-time data copy.
- Restore: Recovery from backup.

## Rules (MUST/SHOULD/MAY)

- Tenant databases MUST be backed up regularly.
- Backups MUST comply with data residency.
- Restore operations MUST be tested periodically.
- Backup files SHOULD be encrypted.
- Restore MAY be tenant-specific.
- RPO and RTO targets MUST be 6 hours by default unless overridden by tenant policy.
- Point-in-time recovery MUST be enabled.

## Edge Cases

- Corrupt backups.
- Restore to incorrect environment.

## Audit & Logs

- Backup and restore actions MUST be logged.
- DR tests MUST be documented.

## Open Questions

- None.

## References

- SPEC/10-data/07-backup-restore-dr.md
- SPEC/12-deployment/05-observability.md
