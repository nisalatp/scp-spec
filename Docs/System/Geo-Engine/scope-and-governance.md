# Scope & Governance: Geo Engine

## Scope Rules

### 1. Tenant Scope
- Geo Hierarchies are strictly per-Tenant. Sri Lankan districts cannot exist in the Indian tenant.

### 2. Geo Scope (Recursive)
- Access to a Geo Node implies access to all its *descendants*.
- A "Province Admin" has scope over all Districts in that Province.

## Governance Examples
1.  **Allowed**: Admin creates "Northern Province".
2.  **Denied**: Admin tries to delete "Colombo District" while it has active child Villages (Referential Integrity).
3.  **Allowed**: Field Agent syncs "Galle" data (Assigned Geo).
4.  **Denied**: Field Agent syncs "Jaffna" data (Out of Scope).

## Governance Logic
- **Structure Lock**: Once populated with People/Assets, the hierarchy levels are locked. Renaming is allowed; Restructuring requires migration tools.
