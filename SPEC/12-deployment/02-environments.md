# SCP-SPEC-DEP-02: Environments

## Purpose

This document defines standard environments used across SCP deployments.

## In Scope / Out of Scope

**In Scope**
- Environment definitions
- Promotion flow

**Out of Scope**
- Developer local setups

## Definitions

- Environment: Isolated deployment stage.
- Promotion: Movement of artifacts between environments.

## Rules (MUST/SHOULD/MAY)

- SCP MUST support at least Dev, Test, and Prod environments.
- A PreProd environment MUST be supported.
- Environments MUST be isolated.
- Production data MUST NOT be used in non-prod.
- Configuration SHOULD differ by environment.
- Promotion SHOULD be automated.
- Separate per-tenant sandbox environments MUST NOT be required; logical sandboxes within a tenant MAY be provided.

## Edge Cases

- Hotfix deployment directly to production.
- Environment drift over time.

## Audit & Logs

- Promotions MUST be logged.
- Environment configuration changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/12-deployment/03-ci-cd.md
- SPEC/10-data/07-backup-restore-dr.md
