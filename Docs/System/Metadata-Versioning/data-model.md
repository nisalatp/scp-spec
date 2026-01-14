# Data Model: Metadata Versioning

## Entities

### Definition (The Container)
- `definition_id` (UUID)
- `key` (e.g., "household_reg")
- `name`

### DefinitionVersion (The Snapshot)
- `version_id` (UUID)
- `definition_id`
- `version_number` (Integer: 1, 2, 3...)
- `content` (JSONB: The Form Schema)
- `status` (Draft, Published, Archived)
- `published_at`

## Diagrams
- `UML/Core/system-class-diagram.puml`
