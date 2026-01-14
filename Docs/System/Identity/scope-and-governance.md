# Scope & Governance: Identity

## Scope Rules

### Tenant Scope
- Identities are **Tenant-Specific**. A "Nimal" in Sri Lanka is distinct from a "Nimal" in India.

### Geo Scope
- Field Agents can only search/view Persons within their assigned `GeoNode` (e.g., Village).
- Attempting to view a Person from another Village requires a Transfer or Hierarchy access.

### Vertical Scope
- Identity data (Demographics) is generally "Base Data" shared across verticals, *provided* the beneficiary has consented to that vertical.

## Governance Examples
1.  **Allowed**: Health Worker views "Nimal" (who consented to Health).
2.  **Denied**: Education Worker views "Nimal" (who only consented to Health).
3.  **Allowed**: Admin restores a soft-deleted record (Audit logged).
4.  **Denied**: Field Agent modifying a "Verified" record (Requires Case Worker).
5.  **Denied**: Creating a Person without a Name.

## Governance Logic
- Changes to "Verified" records require an Audit Reason.
