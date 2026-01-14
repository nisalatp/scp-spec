# Data Model: Geo Engine

## Entities

### GeoLevel
- `level_id` (PK)
- `tenant_id` (FK)
- `rank` (0=Root, 1=Province...)
- `name` (e.g., "Province")

### GeoNode
- `node_id` (PK)
- `code` (Unique Index)
- `parent_id` (FK, Self)
- `name`
- `centroid` (Point)
- `boundary` (Polygon, Optional)

### GeoMetric
- `metric_id` (PK)
- `node_id` (FK)
- `type` (e.g., "RiskIndex")
- `value` (JSON/Number)
- `valid_from`

## Storage Strategy
- **PostGIS**: Heavily recommended for `centroid` and `boundary` efficient queries (`ST_Contains`).
- **Materialized Path**: For fast hierarchy traversal (e.g., `1.5.22`).

## Diagrams
- `UML/Core/system-class-diagram.puml`
