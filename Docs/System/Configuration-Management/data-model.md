# Data Model: Configuration Management

## Entities

### ConfigItem
- `key` (String)
- `scope_type` (Global, Tenant, Vertical)
- `scope_id`
- `value` (JSON/String)
- `is_secret` (Boolean)
- `version` (Integer)

### ConfigAudit
- `change_id`
- `key`
- `old_value`
- `new_value`
- `changed_by`
- `reason`

## Diagrams
- `UML/Core/system-class-diagram.puml`
