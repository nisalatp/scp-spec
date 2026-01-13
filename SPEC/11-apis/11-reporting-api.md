# SCP-SPEC-API-11: Reporting API

## Purpose

This document defines APIs for reporting and data export.

## In Scope / Out of Scope

**In Scope**
- Report generation
- CSV and Excel exports
- Report builder definitions and saved reports
- Reportable entity registry and chart definitions

**Out of Scope**
- BI dashboards
- Ad hoc SQL access to tenant databases

## Definitions

- Report: Aggregated dataset.
- Report Builder: Governed mechanism to define, preview, and save report definitions.
- Report Definition: Versioned configuration for a report (models, fields, filters, grouping).
- Reportable Entity Registry: Approved models, fields, joins, and classifications for reporting.
- Report Runner: Execution engine that validates and runs saved report definitions.
- Chart Definition: Versioned chart configuration derived from reportable data.

## Rules (MUST/SHOULD/MAY)

- Reporting APIs MUST enforce authorization and consent.
- CSV and Excel formats MUST be supported.
- Reports MUST exclude consent-withdrawn records, including from aggregates.
- Reports and exports for multi-vertical programs MUST pass the intersection of participating verticals for non-ROOT users.
- ROOT requests MAY return full datasets regardless of consent state, with optional reason codes logged.
- Reports MUST include case suspension status when cases are visible to the requester.
- Large reports SHOULD be generated asynchronously.
- Export actions MUST be auditable.
- Scheduled reports MUST be supported.
- Report Builder APIs MUST only expose entities and fields declared in the Reportable Entity Registry.
- Reportable Entity Registry entries MUST be tenant-scoped, vertically scoped, and classification-aware.
- Registry entries MAY include facilities, infrastructure projects, geo metrics, service encounters, and attendance records when approved.
- Report Builder MUST support:
  - model selection from the registry
  - attribute selection with classification and masking metadata
  - filters, sort, group_by, and aggregations
  - preview with safe row limits
  - save and versioning of report definitions
- Report Definitions MUST store a validation hash covering selected models, joins, fields, and filters.
- Report Runner MUST validate report definitions on every execution and fail closed if invalid.
- Report Runner MUST re-evaluate authorization, consent, and masking at execution time.
- Saved reports MUST capture the execution security context (tenant, verticals, geo scopes) and use it for validation.
- Chart Definitions MUST be sourced from reportable data or approved query templates.
- Chart rendering and chart exports MUST apply the same consent, masking, and authorization rules as reports.
- Row-level reporting MUST require explicit role permission; aggregates SHOULD be the default.
- Report Builder MUST NOT allow raw SQL or arbitrary table access.
- Report Builder MUST support measurement_type filtering (baseline, follow_up, outcome) for longitudinal reporting.

## API Endpoints

### Reportable Entity Registry (Restricted)

- `GET /reporting/registry/entities`
  - Input: vertical_id (optional), status (optional)
  - Output: entity_id, entity_name, allowed_fields, joins, classification, vertical_scope, status
- `POST /reporting/registry/entities`
  - Input: entity_name, data_source, allowed_fields, joins (optional), classification, vertical_scope, geo_scope (optional)
  - Output: entity_id, status, created_at
- `PATCH /reporting/registry/entities/{entity_id}`
  - Input: allowed_fields (optional), joins (optional), classification (optional), status (optional)
  - Output: entity_id, updated_at
- `POST /reporting/registry/entities/{entity_id}/activate`
  - Input: none
  - Output: entity_id, status=active, activated_at
