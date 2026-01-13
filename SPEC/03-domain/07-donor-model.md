# SCP-SPEC-DOM-07: Donor Model

## Purpose

This document defines how donors are represented and governed within SCP.

## In Scope / Out of Scope

**In Scope**
- Donor entities
- Donor access and visibility
- Donor-program relationships

**Out of Scope**
- Donation payment processing (MVP excluded)
- Donor CRM features

## Definitions

- Donor: An organization or individual providing resources.
- Donor Access: Governed visibility into programs and cases.

## Rules (MUST/SHOULD/MAY)

- Donors MUST have read-only access by default.
- Donor visibility MUST be scoped by program and vertical.
- Donors MUST NOT access identifiable personal data.
- Donors MAY fund multiple programs.
- Anonymous donors MAY be supported.
- Donor reporting MAY include tenant-defined custom reports.
- Donor report standards MUST follow internationally accepted formats with tenant-configurable defaults.

## Donor Lifecycle Workflow

1. Donor record is created in Draft.
2. Donor is approved by umbrella authority and becomes Active.
3. Donor access grants are created for programs and verticals.
4. Donor access MAY be revoked immediately by governance.
5. Donor records are archived when retired.

## Minimum Required Fields

- donor_id (system GUID)
- tenant_id
- donor_name
- donor_type (organization or individual)
- status (draft, active, suspended, archived)
- anonymous (boolean)
- created_by, created_at

## Edge Cases

- Donors funding overlapping programs.
- Donor access revoked mid-program.

## Audit & Logs

- Donor access grants MUST be logged.
- Funding relationships MUST be auditable.

## Open Questions

- None.

## References

- SPEC/08-operations/03-donor-operations.md
- SPEC/04-security/04-authorization-overview.md
