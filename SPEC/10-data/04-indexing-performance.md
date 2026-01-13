# SCP-SPEC-DATA-04: Indexing and Performance

## Purpose

This document defines indexing strategies and performance considerations for SCP data stores.

## In Scope / Out of Scope

**In Scope**
- Indexing guidelines
- Query performance principles

**Out of Scope**
- Query-level tuning
- Hardware provisioning

## Definitions

- Index: Data structure improving query performance.
- Selective Index: Index on frequently filtered columns.

## Rules (MUST/SHOULD/MAY)

- Indexes MUST respect tenant isolation.
- High-cardinality fields SHOULD be indexed.
- Audit tables SHOULD use minimal indexing.
- Index creation MUST be reviewed for impact.
- Partial indexes MUST be supported where they improve performance safely.
- Standardized GIN indexes SHOULD be used for JSONB and array fields.
- Geospatial indexes SHOULD be used when geo coordinates are stored and radius queries are required.

## Edge Cases

- Index bloat over time.
- Write-heavy workloads impacting performance.

## Audit & Logs

- Index changes SHOULD be logged.
- Performance regressions MUST be recorded.

## Open Questions

- None.

## References

- SPEC/02-architecture/07-performance-and-scale.md
- SPEC/10-data/05-caching-strategy.md
