# SCP-SPEC-CORE-04: Household and Family

## Purpose

This document defines households and family relationship handling in SCP.

## In Scope / Out of Scope

**In Scope**
- Household grouping
- Base family relationships
- Household leadership

**Out of Scope**
- Social graph modeling
- Extended kinship inference rules

## Definitions

- Household: A group of people living together.
- Base Relationship: Parent, mother, father, spouse.

## Rules (MUST/SHOULD/MAY)

- Households MUST have a designated leader.
- Only base relationships MUST be stored explicitly.
- Derived relationships SHOULD be inferred.
- Relationship changes MUST preserve history.
- Household membership MAY change over time.
- Temporary households MUST be supported.
- Split households MUST be represented as annexures to the primary household with padded house numbers (e.g., 53, 53A, 53B, 53A/1).
- Annexure numbering MUST be administered by tenant admins.
- Household geolocation (latitude, longitude) SHOULD be captured when available to support radius-based queries.
- Household geolocation updates MUST require verification and be auditable.

## Registration and Membership Workflow

1. Create or identify a household leader (person record required).
2. Create a household record with geo scope and address.
3. Add members and base family relationships.
4. Mark household as provisional until verification is complete.
5. If a household is split, create annexure records and link them to the primary household.

## Update Workflow

1. Validate requester scope (tenant, geo, vertical) and consent.
2. Apply membership changes as new effective records; preserve history.
3. Relationship changes MUST be time-bound and versioned.
4. Annexure changes MUST retain the primary household link.
5. Record audit entries for each update.

## Soft Delete and Archival Workflow

1. Households MUST be archived, not deleted.
2. Archived households MUST be read-only and excluded from new case creation.
3. Archived households MUST retain membership history.
4. Annexures MUST be archived with their primary household unless explicitly separated.
5. Restoration MUST require tenant admin or ROOT approval and must be audited.

## Minimum Required Fields

These are the minimum required fields for household and family registration at the platform core level. Verticals MAY require additional fields.

**Household**
- household_id (system)
- household_name or derived label
- leader_id (person)
- geo_scope (primary geo node)
- address
- status (provisional, verified)
- geo_lat (optional)
- geo_lon (optional)
- geo_accuracy (optional)
- geo_captured_at (optional)

**Family Relationship (Base)**
- person_id
- related_person_id
- relationship_type (parent, mother, father, spouse, guardian)
- effective_from
- effective_until (optional)
- verification_status

## Edge Cases

- Multiple households per person historically.
- Guardianship without parental link.

## Audit & Logs

- Household changes MUST be logged.
- Relationship changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/03-relationship-model.md
- SPEC/03-domain/08-agent-field-ops-model.md
