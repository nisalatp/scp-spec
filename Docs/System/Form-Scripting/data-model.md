# Data Model: Form Scripting

## Entities

### ImportRecord
- `import_id` (PK)
- `tenant_id` (FK)
- `package_name`
- `package_version`
- `imported_at`
- `imported_by`
- `status` (Success, Failed)
- `log` (Text)

## Storage Strategy
- **Relational**: Audit Log.

## Diagrams
- `UML/Sequences/script-import.puml`
