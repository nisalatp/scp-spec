# Scope & Governance: Consent Management

## Scope Rules

### 1. Vertical Scope
- Consent is strictly **Per-Vertical**.
- Granting "Health" consent does **not** grant "Education" consent.
- "Global" consent is NOT supported (Privacy by Design).

### 2. Time Scope
- `Active From` to `Active Until`.
- Access strictly denied outside this window (plus Grace Period).

## Governance Examples
1.  **Allowed**: Agent uploads signature for "Health Program". Case Worker verifies -> Active.
2.  **Denied**: Agent tries to withdraw consent offline (Security Risk).
3.  **Allowed**: Case Worker accesses data during "Grace Period" (Read-Only).
4.  **Denied**: System exports data for Analytics after Consent Withdrawn.

## Governance Logic
- **Immutability**: You cannot "Edit" a consent date. You must "Withdraw" old and "Create" new.
