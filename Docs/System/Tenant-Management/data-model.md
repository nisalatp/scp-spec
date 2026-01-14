# Data Model: Tenancy

## Entities

### Tenant
- `tenant_id` (GUID, PK)
- `code` (String, Unique, e.g., "LKA")
- `name` (String, e.g., "Sri Lanka")
- `status` (Enum: Active, Suspended, Archived)
- `db_connection_ref` (Secure Ref)
- `created_at`, `created_by`

### TenantConfig
- `config_id` (GUID, PK)
- `tenant_id` (FK)
- `key` (String, e.g., "Feature.FaceAuth")
- `value` (JSON)
- `description`
- `last_updated_by`

## Storage Strategy
- **Global Catalog**: Stored in a central "Admin" database (used for routing).
- **Local Config**: Stored in the tenant's own database (sometimes cached).

## Diagrams
- See `UML/Core/system-class-diagram.puml` (Tenant class).
