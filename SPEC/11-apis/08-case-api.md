# SCP-SPEC-API-08: Case API

## Purpose

This document defines APIs for managing cases and interventions.

## In Scope / Out of Scope

**In Scope**
- Case creation and updates
- Case lifecycle management

**Out of Scope**
- External case management systems

## Definitions

- Case: Intervention instance.

## Rules (MUST/SHOULD/MAY)

- Cases MUST follow defined lifecycle.
- Each case MUST have one primary vertical.
- Consent MUST be enforced per vertical.
- Case creation MUST require a verified subject record and valid consent for the primary vertical.
- Case transitions MUST be validated.
- Bulk case operations MUST NOT be required.
- Duplicate support checks MUST be supported and recorded as conflicts.

## API Endpoints

### Cases

- `GET /cases`
  - Input: status (optional), primary_vertical_id (optional), program_id (optional), geo_id (optional), subject_id (optional)
  - Output: case_id, status, primary_vertical_id, subject_type, subject_id, updated_at
- `POST /cases`
  - Input: subject_type (person or household), subject_id, primary_vertical_id, participant_vertical_ids (optional), program_id (optional), geo_scope_ids (optional), active_from (optional), active_until (optional)
  - Output: case_id, status=draft, created_at
- `PATCH /cases/{case_id}`
  - Input: program_id (optional), geo_scope_ids (optional), active_until (optional)
  - Output: case_id, version_id, updated_at
- `GET /cases/{case_id}`
  - Input: none
  - Output: case details, verticals, program, geo_scope, status, status_reason

### Lifecycle Transitions

- `POST /cases/{case_id}/submit`
  - Input: submission_notes (optional)
  - Output: case_id, status=submitted, submitted_at
- `POST /cases/{case_id}/verify`
  - Input: verified_by, verified_at
  - Output: case_id, status=verified, verified_at
- `POST /cases/{case_id}/activate`
  - Input: active_from (optional), active_until (optional)
  - Output: case_id, status=active, activated_at
- `POST /cases/{case_id}/suspend`
  - Input: suspension_reason, reason_text (required if OTHER)
  - Output: case_id, status=suspended, suspended_at
- `POST /cases/{case_id}/resume`
  - Input: reason_code (optional)
  - Output: case_id, status=prior_status, resumed_at
- `POST /cases/{case_id}/stabilize`
  - Input: stabilization_notes (optional)
  - Output: case_id, status=stabilized, stabilized_at
- `POST /cases/{case_id}/close`
  - Input: closure_reason, closure_notes (optional)
  - Output: case_id, status=closed, closed_at
- `POST /cases/{case_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: case_id, status=archived, archived_at
- `POST /cases/{case_id}/reopen`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: case_id, status=reopened, reopened_at

### Participant Verticals

- `POST /cases/{case_id}/participants`
  - Input: vertical_id
  - Output: case_id, vertical_id, status=pending_opt_in
- `POST /cases/{case_id}/participants/{vertical_id}/opt-in`
  - Input: consent_confirmation_id (optional)
  - Output: case_id, vertical_id, status=opted_in
- `POST /cases/{case_id}/participants/{vertical_id}/remove`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: case_id, vertical_id, status=removed

### Ownership and Structure

- `POST /cases/{case_id}/transfer-owner`
  - Input: new_primary_vertical_id, reason_code, approval_id (optional)
  - Output: case_id, primary_vertical_id, transferred_at
- `POST /cases/merge`
  - Input: primary_case_id, merge_case_ids, reason_code, reason_text (required if OTHER)
  - Output: case_id, merged_case_ids, merged_at
- `POST /cases/{case_id}/split`
  - Input: split_definition, reason_code, reason_text (required if OTHER)
  - Output: source_case_id, new_case_ids, split_at

### Assignments

- `POST /cases/{case_id}/assignments`
  - Input: user_id, assigned_role (optional), effective_from, effective_until (optional)
  - Output: assignment_id, case_id, user_id
- `POST /cases/{case_id}/assignments/{assignment_id}/end`
  - Input: effective_until, reason_code
  - Output: assignment_id, effective_until

### Conflicts (Duplicate Support)

- `POST /cases/{case_id}/conflicts/duplicate-check`
  - Input: scope (primary_vertical_only or all_verticals), reason_code (optional)
  - Output: conflict_id (optional), status (clear or flagged), checked_at
- `GET /cases/conflicts`
  - Input: status (optional), subject_type (optional), subject_id (optional)
  - Output: conflict_id, conflict_type, status, primary_case_id, related_case_ids
- `POST /cases/conflicts/{conflict_id}/resolve`
  - Input: resolution_code, resolution_notes (optional)
  - Output: conflict_id, status=resolved, resolved_at
- `POST /cases/conflicts/{conflict_id}/dismiss`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: conflict_id, status=dismissed, dismissed_at

## Edge Cases

- Partial updates across verticals.
- Case reopened after closure.

## Audit & Logs

- Case API calls MUST be logged.
- Lifecycle transitions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/05-case-intervention-model.md
- SPEC/04-security/09-consent-and-data-sharing.md
