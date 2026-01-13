# SCP-SPEC-API-09: Workflow and Approval API

## Purpose

This document defines APIs for workflow execution and approvals.

## In Scope / Out of Scope

**In Scope**
- Approval submission
- Approval decisions

**Out of Scope**
- Workflow design tools

## Definitions

- Workflow: Governed sequence of actions.
- Approval: Authorization step.

## Rules (MUST/SHOULD/MAY)

- Approval APIs MUST enforce role checks.
- Approval actions MUST be idempotent.
- Workflows MUST be version-aware.
- Overrides MUST require justification.
- Parallel approvals MUST be supported.

## API Endpoints

### Workflow Definitions

- `GET /workflows/definitions`
  - Input: status (optional), target_type (optional)
  - Output: workflow_definition_id, workflow_name, workflow_code, status, version_id
- `POST /workflows/definitions`
  - Input: workflow_name, workflow_code, target_type, steps
  - Output: workflow_definition_id, version_id, status=draft, created_at
- `PATCH /workflows/definitions/{workflow_definition_id}`
  - Input: workflow_name (optional), steps (optional)
  - Output: workflow_definition_id, version_id, updated_at
- `POST /workflows/definitions/{workflow_definition_id}/activate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: workflow_definition_id, status=active, activated_at
- `POST /workflows/definitions/{workflow_definition_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: workflow_definition_id, status=archived, archived_at

### Workflow Instances

- `POST /workflows/instances`
  - Input: workflow_definition_id, target_type, target_id
  - Output: workflow_instance_id, status=pending, created_at
- `GET /workflows/instances/{workflow_instance_id}`
  - Input: none
  - Output: workflow_instance_id, status, current_step_id, steps_summary
- `POST /workflows/instances/{workflow_instance_id}/cancel`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: workflow_instance_id, status=cancelled, cancelled_at
- `POST /workflows/instances/{workflow_instance_id}/override`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: workflow_instance_id, status=overridden, overridden_at

### Approvals

- `POST /workflows/instances/{workflow_instance_id}/approvals`
  - Input: step_id, decision (approved or rejected), decision_reason_code, decision_reason_text (required if OTHER)
  - Output: approval_id, workflow_instance_id, status, decided_at

## Edge Cases

- Approver unavailable.
- Approval expired.

## Audit & Logs

- Approval actions MUST be logged.
- Workflow decisions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/06-workflow-approval-model.md
- SPEC/05-governance/04-policy-change-control.md
