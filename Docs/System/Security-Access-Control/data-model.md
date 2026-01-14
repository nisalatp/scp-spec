# Data Model: Security & Access Control

## Entities

### Role
- `role_id` (PK)
- `tenant_id` (FK)
- `name` (e.g., "Health Officer")
- `permissions` (JSON Array of strings: `["case.view", "visit.create"]`)
- `scope_type` (Enum: Tenant, Vertical, Geo)

### UserRoleAssignment
- `assignment_id` (PK)
- `user_id` (FK)
- `role_id` (FK)
- `vertical_id` (Nullable FK)
- `geo_node_id` (Nullable FK)
- `program_id` (Nullable FK)
- `active_from`, `active_until`

### Policy
- `policy_id` (PK)
- `rules` (JSON: Deny/Allow logic)

## Storage Strategy
- **Relational**: High consistency required.
- **Cache**: Redis used for hot permissions (User -> Permission Set).

## Diagrams
- `UML/Core/system-class-diagram.puml`
