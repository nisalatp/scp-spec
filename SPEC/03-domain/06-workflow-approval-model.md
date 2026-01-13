# SCP-SPEC-DOM-06: Workflow and Approval Model

## Purpose

This document defines workflow and approval mechanisms used across SCP for governance and control.

## In Scope / Out of Scope

**In Scope**
- Multi-level approvals
- Workflow states
- Governance enforcement

**Out of Scope**
- UI workflow designers
- External workflow engines

## Definitions

- Workflow: A sequence of governed steps.
- Approval Level: A required authorization stage.

## Rules (MUST/SHOULD/MAY)

- Workflows MUST be explicit and versioned.
- Approval levels MUST be role-based.
- Workflows SHOULD be reusable across domains.
- Emergency overrides MAY exist with audit.
- Conditional approval paths MUST be supported.
- Expired approvals MUST be flagged and archived.

## Workflow and Approval Lifecycle

1. A workflow definition is created in Draft and versioned on publish.
2. A workflow definition is activated for a specific domain (program, case, policy, etc).
3. A workflow instance is created for a target entity and begins at the initial step.
4. Approvals are requested by step with required roles and conditions.
5. Parallel approvals MUST all succeed unless a step declares any_of approval.
6. Rejection moves the instance to Rejected with reason.
7. Approved steps advance the instance until Completed or Cancelled.
8. Emergency overrides close an instance with an override reason and elevated audit.

## Minimum Required Fields

### Workflow Definition

- workflow_definition_id (system GUID)
- tenant_id
- workflow_name
- workflow_code (unique per tenant)
- version_id
- status (draft, active, archived)
- steps (ordered list with role requirements, conditions, and approval mode)

### Workflow Instance

- workflow_instance_id (system GUID)
- tenant_id
- workflow_definition_id
- target_type
- target_id
- status (pending, in_review, approved, rejected, cancelled, overridden)
- current_step_id
- created_by, created_at

### Approval Record

- approval_id (system GUID)
- workflow_instance_id
- step_id
- approver_id
- decision (approved or rejected)
- decision_reason_code
- decision_reason_text (required if OTHER)
- decided_at

## Edge Cases

- Approver unavailability.
- Workflow definition changes mid-process.

## Audit & Logs

- All approvals MUST be logged.
- Overrides MUST include justification.

## Open Questions

- None.

## References

- SPEC/05-governance/04-policy-change-control.md
- SPEC/04-security/07-scopes-groups-roles.md
