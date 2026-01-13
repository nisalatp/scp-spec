# SCP-SPEC-API-24: Infrastructure Project API

## Purpose

This document defines APIs for managing infrastructure projects and their geo scope.

## In Scope / Out of Scope

**In Scope**
- Project registration and lifecycle
- Geo scoping for projects

**Out of Scope**
- Procurement and contractor systems
- Detailed project worklogs

## Definitions

- Infrastructure Project: A registered project with defined scope and status.

## Rules (MUST/SHOULD/MAY)

- Infrastructure APIs MUST enforce tenant isolation.
- Project lifecycle MUST follow the standard governance lifecycle.
- Projects MUST be linked to one or more geo nodes.

## API Endpoints

### Projects

- `GET /infrastructure/projects`
  - Input: status (optional), project_type (optional), geo_id (optional), vertical_id (optional)
  - Output: project_id, project_name, project_type, status, active_from, active_until
- `POST /infrastructure/projects`
  - Input: project_name, project_type, primary_vertical_id (optional), status, active_from, active_until (optional), sponsor_org (optional)
  - Output: project_id, status=draft, created_at
- `PATCH /infrastructure/projects/{project_id}`
  - Input: project_name (optional), project_type (optional), active_until (optional), sponsor_org (optional)
  - Output: project_id, updated_at, version_id
- `GET /infrastructure/projects/{project_id}`
  - Input: none
  - Output: project details, geo_scope, status
- `POST /infrastructure/projects/{project_id}/activate`
  - Input: none
  - Output: project_id, status=active, activated_at
- `POST /infrastructure/projects/{project_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: project_id, status=restricted, restricted_at
- `POST /infrastructure/projects/{project_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: project_id, status=suspended, suspended_at
- `POST /infrastructure/projects/{project_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: project_id, status=deprecated, deprecated_at
- `POST /infrastructure/projects/{project_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: project_id, status=archived, archived_at

### Project Geo Scope

- `POST /infrastructure/projects/{project_id}/geos`
  - Input: geo_id
  - Output: project_id, geo_id
- `POST /infrastructure/projects/{project_id}/geos/{geo_id}/remove`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: project_id, geo_id, removed_at

## Edge Cases

- Project overlaps across multiple verticals.
- Project archived while active cases reference it.

## Audit & Logs

- Project changes MUST be logged.
- Geo scope updates MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/12-infrastructure-project-registry.md
