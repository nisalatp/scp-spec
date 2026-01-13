# SCP-SPEC-DOM-02: Entity Catalog

## Purpose

This document catalogs the primary entities used in SCP and provides a common vocabulary for implementation and governance.

## In Scope / Out of Scope

**In Scope**
- Core entities and their responsibilities
- High-level attributes (conceptual)

**Out of Scope**
- Database columns
- Validation rules

## Definitions

Key entities include:
- Person
- Household
- Geo Node
- Community Center
- Facility
- Infrastructure Project
- Geo Metric
- Service Encounter
- Attendance Record
- Vertical
- Program
- Case
- Donor
- Agent

## Rules (MUST/SHOULD/MAY)

- Each entity MUST have a globally unique system identifier.
- Person identifiers (NIC, DL, etc) MUST be unique per tenant.
- Entities SHOULD be linked through explicit relationships.
- New entities MAY be introduced via governance approval.
- Soft-deleted entities MAY be queryable only with explicit privileges.
- Historical identifiers MUST be preserved using immutable history records with effective dates, following sensible defaults.

## Edge Cases

- One person belonging to multiple households historically.
- Temporary entities created during imports.

## Audit & Logs

- Entity creation and modification MUST be logged.
- Entity merges or splits MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/03-relationship-model.md
- SPEC/10-data/02-logical-data-schema.md
