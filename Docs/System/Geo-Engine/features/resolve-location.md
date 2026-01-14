# Resolve Location

## Description
Determining "Where is this coordinate?" or "Is Village X inside District Y?". Used by the system for Access Control and Assignment.

## Component
Geo Engine

## Actors / Roles
- **System** (Automated)
- **Field Agent** (via Maps UI)

## Permissions
- `geo.view`

## Scope Rules
- Public (Internal System Use).

## Main Flow
1.  **Input**: Lat/Lon (6.9271, 79.8612).
2.  **System**: Performs Point-in-Polygon check against Geo Boundaries.
3.  **System**: Returns `GeoNodeID` (e.g., "Colombo Fort").

## Alternate / Error Flows
- **No Boundary Data**: Falls back to "Nearest Centroid" radius check (with warning).

## Data Read / Written
- **GeoNode**: Read.

## Audit & Compliance
- **Accuracy**: Incorrect resolution leads to security leaks (wrong supervisor seeing data).

## Related Use Cases
- UC-05: Household Enrollment (Auto-assign District)

## References
- `SPEC/06-platform-core/02-geo-engine.md`
