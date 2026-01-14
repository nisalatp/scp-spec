# Edge Cases & Failures: Consent Management

## Edge Cases
1.  **Partial Withdrawal**: User withdrawals from Health, but keeps Education. (System must respect granular vertical scope).
2.  **Grace Period Read**: User needs critical medicine 1 day after expiry. (Allowed during Grace Period).
3.  **Evidence Lost**: Image upload failed but record created. (Status remains Pending -> Rejected).
4.  **Date Paradox**: `Active Until` before `Active From`. (Validation Error).
5.  **Duplicate Active**: Two active consents for same vertical. (Should be blocked; only one active at a time).
6.  **Minor to Major**: Child turns 18. (Consent might need re-capture depending on law; System flags for review).
7.  **Proxy Consent**: Guardian signing for disabled person. (Captured in `evidence_metadata`).

## Failure Handling
- **Consent Check Fail**: If Consent Service is down, AuthZ MUST **Fail Closed** (Deny Access).
