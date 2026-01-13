# SCP-SPEC-API-20: Marketplace Access API

## Purpose

This document defines APIs for external marketplace access requests and grants.

## In Scope / Out of Scope

**In Scope**
- Access requests
- Approval workflows
- Time-bound access grants

**Out of Scope**
- Commercial marketplaces
- Automated data resale

## Definitions

- Access Request: Request from an external organization for governed access.
- Access Grant: Approved, time-bound access permission.

## Rules (MUST/SHOULD/MAY)

- Access requests MUST require umbrella approval.
- Access grants MUST be time-bound by default.
- Revocation MUST be immediate.

## API Endpoints

### Access Requests

- `POST /marketplace/access-requests`
  - Input: organization_name, request_purpose, vertical_ids, program_ids (optional)
  - Output: access_request_id, status=requested, requested_at
- `GET /marketplace/access-requests`
  - Input: status (optional)
  - Output: access_request_id, organization_name, status, requested_at
- `GET /marketplace/access-requests/{access_request_id}`
  - Input: none
  - Output: access_request details, status
- `POST /marketplace/access-requests/{access_request_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER), active_from, active_until
  - Output: access_request_id, status=approved, approved_at, access_grant_id, grant_status=active
- `POST /marketplace/access-requests/{access_request_id}/reject`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: access_request_id, status=rejected, rejected_at

### Access Grants

- `GET /marketplace/access-grants`
  - Input: status (optional)
  - Output: access_grant_id, access_request_id, status, active_from, active_until
- `GET /marketplace/access-grants/{access_grant_id}`
  - Input: none
  - Output: access_grant details, status
- `POST /marketplace/access-grants/{access_grant_id}/revoke`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: access_grant_id, status=revoked, revoked_at

## Edge Cases

- Emergency access requests.
- Overlapping access grants.

## Audit & Logs

- Access requests and grants MUST be logged.
- Revocations MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/12-marketplace-access-model.md
- SPEC/05-governance/02-umbrella-authority-model.md
