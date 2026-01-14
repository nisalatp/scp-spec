# SCP-SPEC-VERTICALS-06: Geo-Vertical Runtime (Resolved Lapse: geo-extension)

## Purpose
Defines the "Universal Vertical Runtime" allowing Dynamic Verticals (WASH, Housing) to be defined without code deployment (L-02).

## Meta-Schema Architecture
Instead of hardcoded tables, Geo-Verticals use a Meta-Schema:

### 1. Vertical Definition
```json
{
  "vertical_id": "wash-sl-province1",
  "name": "WASH (Western Province)",
  "entities": ["water_point", "sanitation_facility"]
}
```

### 2. Entity Definition
Schema stored in `sys_entity_definitions`:
*   `name`: "water_point"
*   `attributes`: [{"name": "ph_level", "type": "float"}, {"name": "source_type", "type": "enum"}]

### 3. Data Storage
*   **Physical Table**: `geo_vertical_data` (Partitioned by VerticalID)
*   **Columns**: `id`, `vertical_id`, `entity_type`, `data` (JSONB), `search_vector` (TSVector).

## Auto-CRUD API
The API Gateway dynamically routes requests based on the definition:
*   `POST /api/geo/{vertical_id}/{entity_type}` -> Validates against JSON Schema -> Writes to `geo_vertical_data`.
*   `GET /api/geo/{vertical_id}/{entity_type}` -> specific Index Scan.

## Lifecycle
1.  **Define**: Admin uploads Definition JSON.
2.  **Validate**: System checks for conflicts.
3.  **Activate**: API routes become immediately available.

## Use Case Support
*   **UC-09 (WASH)**: Define "Latrine" entity on the fly.
*   **UC-11 (Housing)**: Define "DamageReport" entity during a disaster.
