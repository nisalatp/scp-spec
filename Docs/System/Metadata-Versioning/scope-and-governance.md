# Scope & Governance: Metadata Versioning

## Scope Rules
- **No Overwrites**: `v2` is a *new row* in the database, not an update to `v1`.

## Governance Policies
### 1. Backward Compatibility
- New versions *should* be backward compatible where possible, but hard breaks (Field deletions) are allowed because old records stay linked to the old version.

### 2. Retention
- Metadata versions are kept **forever**. You cannot delete "Form v1" if even a single Case Record points to it.
