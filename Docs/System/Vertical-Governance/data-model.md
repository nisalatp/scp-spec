# Data Model: Verticals

## Entities

### VerticalDefinition
- `vertical_id` (PK)
- `tenant_id`
- `name` (e.g., "Health")
- `code` (e.g., `HTH`)
- `owner_role_id`
- `status` (Active, Suspended)
- `config` (JSON - Custom settings)

## Storage Strategy
- **Reference Data**: Low volume, high read. Cached aggressively.

## Diagrams
- `UML/Core/system-class-diagram.puml`
