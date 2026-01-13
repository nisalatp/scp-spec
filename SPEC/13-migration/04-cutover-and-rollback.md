# SCP-SPEC-MIG-04: Cutover and Rollback

## Purpose

This document defines the final cutover and rollback procedures during migration.

## In Scope / Out of Scope

**In Scope**
- Production cutover steps
- Rollback decision points
- Post-cutover validation

**Out of Scope**
- Long-term dual-system operation
- UI-level fallbacks

## Definitions

- Cutover: Final switch to the new system.
- Rollback: Reversion to source system.

## Rules (MUST/SHOULD/MAY)

- Cutover MUST occur during a defined window.
- Source system MUST be set to read-only before cutover.
- Rollback MUST be possible until final confirmation.
- Rollback SHOULD restore source system write access.
- Post-cutover validation MUST be performed.
- Rollback MUST be allowed only when no conflicting data has been written to the target system.
- Rollback MUST be triggered by an explicitly permitted role defined by governance.
- No explicit rollback time limit is defined; rollback remains possible while no conflicts exist.

## Edge Cases

- Cutover interrupted mid-process.
- Latent issues discovered after cutover.

## Audit & Logs

- Cutover actions MUST be logged.
- Rollback execution MUST be auditable.

## Open Questions

- None.

## References

- SPEC/12-deployment/03-ci-cd.md
- SPEC/05-governance/02-umbrella-authority-model.md
