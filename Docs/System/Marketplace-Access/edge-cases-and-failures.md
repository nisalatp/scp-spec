# Edge Cases & Failures: Marketplace Access

## Edge Cases
1.  **Early Revocation**: Security breach suspected.
    - *Action*: Admin clicks "Revoke". System invalidates OIDC Tokens immediately (or sets short TTL on tokens).
2.  **Partial Approval**: NGO asked for "Health" and "Finance". Admin approves "Health" only.
    - *Action*: Grant is created with limited scope.

## Failure Handling
- **IAM Sync Fail**: SCP approves, but Keycloak is down.
    - *Recovery*: Outbox Pattern. Retry provisioning until success.
