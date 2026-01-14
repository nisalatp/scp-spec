# Scope & Governance: Form Scripting

## Scope Rules

### 1. Tenant Scope
- Scripts must declare `target_tenant: "LKA"`. Import fails if Token Tenant != Target Tenant.

## Governance Examples
1.  **Allowed**: Admin imports "Health Package v1.2" to "LKA".
2.  **Denied**: Admin imports "Health Package" to "IND" (Tenant Mismatch).
3.  **Denied**: Developer tries to overwrite an Active verified form (System forces new Version).

## Governance Logic
- **Immutable Keys**: `formKey` in the script MUST match the DB. You cannot rename a form Key (it breaks data sync). You must create a new one.
