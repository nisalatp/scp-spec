# SCP-SPEC-DOM-04: Program Model

## Purpose

This document defines the Program entity, representing structured initiatives owned by a vertical and approved by governance.

## In Scope / Out of Scope

**In Scope**
- Program lifecycle
- Ownership and approval
- Program scoping

**Out of Scope**
- Program execution details
- Financial transactions

## Definitions

- Program: A governed initiative targeting defined outcomes.
- Program Owner: The vertical responsible for the program.

## Rules (MUST/SHOULD/MAY)

- Programs MAY belong to multiple verticals, with one primary vertical designated.
- Programs MUST be approved by umbrella authority.
- Programs SHOULD define eligibility and KPIs.
- Programs MUST define baseline and outcome measurement definitions (forms or KPI mappings).
- Programs MAY span multiple geo nodes.
- Program enrollment MUST require verified persons.
- Program actions MUST pass the intersection of all participating verticals.
- Participant verticals MAY initiate program actions, subject to intersection rules.
- Audit logs for multi-vertical program actions MUST record all participating verticals.
- Programs MUST be clonable across tenants via governance approval.
- Retired programs MUST be archived following international standards and retained as read-only history.
- Programs MAY be restricted, suspended, or deprecated by umbrella authority for governance reasons.

## Program Lifecycle Workflow

1. Program is created in Draft state by a tenant admin or vertical owner.
2. Program is submitted for governance review (Requested).
3. Governance review completes and marks the program as Reviewed.
4. Umbrella approves or rejects the program; approved programs transition to Approved.
5. Approved programs are activated with Active From and Active Until (nullable).
6. Programs MAY be restricted, suspended, or deprecated by umbrella authority for governance reasons.
7. Programs are archived when retired and remain read-only.

## Minimum Required Fields

- program_id (system GUID)
- tenant_id
- program_name
- program_code (unique per tenant)
- primary_vertical_id
- participant_vertical_ids (optional)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- active_from
- active_until (nullable)
- owner_id (vertical owner)
- eligibility_definition (metadata reference or JSON)
- kpi_definitions (metadata reference or JSON)
- geo_scope_ids (optional)
- created_by, created_at

## Edge Cases

- Programs restricted or suspended due to governance review.
- Programs transferred between verticals.

## Audit & Logs

- Program lifecycle changes MUST be logged.
- Approval decisions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/05-governance/03-vertical-governance.md
- SPEC/03-domain/05-case-intervention-model.md
