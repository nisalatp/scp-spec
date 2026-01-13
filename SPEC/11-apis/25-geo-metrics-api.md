# SCP-SPEC-API-25: Geo Metrics API

## Purpose

This document defines APIs for geo metric definitions and value ingestion.

## In Scope / Out of Scope

**In Scope**
- Geo metric definitions
- Geo metric value ingestion
- Geo metric querying

**Out of Scope**
- External data acquisition pipelines

## Definitions

- Geo Metric: A named indicator measured at a geo node.
- Geo Metric Value: A time-bound value for a geo metric.

## Rules (MUST/SHOULD/MAY)

- Geo metric APIs MUST enforce tenant isolation.
- Metric definitions MUST be versioned and auditable.
- Metric values MUST be time-bound and reference geo nodes.
- External data sources MUST be tagged in metric values when used.

## API Endpoints

### Metric Definitions

- `GET /geo/metrics/definitions`
  - Input: status (optional)
  - Output: metric_id, metric_code, metric_name, status
- `POST /geo/metrics/definitions`
  - Input: metric_code, metric_name, unit, data_type, source_type, status
  - Output: metric_id, status=draft, created_at
- `PATCH /geo/metrics/definitions/{metric_id}`
  - Input: metric_name (optional), unit (optional), data_type (optional), source_type (optional), status (optional)
  - Output: metric_id, updated_at, version_id
- `POST /geo/metrics/definitions/{metric_id}/activate`
  - Input: none
  - Output: metric_id, status=active, activated_at
- `POST /geo/metrics/definitions/{metric_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: metric_id, status=deprecated, deprecated_at
- `POST /geo/metrics/definitions/{metric_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: metric_id, status=archived, archived_at

### Metric Values

- `POST /geo/metrics/values`
  - Input: metric_id, geo_id, value, value_date, source_ref (optional), status
  - Output: metric_value_id, status, created_at
- `GET /geo/metrics/values`
  - Input: metric_id, geo_id (optional), from_date (optional), to_date (optional)
  - Output: metric_value_id, geo_id, value, value_date, status
- `POST /geo/metrics/values/{metric_value_id}/correct`
  - Input: value, reason_code, reason_text (required if OTHER)
  - Output: metric_value_id, status=corrected, corrected_at

## Edge Cases

- Metric value updates after reports are generated.
- Missing geo nodes for metric ingestion.

## Audit & Logs

- Metric definition changes MUST be logged.
- Metric value ingestion MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/02-geo-engine.md
