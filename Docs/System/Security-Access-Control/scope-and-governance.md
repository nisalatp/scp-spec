# Scope & Governance: Security & Access Control

## Scope Rules

### 1. Tenant Scope
- The first check. `User.TenantID == Resource.TenantID`.
- Exception: ROOT.

### 2. Geo Scope
- Evaluated alongside Vertical.
- `Resource.GeoNode` must be a child of `User.AssignedGeoNode`.

### 3. Vertical Scope
- User must have `role.vertical_id == resource.vertical_id`.
- Or a Data Sharing Policy must exist.

## Governance Examples
1.  **Allowed**: Health Officer views Health Record in their District.
2.  **Denied**: Health Officer views Health Record in different District (`Geo Mismatch`).
3.  **Denied**: Health Officer views Education Record (`Vertical Mismatch`).
4.  **Denied**: Suspended User tries anything (`AuthN Fail`).
5.  **Allowed**: ROOT deletes a record across tenants (`Bypass`).

## Governance Logic
- Policy Pack changes take effect immediately (cached for short TTL).
