# Data Model: Facility Registry

## Entities

### Facility
- `facility_id`
- `name`
- `type` (Enum: Hospital, School, Warehouse)
- `geo_id` (Link to Admin Hierarchy)
- `coordinates` (Lat/Long)
- `status` (Active, Closed)
- `attributes` (JSONB: "bed_count", "has_fridge")

### Linkage
- `services` (List of tags: "Vaccine", "ER")

## Diagrams
- `UML/Core/system-class-diagram.puml`
