# SCP-SPEC-API-04: Geo API

## Purpose

This document defines APIs for managing and querying geo hierarchies.

## In Scope / Out of Scope

**In Scope**
- Geo node CRUD
- Geo hierarchy queries

**Out of Scope**
- GIS mapping services

## Definitions

- Geo Node: Administrative or community unit.

## Rules (MUST/SHOULD/MAY)

- Geo APIs MUST enforce tenant isolation.
- Geo changes MUST follow governance workflows.
- Geo inheritance MUST be preserved.
- Geo queries SHOULD support hierarchy traversal.
- Temporal geo versions MUST be supported.

## API Endpoints

- `POST /geo/levels`
  - Input: level_type, display_name, order_index
  - Output: level_id, level_type, created_at
- `GET /geo/levels`
  - Output: list of level definitions

- `POST /geo/nodes`
  - Input: geo_name, geo_code, level_type, parent_geo_id (optional), status, effective_from, effective_until (optional), dispute_status (optional), centroid_lat (optional), centroid_lon (optional), boundary_ref (optional)
  - Output: geo_id, status, created_at
- `PATCH /geo/nodes/{geo_id}`
  - Input: geo_name, geo_code, status, effective_from, effective_until, dispute_status, centroid_lat (optional), centroid_lon (optional), boundary_ref (optional)
  - Output: geo_id, updated_at, version_id
- `GET /geo/nodes/{geo_id}`
  - Output: geo node details, parent, children_summary
- `GET /geo/nodes?parent_geo_id=...`
  - Output: list of child nodes
- `GET /geo/nodes/nearby`
  - Input: lat, lon, radius_km, level_type (optional)
  - Output: list of geo nodes within radius, distance_km
- `POST /geo/nodes/{geo_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: geo_id, status=archived, archived_at
- `POST /geo/nodes/{geo_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: geo_id, status=active

## Edge Cases

- Geo reorganization.
- Circular hierarchy prevention.

## Audit & Logs

- Geo API calls MUST be logged.
- Geo structure changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/02-geo-engine.md
- SPEC/05-governance/04-policy-change-control.md
