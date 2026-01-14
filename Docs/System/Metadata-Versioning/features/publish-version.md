# Publish Version (Immutable)

## Description
Locking a definition so it can be safely used by external entities (Mobile Apps, external Partners) who need a stable contract.

## Component
Metadata Versioning

## Actors / Roles
- **Metadata Owner**
- **Umbrella Authority**

## Permissions
- `*.approve`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Reviews Draft v2.
2.  **Action**: Publish.
3.  **System**:
    - Sets `status = Active`.
    - Sets `published_at = Now`.
    - Marks v1 as `Deprecated` (optional policy).
    - Prevents ANY further edits to v2.

## Data Read / Written
- **VersionedEntity**: Update.

## Audit & Compliance
- **Integrity**: Guaranteed reproducibility. "Show me the form used in 2024".

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/07-metadata-versioning.md`
