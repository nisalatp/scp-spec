# Edge Cases & Failures: Metadata Versioning

## Edge Cases
1.  **Race Condition**: Two editors create Drafts.
    - *Policy*: Optimistic Locking. First one to Publish wins `v2`. Second one must re-base to create `v3`.
2.  **Hotfix**: Bug in `v2`.
    - *Action*: Cannot edit `v2`. Must immediately publish `v3` with fix.

## Failure Handling
- **Database Full**: JSONB storage can happen. Compact history?
    - *Policy*: Never compact Active history. Archive very old (unused) versions to Cold Storage if strictly needed.
