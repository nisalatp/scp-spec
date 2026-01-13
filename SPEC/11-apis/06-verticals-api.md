# SCP-SPEC-API-06: Verticals API

## Purpose

This document defines APIs for managing system and custom verticals.

## In Scope / Out of Scope

**In Scope**
- Vertical listing and metadata
- Vertical lifecycle operations

**Out of Scope**
- Vertical-specific business logic

## Definitions

- Vertical: Interest-based governance boundary.

## Rules (MUST/SHOULD/MAY)

- System verticals MUST be immutable.
- Custom vertical creation MUST require approval.
- Vertical APIs MUST enforce governance rules.
- Vertical state transitions MUST be logged.
- Vertical aliases MUST be supported.
- Vertical aliases MUST be unique per tenant.

## API Endpoints

- `GET /verticals`
  - Input: status (optional), type (system or custom, optional)
  - Output: vertical_id, vertical_name, vertical_code, type, status, aliases
- `POST /verticals`
  - Input: vertical_name, vertical_code, description, owner_id, consent_text, kpi_definitions, policy_pack_id (optional), aliases (optional)
  - Output: vertical_id, status=draft, created_at
- `PATCH /verticals/{vertical_id}`
  - Input: vertical_name (optional), description (optional), consent_text (optional), kpi_definitions (optional), aliases (optional)
  - Output: vertical_id, version_id, updated_at
- `POST /verticals/{vertical_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: vertical_id, status=requested, requested_at
- `POST /verticals/{vertical_id}/review`
  - Input: review_notes (optional)
  - Output: vertical_id, status=reviewed, reviewed_at
- `POST /verticals/{vertical_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: vertical_id, status=approved, approved_at
- `POST /verticals/{vertical_id}/activate`
  - Input: none
  - Output: vertical_id, status=active, activated_at
- `POST /verticals/{vertical_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: vertical_id, status=restricted, restricted_at
- `POST /verticals/{vertical_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: vertical_id, status=suspended, suspended_at
- `POST /verticals/{vertical_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: vertical_id, status=deprecated, deprecated_at
- `POST /verticals/{vertical_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: vertical_id, status=archived, archived_at
- `POST /verticals/{vertical_id}/aliases`
  - Input: alias
  - Output: vertical_id, aliases
- `POST /verticals/{vertical_id}/policy-pack`
  - Input: policy_pack_id
  - Output: vertical_id, policy_pack_id, updated_at

## Edge Cases

- Vertical restriction during active cases.
- Conflicting vertical metadata updates.

## Audit & Logs

- Vertical API calls MUST be logged.
- Approval actions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/07-verticals/01-system-verticals.md
- SPEC/05-governance/03-vertical-governance.md
