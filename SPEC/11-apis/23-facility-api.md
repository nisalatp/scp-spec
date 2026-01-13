# SCP-SPEC-API-23: Facility API

## Purpose

This document defines APIs for managing facilities and facility services.

## In Scope / Out of Scope

**In Scope**
- Facility registration and lifecycle
- Facility service tagging
- Distance-based facility lookup

**Out of Scope**
- Facility operations and scheduling
- Asset management

## Definitions

- Facility: A registered service location.
- Facility Service: A tagged service offered by a facility.

## Rules (MUST/SHOULD/MAY)

- Facility APIs MUST enforce tenant isolation.
- Facility lifecycle MUST follow the standard governance lifecycle.
- Facilities MUST be linked to geo nodes and SHOULD include coordinates when available.
- Distance lookups MUST respect tenant and authorization scopes.

## API Endpoints

### Facilities

- `GET /facilities`
  - Input: status (optional), facility_type (optional), geo_id (optional), vertical_id (optional)
  - Output: facility_id, facility_name, facility_type, status, geo_id
- `POST /facilities`
  - Input: facility_name, facility_type, geo_id, address (optional), status, active_from, active_until (optional), geo_lat (optional), geo_lon (optional)
  - Output: facility_id, status=draft, created_at
- `PATCH /facilities/{facility_id}`
  - Input: facility_name (optional), facility_type (optional), geo_id (optional), address (optional), active_until (optional), geo_lat (optional), geo_lon (optional)
  - Output: facility_id, updated_at, version_id
- `GET /facilities/{facility_id}`
  - Input: none
  - Output: facility details, services, geo reference
- `POST /facilities/{facility_id}/activate`
  - Input: none
  - Output: facility_id, status=active, activated_at
- `POST /facilities/{facility_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: facility_id, status=restricted, restricted_at
- `POST /facilities/{facility_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: facility_id, status=suspended, suspended_at
- `POST /facilities/{facility_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: facility_id, status=deprecated, deprecated_at
- `POST /facilities/{facility_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: facility_id, status=archived, archived_at

### Facility Services

- `POST /facilities/{facility_id}/services`
  - Input: service_code, service_name, vertical_id (optional), status
  - Output: facility_id, service_code, status
- `PATCH /facilities/{facility_id}/services/{service_code}`
  - Input: service_name (optional), status (optional)
  - Output: facility_id, service_code, updated_at

### Nearby Facilities

- `GET /facilities/nearby`
  - Input: lat, lon, radius_km, facility_type (optional), service_code (optional)
  - Output: facility_id, facility_name, distance_km, facility_type

## Edge Cases

- Facility without coordinates.
- Facility deprecation during active program.

## Audit & Logs

- Facility changes MUST be logged.
- Service tagging MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/11-facility-registry.md
- SPEC/06-platform-core/02-geo-engine.md
