# Edge Cases & Failures: Finance

## Edge Cases
1.  **Partial Payment**: Bank sends $40 of $50 (Fees deducted?).
    - *Policy*: Record actual disbursed amount. Flag difference as "Fee" or "Shortfall".
2.  **Double Payment**: Network retry causes duplicates.
    - *Prevention*: Idempotency Keys on Payment Gateway Adapter.

## Failure Handling
- **Budget Lock Fail**: "Insufficient Funds".
    - *Action*: Auto-reject the Approval request. Notify Program Manager.