- `POST /reporting/registry/entities/{entity_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: entity_id, status=deprecated, deprecated_at
- `POST /reporting/registry/entities/{entity_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: entity_id, status=archived, archived_at

### Report Definitions

- `GET /reports/definitions`
  - Input: status (optional), vertical_id (optional)
  - Output: report_definition_id, report_name, status, version_id
- `GET /reports/definitions/{report_definition_id}`
  - Input: none
  - Output: report definition details, status, version_id, validation_hash
- `POST /reports/definitions`
  - Input: report_name, description (optional), entity_ids, fields, filters (optional), group_by (optional), aggregates (optional), sort (optional), vertical_scope, geo_scope (optional)
  - Output: report_definition_id, version_id, status, created_at
- `PATCH /reports/definitions/{report_definition_id}`
  - Input: report_name (optional), description (optional), fields (optional), filters (optional), group_by (optional), aggregates (optional), sort (optional)
  - Output: report_definition_id, version_id, updated_at
- `POST /reports/definitions/{report_definition_id}/activate`
  - Input: none
  - Output: report_definition_id, status=active, activated_at
- `POST /reports/definitions/{report_definition_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: report_definition_id, status=deprecated, deprecated_at
- `POST /reports/definitions/{report_definition_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: report_definition_id, status=archived, archived_at
- `POST /reports/definitions/{report_definition_id}/validate`
  - Input: none
  - Output: validation_status, validation_hash, errors (if any)
- `POST /reports/definitions/{report_definition_id}/preview`
  - Input: parameters (optional), row_limit (optional)
  - Output: columns, preview_rows, truncated (true or false)

### Report Runs and Exports

- `POST /reports/definitions/{report_definition_id}/run`
  - Input: parameters (optional), format (csv or xlsx, optional)
  - Output: run_id, status (queued or running), submitted_at
- `GET /reports/runs/{run_id}`
  - Input: none
  - Output: run_id, status, row_count, completed_at, errors (if any)
- `GET /reports/runs/{run_id}/download`
  - Input: format (csv or xlsx)
  - Output: file_id or download_url, expires_at

### Export Pipelines (Batch)

Export pipelines are managed via the canonical `/pipelines` endpoints.
The `/exports/pipelines` path MUST be treated as a remapped alias to `/pipelines` for backward compatibility.

### Scheduled Reports

- `GET /reports/schedules`
  - Input: status (optional)
  - Output: schedule_id, report_definition_id, status, next_run_at
- `GET /reports/schedules/{schedule_id}`
  - Input: none
  - Output: schedule details, status, next_run_at
- `POST /reports/schedules`
  - Input: report_definition_id, schedule (cron or interval), format (csv or xlsx), recipients (optional)
  - Output: schedule_id, status, next_run_at
- `POST /reports/schedules/{schedule_id}/pause`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: schedule_id, status=paused
- `POST /reports/schedules/{schedule_id}/resume`
  - Input: none
  - Output: schedule_id, status=active
- `POST /reports/schedules/{schedule_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: schedule_id, status=archived, archived_at

### Chart Definitions

- `POST /charts/definitions`
  - Input: chart_name, source_report_definition_id or source_template_id, chart_type, x_axis, y_axis, series (optional), filters (optional), group_by (optional)
  - Output: chart_id, version_id, status=draft, created_at
- `PATCH /charts/definitions/{chart_id}`
  - Input: chart_name (optional), chart_type (optional), x_axis (optional), y_axis (optional), series (optional), filters (optional)
  - Output: chart_id, version_id, updated_at
- `POST /charts/definitions/{chart_id}/activate`
  - Input: none
  - Output: chart_id, status=active, activated_at
- `POST /charts/definitions/{chart_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: chart_id, status=deprecated, deprecated_at
- `POST /charts/definitions/{chart_id}/render`
  - Input: parameters (optional)
  - Output: chart_id, chart_data, generated_at
- `POST /charts/definitions/{chart_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: chart_id, status=archived, archived_at

## Edge Cases

- Large dataset exports.
- Partial report failures.
- Saved report refers to removed or restricted fields.
- Report definition invalidated by policy or consent changes.
- Chart definition drift when underlying report changes.

## Audit & Logs

- Report requests MUST be logged.
- Downloads MUST be auditable.
- Report builder actions (create, update, delete, preview) MUST be logged.
- Report execution outcomes MUST be logged with correlation IDs and timing.
- Chart execution and export events MUST be logged.

## Open Questions

- None.

## References

- SPEC/08-operations/07-reporting-exports.md
- SPEC/03-domain/10-analytics-reporting-model.md
- SPEC/04-security/09-consent-and-data-sharing.md
- SPEC/04-security/10-data-classification-and-masking.md
- SPEC/10-data/02-logical-data-schema.md
