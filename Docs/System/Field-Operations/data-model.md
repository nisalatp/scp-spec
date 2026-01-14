# Data Model: Data Collection

## Entities

### Visit
- `visit_id` (PK)
- `agent_id` (FK)
- `target_type` (Person/Household)
- `target_id`
- `geo_location` (GPS Point)
- `timestamp`
- `status` (Draft, Submitted, Verified, Rejected)
- `data_payload` (JSON - Form Data)

### AgentAssignment
- `assignment_id`
- `agent_id`
- `geo_node_id`
- `role` (e.g., "Enumerator")

## Storage Strategy
- **High Write Volume**: Optimized for ingestion.
- **Blob Storage**: Photos/Evidence stored in Object Store, referenced in DB.

## Diagrams
- `UML/Core/system-class-diagram.puml`
