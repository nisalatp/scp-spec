# SCP-SPEC-API-22: Communications API

## Purpose

This document defines APIs for creating and executing communications and emergency broadcasts.

## In Scope / Out of Scope

**In Scope**
- Broadcast creation and approval
- Emergency broadcast execution
- Delivery run tracking

**Out of Scope**
- Message template editor UI
- Inbound message ingestion

## Definitions

- Broadcast: A targeted outbound communication to a selected audience.
- Emergency Broadcast: A time-sensitive broadcast that may use emergency override consent mode if configured.

## Rules (MUST/SHOULD/MAY)

- Communications APIs MUST enforce tenant isolation and vertical scoping.
- Broadcasts MUST define a target filter (geo radius and/or criteria).
- Emergency broadcasts MUST require a reason code and authorized role.
- Emergency override consent MUST only be used if enabled in tenant configuration.
- Broadcasts MUST support email and SMS when configured for the tenant.
- Broadcast execution MUST log targeted and delivered counts.

## API Endpoints

### Broadcasts

- `GET /communications/broadcasts`
  - Input: status (optional), broadcast_type (optional), vertical_id (optional)
  - Output: broadcast_id, broadcast_type, status, created_at
- `POST /communications/broadcasts`
  - Input: broadcast_type, vertical_id (optional), target_type, target_filter, channels, consent_mode, message_template_id (optional), message_payload (optional)
  - Output: broadcast_id, status=draft, created_at
- `GET /communications/broadcasts/{broadcast_id}`
  - Input: none
  - Output: broadcast details, status, target_filter, channels
- `POST /communications/broadcasts/{broadcast_id}/request-review`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: broadcast_id, status=requested, requested_at
- `POST /communications/broadcasts/{broadcast_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: broadcast_id, status=approved, approved_at
- `POST /communications/broadcasts/{broadcast_id}/send`
  - Input: none
  - Output: run_id, status=queued, submitted_at
- `POST /communications/broadcasts/{broadcast_id}/cancel`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: broadcast_id, status=cancelled, cancelled_at
- `POST /communications/broadcasts/{broadcast_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: broadcast_id, status=archived, archived_at

### Broadcast Runs

- `GET /communications/broadcasts/{broadcast_id}/runs`
  - Input: none
  - Output: run_id, status, targeted_count, delivered_count, started_at, completed_at
- `GET /communications/broadcasts/runs/{run_id}`
  - Input: none
  - Output: run_id, status, targeted_count, delivered_count, errors_ref (optional)

## Edge Cases

- Missing geo coordinates for radius targeting.
- Emergency broadcast requested without emergency override enabled.

## Audit & Logs

- Broadcast creation, approval, and execution MUST be logged.
- Broadcast target filters and consent_mode MUST be auditable.

## Open Questions

- None.

## References

- SPEC/08-operations/06-communications-engagement.md
- SPEC/06-platform-core/09-notifications-email.md
- SPEC/04-security/09-consent-and-data-sharing.md
