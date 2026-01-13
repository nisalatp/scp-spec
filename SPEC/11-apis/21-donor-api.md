# SCP-SPEC-API-21: Donor API

## Purpose

This document defines APIs for managing donors and their read-only access grants.

## In Scope / Out of Scope

**In Scope**
- Donor registration and lifecycle
- Donor program linkage
- Donor access grants (read-only)

**Out of Scope**
- Payment processing
- Donor CRM features

## Definitions

- Donor: Organization or individual providing resources.
- Donor Access Grant: Time-bound read-only access to program or vertical data.

## Rules (MUST/SHOULD/MAY)

- Donors MUST have read-only access by default.
- Donor visibility MUST be scoped by program and vertical.
- Donor APIs MUST NOT return identifiable personal data.

## API Endpoints

### Donors

- `GET /donors`
  - Input: status (optional)
  - Output: donor_id, donor_name, donor_type, status
- `POST /donors`
  - Input: donor_name, donor_type, anonymous (optional)
  - Output: donor_id, status=draft, created_at
- `PATCH /donors/{donor_id}`
  - Input: donor_name (optional), anonymous (optional)
  - Output: donor_id, updated_at
- `POST /donors/{donor_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: donor_id, status=active, approved_at
- `POST /donors/{donor_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: donor_id, status=suspended, suspended_at
- `POST /donors/{donor_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: donor_id, status=archived, archived_at

### Donor Program Links

- `POST /donors/{donor_id}/programs`
  - Input: program_id, vertical_id
  - Output: donor_id, program_id, status=active
- `POST /donors/{donor_id}/programs/{program_id}/end`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: donor_id, program_id, status=ended

### Access Grants (Read-Only)

- `POST /donors/{donor_id}/access-grants`
  - Input: vertical_id, program_id (optional), active_from, active_until
  - Output: donor_id, access_grant_id, status=active
- `GET /donors/{donor_id}/access-grants`
  - Input: status (optional)
  - Output: access_grant_id, vertical_id, program_id, active_from, active_until, status
- `POST /donors/{donor_id}/access-grants/{access_grant_id}/revoke`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: access_grant_id, status=revoked, revoked_at
- `POST /donors/{donor_id}/access-grants/{access_grant_id}/expire`
  - Input: system_reason (optional)
  - Output: access_grant_id, status=expired, expired_at
- `POST /donors/{donor_id}/access-grants/{access_grant_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: access_grant_id, status=archived, archived_at

## Edge Cases

- Donor access revoked mid-program.

## Audit & Logs

- Donor access grants MUST be logged.

## Open Questions

- None.

## References

- SPEC/03-domain/07-donor-model.md
- SPEC/08-operations/03-donor-operations.md
