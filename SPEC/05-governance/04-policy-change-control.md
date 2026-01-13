# SCP-SPEC-GOV-04: Policy Change Control

## Purpose

This document defines how policies within SCP are proposed, reviewed, approved, and applied.

## In Scope / Out of Scope

**In Scope**
- Policy lifecycle
- Change approval workflows
- Versioning

**Out of Scope**
- Emergency operational actions

## Definitions

- Policy: A rule governing system behavior.
- Policy Change: A modification to an existing policy.
- Active From: Timestamp when a policy version becomes effective.
- Active Until: Timestamp when a policy version expires; MAY be open-ended.

## Rules (MUST/SHOULD/MAY)

- All policy changes MUST follow an approval workflow.
- Policy changes MUST be versioned.
- Each policy version MUST include Active From and Active Until timestamps; Active Until MAY be open-ended.
- A policy version MUST be enforced only within its active window.
- Policy versions MUST NOT be active outside their declared window.
- Impact analysis SHOULD be required for significant changes.
- Rollback MAY be supported where feasible.
- Policy simulations are not required before approval.
- Urgent policy fixes MUST follow internationally accepted defaults for expedited approval.

## Edge Cases

- Policy changes affecting active cases.
- Conflicting policy updates.
- Overlapping active windows for the same policy version.

## Audit & Logs

- Policy change proposals and approvals MUST be logged.
- Historical policies MUST remain accessible.

## Open Questions

- None.

## References

- SPEC/04-security/08-deny-and-inheritance.md
- SPEC/02-architecture/09-architecture-decisions-adr.md
