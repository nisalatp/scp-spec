# SCP-SPEC-CORE-07: Metadata Versioning

## Purpose

This document defines versioning rules for metadata-driven components such as forms and configurations.

## In Scope / Out of Scope

**In Scope**
- Versioning strategy
- Backward compatibility

**Out of Scope**
- Data migration tooling

## Definitions

- Metadata: Configuration defining system behavior.
- Version: Immutable snapshot of metadata.

## Rules (MUST/SHOULD/MAY)

- Metadata MUST be immutable once published.
- New versions MUST be created for changes.
- Active records MUST reference fixed versions.
- Rollback MAY be supported.
- Old versions MUST be retained indefinitely.
- Draft versions MUST be visible only to owners, umbrella authority, and ROOT.

## Edge Cases

- Multiple active versions.
- Version drift across tenants.

## Audit & Logs

- Version changes MUST be logged.
- Version history MUST be retained.

## Open Questions

- None.

## References

- SPEC/06-platform-core/06-form-builder.md
- SPEC/05-governance/04-policy-change-control.md
