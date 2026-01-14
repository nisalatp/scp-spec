# Data Model: Infrastructure Project Registry

## Entities

### InfrastructureProject
- `project_id`
- `name`
- `type` (Enum: Road, WaterProject, Housing)
- `status` (Planned, InProgress, Completed, Suspended)
- `start_date`, `end_date`
- `sponsor_org` (e.g. "World Bank")

### ProjectGeoScope
- `project_id`
- `geo_id` (Many-to-Many link)

## Diagrams
- `UML/Core/system-class-diagram.puml`
