# SCP-SPEC-API-15: Community Center API

## Purpose

This document defines APIs for registering and managing community centers in SCP.

## In Scope / Out of Scope

**In Scope**
- Community center creation and updates
- Geo linkage and governance metadata
- Verification and archival workflows

**Out of Scope**
- Facility management systems
- Booking or scheduling systems

## Definitions

- Community Center: A physical or logical community hub within a tenant.

## Rules (MUST/SHOULD/MAY)

- Community center APIs MUST enforce tenant isolation.
- Centers MUST be linked to at least one geo node.
- Active From and Active Until MUST be supported.
- Deletion MUST be replaced by archival.

## API Endpoints

- `POST /community-centers`
  - Input: center_name, center_type, owner_id, geo_node_ids, address (optional), primary_contact (optional), active_from, active_until (optional), verification_status (optional)
  - Output: center_id, status, created_at
- `PATCH /community-centers/{center_id}`
  - Input: center_name (optional), center_type (optional), owner_id (optional), geo_node_ids (optional), address (optional), primary_contact (optional), active_until (optional)
  - Output: center_id, updated_at
- `GET /community-centers/{center_id}`
  - Input: none
  - Output: center_id, center_name, center_type, owner_id, geo_node_ids, address, primary_contact, status, active_from, active_until, verification_status
- `GET /community-centers`
  - Input: geo_id (optional), status (optional)
  - Output: center_id, center_name, status, geo_node_ids
- `POST /community-centers/{center_id}/verticals`
  - Input: vertical_ids
  - Output: center_id, vertical_ids
- `POST /community-centers/{center_id}/verify`
  - Input: verification_status, verified_by, verified_at
  - Output: center_id, verification_status, verified_at
- `POST /community-centers/{center_id}/activate`
  - Input: active_from (optional), active_until (optional)
  - Output: center_id, status=active, activated_at
- `POST /community-centers/{center_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: center_id, status=restricted, restricted_at
- `POST /community-centers/{center_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: center_id, status=archived, archived_at
- `POST /community-centers/{center_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: center_id, status=active

## Edge Cases

- Centers serving multiple communities.
- Centers changing affiliation.

## Audit & Logs

- Community center API calls MUST be logged.
- Verification and archival actions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/05-community-center-registry.md
- SPEC/06-platform-core/02-geo-engine.md
