# SCP-SPEC-DOM-08: Agent and Field Operations Model

## Purpose

This document defines agents and field operations within SCP.

## In Scope / Out of Scope

**In Scope**
- Field agents
- Assignments and visits
- Data collection workflows

**Out of Scope**
- Mobile UI design
- Device management

## Definitions

- Agent: Authorized field worker.
- Visit: A recorded field interaction.

## Rules (MUST/SHOULD/MAY)

- Agents MUST be assigned to geo scopes.
- Visits MAY serve multiple verticals.
- Field data MUST go through verification workflows.
- Offline capture MAY be supported later.
- Volunteer agents MUST be distinguished using internationally accepted role classifications and tenant-configurable defaults.
- Agent roles MUST be time-bound where required by governance.

## Agent and Visit Workflow

1. Agent is created and assigned to geo scopes.
2. Agent status is Active by default; Suspended agents are read-only.
3. Field visit is created in Draft and may include multiple verticals.
4. Visit is submitted for verification (Submitted).
5. Verified visits become immutable.
6. Visits MAY be archived after governance review.

## Minimum Required Fields

### Agent

- agent_id (system GUID)
- tenant_id
- person_id (linked identity)
- role_classification
- status (active, suspended, archived)
- active_from
- active_until (nullable)
- created_by, created_at

### Visit

- visit_id (system GUID)
- tenant_id
- agent_id
- target_type (person, household, case)
- target_id
- vertical_ids
- status (draft, submitted, verified, archived)
- visit_date
- created_by, created_at

## Edge Cases

- Conflicting data from multiple visits.
- Agent reassignment mid-case.

## Audit & Logs

- Agent actions MUST be logged.
- Visit records MUST be immutable after verification.

## Open Questions

- None.

## References

- SPEC/08-operations/01-agent-field-operations.md
- SPEC/03-domain/05-case-intervention-model.md
