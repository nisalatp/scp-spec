# SCP-SPEC-GOV-06: Conflict Management

## Purpose

This document defines how SCP identifies, manages, and resolves conflicts between stakeholders, data, and programs.

## In Scope / Out of Scope

**In Scope**
- Data conflicts
- Program and donor conflicts
- Governance escalation paths

**Out of Scope**
- Legal dispute resolution

## Definitions

- Conflict: A situation where rules, interests, or data collide.
- Escalation: Formal elevation of a conflict for resolution.

## Rules (MUST/SHOULD/MAY)

- Conflicts MUST be made visible within SCP.
- Automated detection SHOULD flag potential conflicts.
- Escalation MUST be available to umbrella authority.
- Temporary restrictions MAY be applied during resolution.
- Mediation roles are not required by default.
- Unresolved conflicts MUST be escalated to ROOT or tenant admins for resolution.
- Duplicate support conflicts (same person or household receiving overlapping interventions) MUST be detected and flagged for manual review.
- Duplicate support conflicts SHOULD restrict new case activation until resolved.

## Edge Cases

- Conflicts involving umbrella authority members.
- Conflicts spanning multiple tenants.

## Audit & Logs

- Conflict detection and resolution MUST be logged.
- Decisions MUST include rationale.

## Open Questions

- None.

## References

- SPEC/05-governance/02-umbrella-authority-model.md
- SPEC/03-domain/07-donor-model.md
