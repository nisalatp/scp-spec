# SCP-SPEC-OPS-03: Donor Operations

## Purpose

This document defines how donors interact with SCP in a governed, read-only operational model.

## In Scope / Out of Scope

**In Scope**
- Donor access to reports
- Program visibility
- Funding attribution

**Out of Scope**
- Donation payment processing
- Donor CRM features

## Definitions

- Donor: Entity providing funding or resources.
- Donor View: Read-only operational access.

## Rules (MUST/SHOULD/MAY)

- Donors MUST have read-only access by default.
- Donor visibility MUST be scoped by program and vertical.
- Donors MUST NOT access identifiable personal data.
- Donors MAY view aggregated reporting only during consent grace periods if otherwise authorized.
- Donors MAY fund multiple programs.
- Anonymous donors MAY be supported.
- Donors MAY request custom reports, subject to approval and access controls.

## Edge Cases

- Donor funding overlapping programs.
- Donor access revoked mid-program.

## Audit & Logs

- Donor access and report views MUST be logged.
- Funding relationships MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/07-donor-model.md
- SPEC/07-verticals/07-cross-vertical-interventions.md
