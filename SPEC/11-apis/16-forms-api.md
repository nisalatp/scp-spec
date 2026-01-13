# SCP-SPEC-API-16: Forms and Metadata API

## Purpose

This document defines APIs for managing form definitions, versions, and submissions.

## In Scope / Out of Scope

**In Scope**
- Form definitions and lifecycle
- Form versioning
- Form submissions and submission versions

**Out of Scope**
- UI form builder tools
- External workflow engines

## Definitions

- Form: A metadata-defined data collection schema.
- Form Submission: Data captured against a form version and target entity.

## Rules (MUST/SHOULD/MAY)

- Forms MUST be versioned and tied to a scope (tenant, vertical, or program).
- Form submissions MUST reference a fixed form version.
- Verified submissions MUST be immutable; updates MUST create new versions.
- New submission versions MUST reset verification status and require fresh verification.

## API Endpoints

### Form Definitions

- `GET /forms`
  - Input: status (optional), scope_type (optional), vertical_id (optional), program_id (optional)
  - Output: form_id, form_name, form_code, status, version_id
- `POST /forms`
  - Input: form_name, form_code, scope_type, vertical_id (optional), program_id (optional), measurement_type (optional), measurement_scope (optional), measurement_category (optional), fields
  - Output: form_id, status=draft, created_at
- `PATCH /forms/{form_id}`
  - Input: form_name (optional), fields (optional), measurement_type (optional), measurement_scope (optional), measurement_category (optional)
  - Output: form_id, version_id, updated_at
- `GET /forms/{form_id}`
  - Input: none
  - Output: form_id, form_name, form_code, status, version_id, fields

### Form Versions

- `GET /forms/{form_id}/versions`
  - Input: none
  - Output: version_id, published_at, published_by
- `GET /forms/{form_id}/versions/{version_id}`
  - Input: none
  - Output: version_id, fields_snapshot, published_at, published_by

### Form Lifecycle

- `POST /forms/{form_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: form_id, status=requested, requested_at
- `POST /forms/{form_id}/review`
  - Input: review_notes (optional)
  - Output: form_id, status=reviewed, reviewed_at
- `POST /forms/{form_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: form_id, status=approved, approved_at
- `POST /forms/{form_id}/activate`
  - Input: none
  - Output: form_id, status=active, activated_at
- `POST /forms/{form_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: form_id, status=restricted, restricted_at
- `POST /forms/{form_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: form_id, status=suspended, suspended_at
- `POST /forms/{form_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: form_id, status=deprecated, deprecated_at
- `POST /forms/{form_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: form_id, status=archived, archived_at

### Form Submissions

- `POST /forms/{form_id}/submissions`
  - Input: form_version_id, target_type, target_id, data_payload
  - Output: submission_id, status=pending, submitted_at
- `GET /forms/{form_id}/submissions`
  - Input: target_type (optional), target_id (optional), status (optional)
  - Output: submission_id, status, submitted_at, version_id
- `GET /forms/submissions/{submission_id}`
  - Input: none
  - Output: submission_id, form_id, form_version_id, data_payload, verification_status, version_id
- `POST /forms/submissions/{submission_id}/revise`
  - Input: data_payload, change_reason_code, change_reason_text (required if OTHER)
  - Output: submission_id, version_id, verification_status=pending, updated_at
- `POST /forms/submissions/{submission_id}/verify`
  - Input: verification_status, verified_by, verified_at
  - Output: submission_id, verification_status, verified_at

## Edge Cases

- Form deprecated while submissions are in progress.
- Submissions referencing inactive form versions.

## Audit & Logs

- Form definition changes MUST be logged.
- Submission creation, revision, and verification MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/09-forms-metadata-model.md
- SPEC/06-platform-core/06-form-builder.md
