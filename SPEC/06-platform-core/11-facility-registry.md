# SCP-SPEC-CORE-11: Facility Registry

## Purpose

This document defines the facility registry used to catalog service locations (health facilities, schools, transport hubs, shelters) required for distance and access analysis.

## In Scope / Out of Scope

**In Scope**
- Facility registration and lifecycle
- Geo linkage and coordinates
- Service capability tagging

**Out of Scope**
- Facility operations management
- Clinical or education system details

## Definitions

- Facility: A service location registered in SCP.
- Facility Service: A tagged capability or service offered by a facility.

## Rules (MUST/SHOULD/MAY)

- Facilities MUST be tenant-scoped.
- Facilities MUST be linked to a geo node and SHOULD include coordinates when available.
- Facility lifecycle MUST follow:
  Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
- Facilities MAY be tagged to one or more verticals for access control.
- Facility services MUST be versioned and auditable.
- Distance queries MUST use facility coordinates when present.

## Facility Lifecycle Workflow

1. Facility is created in Draft by a tenant admin or vertical owner.
2. Facility is submitted for review (Requested).
3. Review completes (Reviewed), then umbrella approval (Approved).
4. Approved facilities are activated (Active).
5. Facilities MAY be restricted, suspended, deprecated, or archived by governance.

## Minimum Required Fields

**Facility**
- facility_id (system GUID)
- tenant_id
- facility_name
- facility_type (health, education, transport, shelter, other)
- primary_geo_id
- status
- active_from
- active_until (nullable)
- address (optional)
- geo_lat (optional)
- geo_lon (optional)

**Facility Service**
- facility_id
- service_code
- service_name
- vertical_id (optional)
- status

## Edge Cases

- Facilities without coordinates.
- Services offered temporarily or seasonally.

## Audit & Logs

- Facility creation, updates, and status changes MUST be logged.
- Service tagging changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/02-geo-engine.md
- SPEC/11-apis/23-facility-api.md
