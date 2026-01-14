# Boundaries: Metadata Versioning

## Ownership
- **Owns**: The *Protocol* for creating new versions.
- **Owns**: The *Policy* for referencing valid versions.

## Never Owns
- **The Content**: The Form Builder owns the *fields*. The Versioning system just provides the *wrapper*.

## Integration Boundaries
- **Inbound**:
    - **Form Designer**: "Publish v2".
- **Outbound**:
    - **Field App**: "Sync Forms v2".
