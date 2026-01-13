# SCP-SPEC-API-19: Agent and Field Operations API

## Purpose

This document defines APIs for managing agents, assignments, and field visits.

## In Scope / Out of Scope

**In Scope**
- Agent onboarding and suspension
- Geo assignments
- Visit creation and verification

**Out of Scope**
- Mobile UI and device management

## Definitions

- Agent: Authorized field personnel.
- Visit: Recorded field interaction.

## Rules (MUST/SHOULD/MAY)

- Agent APIs MUST enforce tenant and geo scope constraints.
- Suspended agents MUST be read-only.
- Visits MUST be verified before becoming authoritative.

## API Endpoints

### Agents

- `GET /agents`
  - Input: status (optional), geo_id (optional)
  - Output: agent_id, person_id, status, active_from, active_until
- `POST /agents`
  - Input: person_id, role_classification, active_from, active_until (optional)
  - Output: agent_id, status=active, created_at
- `PATCH /agents/{agent_id}`
  - Input: role_classification (optional), active_until (optional)
  - Output: agent_id, updated_at
- `GET /agents/{agent_id}`
  - Input: none
  - Output: agent details, geo_scopes, status
- `POST /agents/{agent_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: agent_id, status=suspended, suspended_at
- `POST /agents/{agent_id}/resume`
  - Input: none
  - Output: agent_id, status=active, resumed_at
- `POST /agents/{agent_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: agent_id, status=archived, archived_at
- `POST /agents/{agent_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: agent_id, status=active, restored_at

### Agent Geo Assignments

- `POST /agents/{agent_id}/geo-scopes`
  - Input: geo_id, effective_from, effective_until (optional)
  - Output: assignment_id, agent_id, geo_id
- `POST /agents/{agent_id}/geo-scopes/{geo_id}/end`
  - Input: effective_until, reason_code
  - Output: assignment_id, effective_until

### Visits

- `GET /visits`
  - Input: agent_id (optional), target_type (optional), target_id (optional), status (optional)
  - Output: visit_id, agent_id, status, visit_date
- `POST /visits`
  - Input: agent_id, target_type, target_id, vertical_ids, visit_date, notes (optional)
  - Output: visit_id, status=draft, created_at
- `PATCH /visits/{visit_id}`
  - Input: notes (optional), visit_date (optional)
  - Output: visit_id, updated_at
- `POST /visits/{visit_id}/submit`
  - Input: submission_notes (optional)
  - Output: visit_id, status=submitted, submitted_at
- `POST /visits/{visit_id}/verify`
  - Input: verified_by, verified_at
  - Output: visit_id, status=verified, verified_at
- `POST /visits/{visit_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: visit_id, status=archived, archived_at

## Edge Cases

- Agent operating outside assigned geo.
- Conflicting data from multiple visits.

## Audit & Logs

- Agent actions MUST be logged.
- Visit submissions and verifications MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/08-agent-field-ops-model.md
- SPEC/08-operations/01-agent-field-operations.md
