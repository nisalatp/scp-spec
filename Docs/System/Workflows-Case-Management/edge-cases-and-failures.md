# Edge Cases & Failures: Workflows & Case Management

## Edge Cases
1.  **Approver Leaves**: Supervisor quits while cases are in their queue. (Admin Re-assign function).
2.  **Policy Change**: "Grant limit changed from 10k to 20k". (Active cases stick to old policy? or migrate? Governance choice).
3.  **Cross-Vertical Rejection**: Health approves, but Education rejects (for joint case). (Case stalls).

## Failure Handling
- **Double Approval**: Race condition where two supervisors approve same case. (Optimistic Locking version check).
