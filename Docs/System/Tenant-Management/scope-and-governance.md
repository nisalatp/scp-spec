# Scope & Governance: Tenancy

## Scope Rules

### Tenant Scope
- The **Primary Boundary**.
- All data queries MUST include `WHERE tenant_id = current_context`.
- Failure to include tenant filter is a **Critical Vulnerability**.

### Geo/Vertical/Program Scope
- Tenancy acts as the *parent* container for all other scopes. Use of those scopes implies the Tenant scope.

## Governance Examples
1.  **Allowed**: Platform Admin updates the "Login Message" for their tenant.
2.  **Allowed**: ROOT creates a new tenant "SCP-LK" (Sri Lanka).
3.  **Denied**: Platform Admin of Tenant A tries to read config of Tenant B.
4.  **Denied**: Field Agent tries to change Tenant "Default Currency".
5.  **Denied**: Tenant deletion without an extensive (multi-signed) approval workflow.

## Governance Logic
- Tenant creation requires **Umbrella Approval** (unless ROOT bypass).
