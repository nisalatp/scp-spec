# SCP-SPEC-MIG-03: Data Import Plan

## Purpose

This document defines the plan for importing data from the Laravel system into the new SCP using batch pipelines.

## In Scope / Out of Scope

**In Scope**
- CSV-based import of core entities
- People, households, and geo data
- Referential integrity validation

**Out of Scope**
- Real-time data synchronization
- Incremental UI-driven imports

## Definitions

- Import Batch: A single execution of data ingestion.
- Source CSV: Extracted data file from Laravel system.

## Rules (MUST/SHOULD/MAY)

- Data MUST be imported via APIs or approved pipelines.
- CSV format MUST be used for bulk imports.
- People MUST be assigned new global GUIDs.
- National identifiers MUST remain tenant-unique.
- Imports SHOULD be validated before commit.
- Failed records MAY be quarantined for review.
- Partial imports MUST be allowed.
- Re-import MUST be supported after correction.

## Edge Cases

- Duplicate persons across households.
- Geo nodes missing parents.

## Audit & Logs

- Each import batch MUST be logged.
- Validation errors MUST be auditable.

## Open Questions

- None.

## References

- SPEC/10-data/08-seeding-and-bootstrap.md
- SPEC/09-integrations/06-data-import-export-pipelines.md
