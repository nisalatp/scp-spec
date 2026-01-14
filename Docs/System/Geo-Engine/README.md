# Geo Engine

## Purpose
The Geo Engine provides the geospatial backbone for the platform. It defines the administrative hierarchy (e.g., Province -> District -> Division -> Village) and manages location data for all entities. It is the core of the "Location-Based Access Control" model.

## Responsibilities
- **Hierarchy Management**: Protecting the tree structure of valid locations.
- **Location Resolution**: "Is Village A inside District B?"
- **Metadata**: Storing centroids and codes.
- **Metrics**: Managing location-based stats (e.g., Risk Index).

## In Scope / Out of Scope
**In Scope**:
- Tenant-configurable levels.
- Parent-child validation.
- Historic changes (Geo Splits/Merges).
- Geo Metrics (Risk, Population).

**Out of Scope**:
- Complex GIS Routing (See `Routing` component).
- Weather forecasting (External).

## Owned Data / Owned Policies
- **Data**: `GeoNode`, `GeoLevel`, `GeoMetric`.
- **Policies**: Geo Access Policy (Who sees what region).

## Dependent Components
- **AuthZ**: Relies on Geo for Scope Resolution.
- **Identity**: Every person is pinned to a GeoNode.
- **Field Ops**: Assignments are Geo-Distributed.

## Exposed Interfaces (APIs / Events)
- `GET /geo/nodes` (List)
- `GET /geo/validate` (Check containment)
- Event: `GeoNodeCreated`, `GeoReorganized`

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Geo Engine)

## Related Use Cases
- **UC-44**: Risk Index Definition.
- **Targeting**: Selecting beneficiaries by District.

## References
- `SPEC/06-platform-core/02-geo-engine.md`
- `SPEC/11-apis/04-geo-api.md`
