# SCP-SPEC-DATA-11: GIS & Spatial (Resolved Lapse: gis-module)

## Purpose
This document defines the Geospatial Capabilities of the SCP, addressing the "GIS Module" lapse (L-01).

## Capabilities
1.  **Spatial Storage**:
    *   All primary entities (Person, Household, Facility) MUST support `Geometry(Point, 4326)`.
    *   Zones (Districts, Flood Plains) MUST support `Geometry(Polygon, 4326)`.
2.  **Spatial Indexing**:
    *   GIST Indexes MUST be applied to all geometry columns.

## GIS Service
*   **Role**: Perform complex spatial operations that are too heavy for API-level logic.
*   **Operations**:
    *   `PointInPolygon(lat, lon, layer_id)`: Deterministic check (e.g., Is HH inside Flood Zone?).
    *   `Intersection(layer_a, layer_b)`: "Show me all Schools in High-Risk Zones".
    *   `Buffer(point, distance_meters)`: "Find clinics within 5km".

## Hazard Mapping Integration
*   **Layers**: The system stores official "Hazard Layers" (Flood, Landslide, Drought) provided by government agencies.
*   **Update**: Layers are versioned and updated via Administrative GIS Upload.

## Use Case Support
*   **UC-09 (Sanitation)**: Map latrines in specific zones.
*   **UC-12 (Disaster Risk)**: Overlay Households on Flood Maps.
*   **UC-40 (Access)**: Distance calculation.
