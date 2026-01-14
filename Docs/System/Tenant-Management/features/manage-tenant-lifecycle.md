# Manage Tenant Lifecycle

## Description
Handling the state of the Tenant: Suspension (temporary) or Archive (permanent, reversible). Used for compliance or billing enforcement.

## Component
Tenancy

## Actors / Roles
- **ROOT**
- **Umbrella Authority**

## Permissions
- `tenant.suspend`
- `tenant.archive`
- `tenant.restore`

## Scope Rules
- **Global Scope**.
- **Allowed**: ROOT suspends "Test-Tenant".
- **Denied**: Tenant Admin cannot suspend their own tenant (fail-safe).

## Main Flow (Suspension)
1.  **ROOT**: Commands `suspend tenant --reason="Compliance Audit"`.
2.  **System**: Sets `tenant.status = SUSPENDED`.
3.  **Effect**: All incoming API requests with this `tenant_id` return `403 Tenant Suspended`.
4.  **Audit**: Log Reason and Actor.

## Main Flow (Archive)
1.  **ROOT**: Commands `archive tenant`.
2.  **System**: Snapshots DB. Moves to Cold Storage.
3.  **System**: Deletes active resources.

## Alternate / Error Flows
- **Active Operations**: Cannot Archive if critical long-running jobs are active (must Force).

## Data Read / Written
- **Tenant Registry**: Update Status.

## Audit & Compliance
- **Data Sovereignty**: Archival must respect data residency rules (e.g., Cold Storage must be in-region).

## Related Use Cases
- N/A (Operational Task)

## References
- `SPEC/06-platform-core/01-tenant-management.md`
