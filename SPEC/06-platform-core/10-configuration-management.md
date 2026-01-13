# SCP-SPEC-CORE-10: Configuration Management

## Purpose

This document defines how configuration is managed across SCP.

## In Scope / Out of Scope

**In Scope**
- System and tenant configuration
- Configuration versioning

**Out of Scope**
- Environment provisioning

## Definitions

- Configuration: Settings controlling behavior.
- Config Scope: Level at which config applies.

## Rules (MUST/SHOULD/MAY)

- Configuration MUST be scoped (global, tenant, vertical).
- Configuration MUST be versioned.
- Sensitive config MUST be encrypted.
- Tenant admins MUST submit configuration changes for umbrella approval.
- ROOT MAY apply configuration changes without approval.
- Feature flags MUST be supported.
- Runtime configuration reload MUST be supported.

## Edge Cases

- Conflicting config values.
- Partial rollout failures.

## Audit & Logs

- Config changes MUST be logged.
- Effective config MUST be traceable.

## Open Questions

- None.

## References

- SPEC/05-governance/04-policy-change-control.md
- SPEC/02-architecture/09-architecture-decisions-adr.md
