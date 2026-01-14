# Data Model: Form Builder

## Entities

### FormDefinition
- `form_id` (PK)
- `key` (e.g., `household-survey`)
- `tenant_id`
- `vertical_id`

### FormVersion
- `version_id` (PK)
- `form_id` (FK)
- `version_number` (SemVer)
- `schema_json` (The full definition)
- `status` (Draft, Published, Archived)
- `published_at`

## Storage Strategy
- **Document Store (JSONB)**: Ideal for storing the complex nested structure of a Form Schema.

## Diagrams
- `UML/Core/system-class-diagram.puml`
