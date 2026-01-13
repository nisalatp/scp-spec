# SCP-SPEC-API-17: Import and Export Pipelines API

## Purpose

This document defines APIs for batch import and export pipelines.

## In Scope / Out of Scope

**In Scope**
- Pipeline definitions and lifecycle
- Import and export job execution
- Validation reports and rollback

**Out of Scope**
- Real-time streaming ingestion
- External ETL tooling

## Definitions

- Pipeline: A governed import or export definition.
- Pipeline Run: A single execution of a pipeline.

## Rules (MUST/SHOULD/MAY)

- Pipelines MUST be tenant-scoped.
- Imports MUST validate schema and identifiers.
- Exports MUST respect authorization, consent, and masking.
- Failed import runs MUST support rollback.
- Implementations MAY expose `/exports/pipelines` as an alias to `/pipelines`.

## API Endpoints

### Pipeline Definitions

- `GET /pipelines`
  - Input: direction (optional), status (optional)
  - Output: pipeline_id, pipeline_name, direction, status, format
- `POST /pipelines`
  - Input: pipeline_name, pipeline_code, direction, format (csv or xlsx), target_type, mapping_definition, schedule (optional)
  - Output: pipeline_id, status=draft, created_at
- `PATCH /pipelines/{pipeline_id}`
  - Input: pipeline_name (optional), mapping_definition (optional), schedule (optional)
  - Output: pipeline_id, updated_at
- `GET /pipelines/{pipeline_id}`
  - Input: none
  - Output: pipeline details, status, schedule

### Lifecycle and Governance

- `POST /pipelines/{pipeline_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: pipeline_id, status=requested
- `POST /pipelines/{pipeline_id}/review`
  - Input: review_notes (optional)
  - Output: pipeline_id, status=reviewed
- `POST /pipelines/{pipeline_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: pipeline_id, status=approved
- `POST /pipelines/{pipeline_id}/activate`
  - Input: none
  - Output: pipeline_id, status=active
- `POST /pipelines/{pipeline_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: pipeline_id, status=restricted
- `POST /pipelines/{pipeline_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: pipeline_id, status=suspended
- `POST /pipelines/{pipeline_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: pipeline_id, status=deprecated
- `POST /pipelines/{pipeline_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: pipeline_id, status=archived

### Pipeline Runs

- `POST /pipelines/{pipeline_id}/runs`
  - Input: input_file_ref (required for imports), parameters (optional)
  - Output: run_id, status=queued, submitted_at
- `GET /pipelines/runs/{run_id}`
  - Output: run_id, status, validation_report_ref, output_file_ref, completed_at
- `POST /pipelines/runs/{run_id}/rollback`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: run_id, status=rolled_back, rolled_back_at

## Edge Cases

- Partial import failures.
- Schema drift in source files.

## Audit & Logs

- Pipeline definitions, runs, and rollbacks MUST be logged.

## Open Questions

- None.

## References

- SPEC/09-integrations/06-data-import-export-pipelines.md
- SPEC/08-operations/07-reporting-exports.md
