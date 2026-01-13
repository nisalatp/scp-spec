# SCP-SPEC-INT-06: Data Import and Export Pipelines

## Purpose

This document defines batch and scheduled data import and export pipelines for SCP.

## In Scope / Out of Scope

**In Scope**
- CSV and Excel imports
- CSV and Excel exports
- Scheduled and manual pipelines

**Out of Scope**
- Real-time streaming analytics
- External ETL platforms

## Definitions

- Import Pipeline: Process for ingesting external data into SCP.
- Export Pipeline: Process for extracting data from SCP.
- Batch Job: Scheduled or on-demand pipeline execution.

## Rules (MUST/SHOULD/MAY)

- Pipelines MUST be tenant-isolated.
- Imports MUST validate schema and identifiers.
- Exports MUST respect authorization, consent, and masking.
- Exports MUST exclude consent-withdrawn records, including from aggregated outputs.
- CSV and Excel formats MUST be supported.
- Large jobs SHOULD be asynchronous.
- Pipelines MAY require manual approval.
- Incremental imports MUST NOT be required.
- Failed import runs MUST support rollback.

## Pipeline Lifecycle Workflow

1. Pipeline definition is created in Draft.
2. Pipeline is submitted for governance review (Requested).
3. Review completes and marks the pipeline as Reviewed.
4. Umbrella approval transitions the pipeline to Approved.
5. Approved pipelines are activated (Active).
6. Jobs are created for manual runs or scheduled execution.
7. Jobs run through validate -> execute -> complete, or fail and rollback.
8. Pipelines MAY be restricted, suspended, or deprecated by governance.
9. Pipelines are archived when retired.

## Minimum Required Fields

### Pipeline Definition

- pipeline_id (system GUID)
- tenant_id
- pipeline_name
- pipeline_code (unique per tenant)
- direction (import or export)
- format (csv or xlsx)
- target_type (person, household, case, program, or other)
- mapping_definition (field mapping or schema reference)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- schedule (optional)
- created_by, created_at

### Pipeline Run

- run_id (system GUID)
- pipeline_id
- status (queued, validating, running, completed, failed, rolled_back)
- input_file_ref (nullable for exports)
- output_file_ref (nullable for imports)
- validation_report_ref (optional)
- started_at, completed_at
- initiated_by

## Edge Cases

- Partial import failures.
- Schema drift in source files.
- Duplicate records during import.

## Audit & Logs

- Pipeline executions MUST be logged.
- Import validation errors MUST be auditable.
- Export actions MUST be traceable.

## Open Questions

- None.

## References

- SPEC/08-operations/07-reporting-exports.md
- SPEC/10-data/01-data-architecture.md
