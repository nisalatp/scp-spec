# Data Model: Eligibility Rules Engine

## Entities

### PolicyDefinition
- `policy_id` (PK)
- `program_id` (FK)
- `name`
- `description`

### PolicyVersion
- `version_id` (PK)
- `policy_id`
- `rules_json` (JSONLogic Structure)
- `active_from`, `active_until`
- `status` (Draft, Active, Archived)

## Storage Strategy
- **Document**: The Rule Logic is best stored as structured JSON.
- **Cache**: Hot rules (Active) cached in Memory.

## Diagrams
- `UML/Core/system-class-diagram.puml`
