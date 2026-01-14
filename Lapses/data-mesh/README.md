# Lapse: Cross-Vertical Data Mesh

**Missing Capability**: Performant joining of data across isolated Vertical silos.

## Evidence
*   **Use Cases**: UC-25, UC-29 (Complex Multi-Vertical Queries).
*   **Spec Gap**: `SPEC/02-architecture` mandates "Modular Monolith" with isolated DBs. No strategy for efficient cross-shard/cross-db joins.

## Impact
*   **Severity**: **High**.
*   **Blocker**: Analytic queries will be extremely slow or require "API Composition" which is O(N).

## Proposed Changes
1.  **Data Warehouse**: ETL pipeline to sync Vertical Data to a central OLAP Warehouse (BigQuery/ClickHouse).
2.  **Query API**: Route complex queries to Warehouse instead of Transactional DBs.
