# Scope & Governance: Audit Logging

## Scope Rules

### 1. Tenant Isolation
- "India" Auditors cannot see "Sri Lanka" logs.
- Physical separation of storage buckets recommended.

## Governance Examples
1.  **Allowed**: Auditor searches "All access to User X" in last 30 days.
2.  **Denied**: Admin tries to "Edit" a log entry to cover tracks. (Crypto-signed).

## Governance Logic
- **Immutability**: Logs are hashed and chained (blockchain-lite) or stored in WORM storage (S3 Object Lock).
