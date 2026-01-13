# SCP-SPEC-API-05: Person and Household API

## Purpose

This document defines APIs for managing persons and households.

## In Scope / Out of Scope

**In Scope**
- Person registry access
- Household management

**Out of Scope**
- Biometric verification APIs

## Definitions

- Person: Individual registered in SCP.
- Household: Group of persons.

## Rules (MUST/SHOULD/MAY)

- Person APIs MUST enforce consent and masking.
- National IDs MUST be unique per tenant.
- Household relationships MUST use base relationships only.
- Deletion MUST be replaced by archival.
- Bulk person imports MUST be supported.
- Consent capture MUST reject provisional persons.
- Consent version history MUST be restricted to ROOT and tenant admins.
- Rejected consents MUST be re-captured via `POST /persons/{person_id}/consents`; `renew` MUST NOT be used for rejected consents.
- Geo-radius searches MUST respect tenant, vertical, consent, and masking rules.

## API Endpoints

### Persons

- `POST /persons`
  - Input: full_name, date_of_birth or age_estimate, gender, identity_type (optional), identity_number (optional), contacts (optional), household_id (optional)
  - Output: person_id, system_guid, verification_status, created_at
- `PATCH /persons/{person_id}`
  - Input: updatable person fields (excluding system_guid)
  - Output: person_id, updated_at, version_id
- `POST /persons/{person_id}/verify`
  - Input: verification_status, verified_by, verified_at
  - Output: person_id, verification_status, verified_at
- `POST /persons/{person_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: person_id, status=archived, archived_at
- `POST /persons/{person_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: person_id, status=active

### Households

- `POST /households`
  - Input: household_name, leader_id, geo_id, address, status, geo_lat (optional), geo_lon (optional), geo_accuracy (optional), geo_captured_at (optional)
  - Output: household_id, status, created_at
- `PATCH /households/{household_id}`
  - Input: updatable household fields, geo_lat (optional), geo_lon (optional), geo_accuracy (optional), geo_captured_at (optional)
  - Output: household_id, updated_at, version_id
- `POST /households/{household_id}/members`
  - Input: person_id, relationship_type, effective_from, effective_until (optional), verification_status
  - Output: membership_id, household_id, person_id
- `POST /households/{household_id}/members/{person_id}/end`
  - Input: effective_until, reason_code
  - Output: membership_id, effective_until
- `POST /households/{household_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: household_id, status=archived, archived_at
- `POST /households/{household_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: household_id, status=active

### Search and Targeting

- `GET /persons/search`
  - Input: criteria_id (optional), criteria_value (optional), geo_id (optional), lat (optional), lon (optional), radius_km (optional), status (optional)
  - Output: person_id, matched_fields, distance_km (optional)
- `GET /households/search`
  - Input: geo_id (optional), lat (optional), lon (optional), radius_km (optional), status (optional)
  - Output: household_id, matched_fields, distance_km (optional)

### Family Relationships

- `POST /relationships`
  - Input: person_id, related_person_id, relationship_type, effective_from, effective_until (optional), verification_status
  - Output: relationship_id, status
- `PATCH /relationships/{relationship_id}`
  - Input: effective_until, verification_status, reason_code
  - Output: relationship_id, updated_at
- `POST /relationships/{relationship_id}/end`
  - Input: effective_until, reason_code
  - Output: relationship_id, effective_until

### Consents (Registration Capture)

- `POST /persons/{person_id}/consents`
  - Input: vertical_id, active_from, active_until (optional), capture_mode (online or offline), evidence_attachment_ids, verification_document_attachment_id, captured_by
  - Output: consent_id, status (pending or active), active_from, active_until, grace_until, version_id
- `GET /persons/{person_id}/consents`
  - Input: vertical_id (optional), status (optional)
  - Output: consent_id, vertical_id, status, active_from, active_until, grace_until
- `GET /consents/{consent_id}`
  - Input: none
  - Output: consent_id, person_id, vertical_id, status, active_from, active_until, grace_until, version_id
- `POST /consents/{consent_id}/verify`
  - Input: verified_by, verified_at
  - Output: consent_id, status=active, verified_at
- `POST /consents/{consent_id}/reject`
  - Input: reason_code, reason_text (required if OTHER), rejected_by, rejected_at
  - Output: consent_id, status=rejected, rejected_at
- `POST /consents/{consent_id}/withdraw`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: consent_id, status=withdrawn, effective_at
- `POST /consents/{consent_id}/renew`
  - Input: active_from, active_until (optional), capture_mode (online or offline), evidence_attachment_ids, verification_document_attachment_id, captured_by
  - Output: consent_id, status (pending or active), active_from, active_until, grace_until, version_id
- `POST /consents/{consent_id}/expire`
  - Input: system_reason (optional)
  - Output: consent_id, status=expired, expired_at, grace_until
- `GET /consents/{consent_id}/evidence`
  - Input: none
  - Output: evidence_attachment_ids, verification_document_attachment_id (masked by default)

### Consent Versions

- `GET /consents/{consent_id}/versions`
  - Input: none
  - Output: version_id, status, active_from, active_until, captured_at, reason_code (optional)
- `GET /consents/{consent_id}/versions/{version_id}`
  - Input: none
  - Output: consent_id, version_id, status, active_from, active_until, grace_until, capture_mode, evidence_attachment_ids, verification_document_attachment_id, captured_by, captured_at, reason_code (optional), reason_text (optional)

## Edge Cases

- Duplicate person detection.
- Household membership changes.

## Audit & Logs

- Person and household API calls MUST be logged.
- Identity changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/03-person-registry.md
- SPEC/06-platform-core/04-household-family.md
