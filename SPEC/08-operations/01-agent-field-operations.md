# SCP-SPEC-OPS-01: Agent and Field Operations

## Purpose

This document defines operational rules for field agents who perform on-ground activities such as enrollment, verification, and follow-up visits.

## In Scope / Out of Scope

**In Scope**
- Agent onboarding and assignment
- Field visits and data capture
- Assisted enrollment

**Out of Scope**
- Agent payroll or HR systems
- Device procurement and MDM

## Definitions

- Agent: Authorized field personnel.
- Field Visit: On-site interaction recorded in SCP.

## Rules (MUST/SHOULD/MAY)

- Agents MUST be assigned to specific geo scopes.
- Agents MUST operate within role and vertical permissions.
- A single visit MAY serve multiple verticals.
- Field data MUST follow verification workflows.
- Assisted enrollment SHOULD be supported.
- Agents MAY create person records offline; records MUST be verified before becoming authoritative.
- Temporary agent assignments MUST be supported and time-bound.
- Agent suspensions MUST set access to read-only (no new captures or edits) until reinstated.
- Agent suspensions MUST be initiated by tenant admins or ROOT and MUST record a reason.

## Edge Cases

- Agent operating outside assigned geo.
- Conflicting data from multiple visits.

## Audit & Logs

- All agent actions MUST be logged.
- Visit submissions and verifications MUST be auditable.
- Agent suspension and reinstatement MUST be logged.

## Open Questions

- None.

## References

- SPEC/06-platform-core/02-geo-engine.md
- SPEC/05-governance/05-data-moderation-verification.md
