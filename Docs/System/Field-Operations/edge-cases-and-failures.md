# Edge Cases & Failures: Data Collection

## Edge Cases
1.  **GPS Drift**: Visit location is 5km away from House location. (Flag as Suspicious).
2.  **Time Travel**: Device clock wrong, visit date in 1970 or 2030. (Reject or normalize).
3.  **Huge Sync**: Agent hasn't synced in 30 days. Upload is 1GB. (Pagination/Chunking required).
4.  **Version Mismatch**: App using Form v1, Server requires v2. (Server accepts v1 if valid, else partial rejection).
5.  **Device Lost**: Remote Wipe trigger.
6.  **Battery Die**: Form half-filled. (App must auto-save).
7.  **Simultaneous Edit**: Two agents editing same person. (Last Write Wins OR Field-level merge).
8.  **No Photos**: Mandatory evidence missing. (Reject).

## Failure Handling
- **Partial Sync**: If 5/10 visits fail validation, the other 5 should succeed. Batch response must indicate individual status.
