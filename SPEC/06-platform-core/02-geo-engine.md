# SCP-SPEC-CORE-02: Geo Engine

## Purpose

This document defines the geo hierarchy engine used to model administrative and community geographies.

## In Scope / Out of Scope

**In Scope**
- Configurable geo hierarchies
- Geo inheritance rules
- Geo scoping for access
- Geo centroids and optional boundary geometry for distance-based queries
- Geo metrics datasets for per-area indicators

**Out of Scope**
- GIS mapping and visualization

## Definitions

- Geo Node: A unit in the geographic hierarchy.
- Geo Hierarchy: Ordered parent-child geo structure.
- Geo Centroid: Latitude and longitude representing a geo node's center point.
- Geo Boundary: Optional polygon or geometry representing a geo node's boundary.
- Geo Metric: A named indicator measured at a geo node (e.g., job density, climate risk).
- Geo Metric Value: A time-bound value for a geo metric at a geo node.

## Rules (MUST/SHOULD/MAY)

- Geo hierarchies MUST be tenant-configurable.
- Geo levels MUST be fully tenant-defined with no hard-coded system levels.
- Geo nodes MUST support inheritance.
- Geo scoping MUST be enforced in authorization.
- Geo structures MAY differ between tenants.
- Geo changes MUST trigger automatic re-evaluation of case assignments and access scopes.
- Cases found out of scope after re-evaluation MUST be flagged for manual review.
- Cases flagged due to geo re-evaluation MUST be auto-suspended until manual review completes.
- Geo changes MUST trigger re-evaluation of donor access scopes.
- Donor access scopes found invalid after re-evaluation MUST be revoked immediately.
- Temporal geo boundaries MUST be supported.
- Disputed regions MUST be represented as separate geo nodes with tenant-defined dispute status.
- Geo nodes SHOULD store centroid coordinates using WGS84 (latitude, longitude).
- Geo node boundaries MAY be stored as GeoJSON or a geometry reference when required.
- Radius-based queries MUST be supported using geo centroids or precise household coordinates when available.
- If geospatial coordinates are missing, radius queries MUST fall back to geo hierarchy rules and return a warning.
- Geo metrics MUST be tenant-scoped and time-bound.
- Geo metric definitions MUST include unit, data_type, and source classification.
- Geo metric values MUST reference a geo node, a metric definition, and a value date.

## Geo Creation Workflow

1. Define the tenant geo hierarchy levels (single-level flat or multi-level).
2. Create root or top-level geo nodes.
3. Create child geo nodes with parent references as required.
4. Assign geo metadata (name, code, level, status, effective dates).
5. Verify and activate geo nodes.
6. Record all changes and trigger re-evaluation of cases, access scopes, and donor scopes.

## Minimum Required Fields

These are the minimum required fields for geo node creation at the platform core level. Tenants MAY add additional metadata.

- geo_id (system GUID)
- tenant_id
- geo_name
- geo_code (unique within tenant)
- level_type (tenant-defined)
- parent_geo_id (nullable for root)
- status (draft, active, restricted, archived)
- effective_from
- effective_until (nullable)
- dispute_status (optional)
- centroid_lat (optional)
- centroid_lon (optional)
- boundary_ref (optional)

**Geo Metric Definition**
- metric_id (system GUID)
- tenant_id
- metric_code (unique per tenant)
- metric_name
- unit
- data_type (number, percentage, boolean, string)
- source_type (internal, external)
- status (draft, active, deprecated, archived)

**Geo Metric Value**
- metric_value_id (system GUID)
- metric_id
- geo_id
- value
- value_date
- source_ref (optional)
- status (active, corrected, archived)

## Edge Cases

- Reorganization of administrative boundaries.
- Overlapping community definitions.
- Missing or stale geo coordinates.

## Audit & Logs

- Geo changes MUST be logged.
- Historical geo mappings MUST be preserved.

## Open Questions

- None.

## References

- SPEC/04-security/08-deny-and-inheritance.md
- SPEC/03-domain/02-entity-catalog.md
- SPEC/11-apis/04-geo-api.md
- SPEC/11-apis/25-geo-metrics-api.md
