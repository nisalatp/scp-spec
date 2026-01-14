# Edge Cases & Failures: Tenancy

## Edge Cases
1.  **DNS Mismatch**: Domain points to specific tenant, but Header claims another. (Gateway should prioritize Domain or reject mismatch).
2.  **Suspended Tenant**: valid request, but Tenant `status=Suspended`. Middleware must intercept and block.
3.  **Database Move**: Tenant DB connection string changes while active. (Requires maintenance mode).
4.  **Code Collision**: Creating "LKA" when archived "LKA" exists.
5.  **Zero Config**: New tenant has no config table. (System should fallback to defaults).
6.  **Admin Lockout**: No admins active in tenant. (ROOT must break glass).
7.  **Multi-Tenant User**: User has accounts in LKA and IND with same email. (Identity Provider handles switching).
8.  **Orphaned Resources**: Files in S3 bucket not deleted after Tenant deletion. (Archival policy).
9.  **Case-Sensitivity**: `lka` vs `LKA`.
10. **Geo-IP Conflict**: User accesses "LKA" tenant from "IND" IP. (Security warning, not specific to Tenancy logic).

## Failure Handling
- **DB Connection Fail**: If Tenant DB is down, return `503 Service Unavailable` with "Maintenance" message.
