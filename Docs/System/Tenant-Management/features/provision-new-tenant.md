# Provision New Tenant

## Description
The process of creating a new "Sovereign" instance of SCP for a country. This initializes the isolated database, creates the Tenant Record, and bootstraps the initial Admin user.

## Component
Tenancy

## Actors / Roles
- **ROOT** (Primary Executor)
- **Umbrella Authority** (Approver)

## Permissions
- `tenant.create`
- `tenant.provision`

## Scope Rules
- **Tenant Scope**: N/A (Global Action).
- **Allowed**: ROOT creates "SCP-Kenya".
- **Denied**: Tenant Admin of "Sri Lanka" cannot create "SCP-Kenya".

## Preconditions
- Unused Country Code (ISO-3166).
- Valid Deployment Configuration (DB details, Domain name).

## Main Flow
1.  **ROOT**: Submits `POST /system/tenants` with payload `{ code: "KE", name: "Kenya" }`.
2.  **System**: Validates ISO code uniqueness.
3.  **System**: Provisions new PostgreSQL Database `scp_ke`.
4.  **System**: Runs Database Migrations on `scp_ke` to create schema.
5.  **System**: Creates `Tenant` record in Global Registry.
6.  **System**: Creates initial `ROOT` user for the new tenant.
7.  **Audit**: Logs `TENANT_PROVISIONED` with Actor=`ROOT`.

## Alternate / Error Flows
- **Database Provision Failure**: Code rollback. Tenant record removed.
- **Duplicate Code**: Returns 409 Conflict.

## Data Read / Written
- **Global Registry**: Write (New Tenant Record).
- **Tenant DB**: Write (New Schema).

## Audit & Compliance
- **Critical Event**: Creation of a new legal data boundary.
- **Log**: Must capture *who* authorized this creation.

## Related Use Cases
- UC-01: System Setup

## Related Diagrams
- `C4/02-container.puml` (Tenant Isolation)

## References
- `SPEC/06-platform-core/01-tenant-management.md`
