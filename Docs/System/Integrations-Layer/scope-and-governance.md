# Scope & Governance: Integrations Layer

## Scope Rules

### 1. Vertical Scoping
- An Integration is bound to specific Verticals (e.g., "MOH System" is bound to "Health").
- It cannot access "Education" data.

### 2. Tenant Scoping
- "Sri Lanka Bank" integration exists only in "LKA" tenant.

## Governance Examples
1.  **Allowed**: Health Vertical sends "Vaccine Stats" to MOH (Contract exists).
2.  **Denied**: Education Vertical tries to use "Health Payment Gateway" (Vertical mismatch).
3.  **Denied**: Integration tries to "Pull" all Person data (Bulk Export requires special clearance).

## Governance Logic
- **Lifecycle**: Draft -> Requested -> Approved -> Active.
- **Secrets Management**: Secrets (API Keys) must NEVER leave the Vault.
