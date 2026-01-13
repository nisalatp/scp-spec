# SCP-SPEC-API-07: Program API

## Purpose

This document defines APIs for managing programs.

## In Scope / Out of Scope

**In Scope**
- Program CRUD
- Program lifecycle transitions

**Out of Scope**
- Program execution workflows

## Definitions

- Program: Governed initiative.

## Rules (MUST/SHOULD/MAY)

- Program activation MUST require approval.
- Programs MAY belong to multiple verticals, with one primary vertical designated.
- Program APIs MUST enforce vertical scoping.
- Program state changes MUST be auditable.
- Programs MUST support cloning across tenants with governance approval.
- Program ownership transfers MUST require umbrella approval.

## API Endpoints

- `GET /programs`
  - Input: status (optional), vertical_id (optional), geo_id (optional)
  - Output: program_id, program_name, program_code, status, primary_vertical_id
- `POST /programs`
  - Input: program_name, program_code, primary_vertical_id, participant_vertical_ids (optional), owner_id, active_from (optional), active_until (optional), eligibility_definition (optional), kpi_definitions (optional), geo_scope_ids (optional)
  - Output: program_id, status=draft, created_at
- `PATCH /programs/{program_id}`
  - Input: program_name (optional), participant_vertical_ids (optional), active_from (optional), active_until (optional), eligibility_definition (optional), kpi_definitions (optional), geo_scope_ids (optional)
  - Output: program_id, version_id, updated_at
- `GET /programs/{program_id}`
  - Input: none
  - Output: program details, verticals, geo_scope, status

### Approval and Lifecycle

- `POST /programs/{program_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: program_id, status=requested, requested_at
- `POST /programs/{program_id}/review`
  - Input: review_notes (optional)
  - Output: program_id, status=reviewed, reviewed_at
- `POST /programs/{program_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: program_id, status=approved, approved_at
- `POST /programs/{program_id}/activate`
  - Input: active_from, active_until (optional)
  - Output: program_id, status=active, activated_at
- `POST /programs/{program_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: program_id, status=restricted, restricted_at
- `POST /programs/{program_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: program_id, status=suspended, suspended_at
- `POST /programs/{program_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: program_id, status=deprecated, deprecated_at
- `POST /programs/{program_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: program_id, status=archived, archived_at

### Governance Operations

- `POST /programs/{program_id}/clone`
  - Input: target_tenant_id, new_program_code, new_program_name (optional)
  - Output: program_id, status=draft, created_at
- `POST /programs/{program_id}/transfer-owner`
  - Input: new_owner_id, approval_reason_code, approval_reason_text (required if OTHER)
  - Output: program_id, owner_id, updated_at

## Edge Cases

- Program modification during execution.
- Program ownership transfer.

## Audit & Logs

- Program API calls MUST be logged.
- Approval decisions MUST be traceable.

## Open Questions

- None.

## References

- SPEC/03-domain/04-program-model.md
- SPEC/05-governance/02-umbrella-authority-model.md
