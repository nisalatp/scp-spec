# Scope & Governance: Attachments & Documents

## Scope Rules
- **Tenant Isolation**: Bucket paths are prefixed by `tenant_id`.
- **Vertical Partitioning**: Files uploaded to a "Health Case" are tagged `vertical_id=health`.

## Governance Policies
### 1. Retention
- Attachments follow the Retention Policy of their Parent. If `Case` is deleted, `Attachment` is deleted (Cascading).

### 2. File Types
- Whitelist Only (JPG, PNG, PDF). strict blocking of `.exe`, `.sh`.
