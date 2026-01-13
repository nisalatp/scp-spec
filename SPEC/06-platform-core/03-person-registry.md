# SCP-SPEC-CORE-03: Person Registry

## Purpose

This document defines the person registry, the authoritative record of individuals within a tenant.

## In Scope / Out of Scope

**In Scope**
- Person identity
- Unique identifiers
- Core demographic data

**Out of Scope**
- Biometric systems
- External identity verification

## Definitions

- Person: An individual registered in SCP.
- System GUID: Globally unique SCP identifier.

## Rules (MUST/SHOULD/MAY)

- Every person MUST have a global system GUID.
- National identifiers MUST be unique per tenant.
- Multiple identifiers MAY be stored per person.
- Sensitive fields MUST support classification and masking.
- Person records MUST support verification status.
- Deceased persons MUST be retained indefinitely.
- Unknown identities MUST be created as provisional records and updated by field agents when verified.
- Unknown identities MUST use the standard system GUID without a special temporary ID format.

## Registration Workflow

1. Capture person identity and core demographics (online or offline).
2. If identity is unknown or incomplete, create a provisional person record.
3. Link the person to a household or create a new household with a leader.
4. Submit for verification; records remain non-authoritative until verified.
5. After verification, capture consent per vertical with Active From/Until and required evidence.
6. On sync, apply conflict detection and duplicate checks; flag for manual review.

Offline capture MUST remain provisional until verified and synced.

## Update Workflow

1. Validate requester scope (tenant, geo, vertical) and consent.
2. Create a new version of any modified sensitive fields (no in-place overwrite).
3. Apply changes and mark prior values as historical with effective dates.
4. If identifiers change, trigger duplicate checks and manual review when needed.
5. Record audit entries for each update.

## Soft Delete and Archival Workflow

1. Soft delete MUST be used instead of physical deletion.
2. Soft delete MUST mark the person as archived and read-only.
3. Archived persons MUST be excluded from operational workflows and exports.
4. Archived persons MAY remain visible to authorized roles for historical review.
5. Restoration MUST require tenant admin or ROOT approval and must be audited.

## Minimum Required Fields

These are the minimum required fields for person registration at the platform core level. Verticals MAY require additional fields.

- system_guid (auto-generated)
- full_name
- date_of_birth or age_estimate
- gender
- identity_type and identity_number (if available)
- primary_contact (phone or email, if available)
- verification_status (provisional, verified)
- consent_status_by_vertical (optional, pending or effective)

## Edge Cases

- Duplicate national IDs discovered later.
- Persons moving between households.

## Audit & Logs

- Person creation and updates MUST be logged.
- Identifier changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/10-data-classification-and-masking.md
- SPEC/03-domain/02-entity-catalog.md
