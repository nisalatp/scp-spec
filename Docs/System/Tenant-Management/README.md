# Tenancy Component

## Purpose
The Tenancy component provides the fundamental isolation layer for the SCP platform. It ensures that each country implementation operates as a sovereign entity with its own database, configuration, and user population, while sharing the same codebase.

## Responsibilities
- **Isolation**: Enforcing hard boundaries between data of different tenants (countries).
- **Lifecycle**: Creating, suspending, and archiving tenants.
- **Configuration**: Managing tenant-specific settings (branding, feature flags, localization).
- **Resolution**: Identifying the active tenant for every incoming request.

## In Scope / Out of Scope
**In Scope**:
- Tenant Registry (List of active tenants).
- Per-tenant Database Connection management.
- Tenant Configuration API.

**Out of Scope**:
- Billing/Subscription management (Phase 2).
- Internal "departmental" tenancy (handled by Verticals/Geos).

## Owned Data / Owned Policies
- **Data**: `Tenant` record, `TenantConfig`.
- **Policies**: Tenant Creation Policy, Cross-Tenant Access Policy.

## Dependent Components
- **Identity**: Users belong to tenants.
- **Security**: AuthZ checks tenant context first.
- **Geo**: Root GeoNodes are bound to a Tenant.

## Exposed Interfaces (APIs / Events)
- `GET /system/tenants` (ROOT only)
- `GET /tenant/config`
- Event: `TenantCreated`, `TenantSuspended`

## Related Diagrams (UML/C4)
- `C4/02-container.puml` (Shows Tenant Database isolation)
- `C4/03-component.puml` (Shows Tenant Manager module)

## Related Use Cases
- **System Setup**: Initializing a new country deployment.

## References
- `SPEC/06-platform-core/01-tenant-management.md`
