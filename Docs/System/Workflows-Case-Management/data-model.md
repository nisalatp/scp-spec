# Data Model: Workflows & Case Management

## Entities

### Case
- `case_id` (PK)
- `person_id` (FK)
- `program_id` (FK)
- `status` (Draft, Active, Suspended, Closed)
- `current_workflow_step`

### WorkflowDefinition
- `workflow_id`
- `steps` (JSON: `[{step: "Review", role: "Supervisor"}]`)

### WorkflowTransition
- `transition_id`
- `case_id`
- `from_step`, `to_step`
- `actor_id`
- `comment`

## Storage Strategy
- **Relational**: Good for transaction integrity.
- **State Machine**: Often best implemented with a library or dedicated patterns (e.g. Sagas).

## Diagrams
- `UML/Core/system-class-diagram.puml`
