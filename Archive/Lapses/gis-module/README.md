# Lapse: GIS Module [RESOLVED]

**Missing Capability**: Advanced Geospatial Operations (Overlay, Distance, Spatial Join).

## Evidence
*   **Use Cases**: UC-09, UC-10, UC-12, UC-26, UC-30, UC-34, UC-37, UC-43.
*   **Spec Gap**: `SPEC/06-platform-core` mentions "Geo-Validation" but lacks a full GIS Engine for complex overlays (e.g., "Intersect Flood Zone Poly with Household Point").

## Impact
*   **Severity**: **Critical** for Environmental and Housing verticals.
*   **Blocker**: Cannot perform "Risk Mapping" (UC-12) or "Sanitation Gap Analysis" (UC-09).

## Proposed Changes
1.  **New Service**: `GIS Service` (PostGIS based).
2.  **API**: `POST /api/gis/overlay` (Layers -> Intersection).
3.  **Data**: Store official "Hazard Maps" (Floods, Landslides) as layers.
