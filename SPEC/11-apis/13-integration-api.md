# SCP-SPEC-API-13: Integration API

## Purpose

This document defines APIs used by external integrations.

## In Scope / Out of Scope

**In Scope**
- Integration registration
- Data exchange endpoints

**Out of Scope**
- Third-party SDKs

## Definitions

- Integration: External system connected to SCP.

## Rules (MUST/SHOULD/MAY)

- Integration APIs MUST enforce tenant isolation.
- Integrations MUST use scoped tokens.
- Data sharing MUST respect consent and masking.
- Rate limits MUST be applied.
- Sandbox environments MUST NOT be required by default.
- Data exchange requests MUST reference an active integration contract.
- Exchange logs MUST be created for each push or pull request.
- Idempotency keys MUST be honored when provided.

## API Endpoints

### Integrations

- `GET /integrations`
  - Input: status (optional), partner_type (optional), vertical_id (optional)
  - Output: integration_id, integration_name, partner_name, status, vertical_ids
- `POST /integrations`
  - Input: integration_name, partner_name, partner_type, vertical_ids, active_from, active_until (optional), data_contract_ref (optional)
  - Output: integration_id, status=draft, created_at
- `PATCH /integrations/{integration_id}`
  - Input: integration_name (optional), partner_name (optional), vertical_ids (optional), active_from (optional), active_until (optional)
  - Output: integration_id, updated_at, version_id
- `GET /integrations/{integration_id}`
  - Input: none
  - Output: integration details, status, vertical_ids, auth_client_id

### Lifecycle and Governance

- `POST /integrations/{integration_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: integration_id, status=requested, requested_at
- `POST /integrations/{integration_id}/review`
  - Input: review_notes (optional)
  - Output: integration_id, status=reviewed, reviewed_at
- `POST /integrations/{integration_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: integration_id, status=approved, approved_at
- `POST /integrations/{integration_id}/activate`
  - Input: none
  - Output: integration_id, status=active, auth_client_id, activated_at
- `POST /integrations/{integration_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: integration_id, status=restricted, restricted_at
- `POST /integrations/{integration_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: integration_id, status=suspended, suspended_at
- `POST /integrations/{integration_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: integration_id, status=deprecated, deprecated_at
- `POST /integrations/{integration_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: integration_id, status=archived, archived_at

### Integration Contracts

- `POST /integrations/{integration_id}/contracts`
  - Input: purpose, data_categories, field_list, consent_requirements, active_from, active_until (optional)
  - Output: contract_id, status=draft, created_at
- `PATCH /integrations/{integration_id}/contracts/{contract_id}`
  - Input: purpose (optional), data_categories (optional), field_list (optional), consent_requirements (optional), active_until (optional)
  - Output: contract_id, updated_at, version_id
- `POST /integrations/{integration_id}/contracts/{contract_id}/activate`
  - Input: none
  - Output: contract_id, status=active, activated_at
- `POST /integrations/{integration_id}/contracts/{contract_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: contract_id, status=archived, archived_at

### Integration Registry (Templates)

- `GET /integrations/registry`
  - Input: partner_type (optional), status (optional)
  - Output: template_id, template_name, partner_type, vertical_ids, status
- `POST /integrations/registry`
  - Input: template_name, partner_type, vertical_ids, contract_template
  - Output: template_id, status=active, created_at
- `POST /integrations/registry/{template_id}/instantiate`
  - Input: tenant_id, integration_name, partner_name, vertical_ids (optional)
  - Output: integration_id, status=draft, created_at

### Data Exchange (Scoped by Contract)

- `POST /integrations/{integration_id}/data/push`
  - Input: contract_id, payload, format (json, csv, xml), idempotency_key (optional)
  - Output: exchange_id, status=accepted, received_at
- `GET /integrations/{integration_id}/data/pull`
  - Input: contract_id, filters (optional), format (json, csv, xml)
  - Output: exchange_id, status=completed, output_file_ref or payload
- `GET /integrations/{integration_id}/exchanges`
  - Input: status (optional), since (optional)
  - Output: exchange_id, direction, status, format, completed_at

### Webhook Subscriptions

- `GET /integrations/{integration_id}/webhooks`
  - Input: status (optional)
  - Output: webhook_id, target_url, event_types, status, created_at
- `POST /integrations/{integration_id}/webhooks`
  - Input: target_url, event_types, active_from, active_until (optional)
  - Output: webhook_id, status=active, created_at, public_key_id
- `PATCH /integrations/{integration_id}/webhooks/{webhook_id}`
  - Input: target_url (optional), event_types (optional), active_until (optional)
  - Output: webhook_id, updated_at
- `POST /integrations/{integration_id}/webhooks/{webhook_id}/rotate-secret`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: webhook_id, public_key_id, rotated_at
- `POST /integrations/{integration_id}/webhooks/{webhook_id}/disable`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: webhook_id, status=disabled, disabled_at

## Edge Cases

- Integration misconfiguration.
- Excessive request rates.

## Audit & Logs

- Integration API calls MUST be logged.
- Failures MUST be auditable.

## Open Questions

- None.

## References

- SPEC/09-integrations/01-integration-overview.md
- SPEC/04-security/11-api-security.md
