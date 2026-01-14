# Scope & Governance: Verticals

## Scope Rules

### 1. Vertical Isolation
- By default, Data is SILOED.
- Queries like `Select * From All_Verticals` are technically impossible for standard users.

### 2. Geo-Verticals
- Special type: "Southern Province Health".
- Inherits rules from "National Health" but applies to a sub-region.

## Governance Examples
1.  **Allowed**: Health Admin creates "Dengue Program".
2.  **Denied**: Health Admin creates "School Lunch Program" (Belongs to Education).
3.  **Allowed**: Education Admin requests View Access to "Vaccination Status" (Subject to Approval + Consent).

## Governance Logic
- **Lifecycle**: Draft -> Active -> Deprecated -> Archived.
