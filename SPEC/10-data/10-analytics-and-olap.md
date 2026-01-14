# SCP-SPEC-DATA-10: Analytics & OLAP (Resolved Lapse: data-mesh)

## Purpose
This document defines the strategy for Cross-Vertical Analytics and Reporting, addressing the "Data Mesh" lapse (L-03).
It introduces a Central Data Warehouse to enable performant queries across isolated vertical databases.

## Architecture

### 1. Data Store: OLAP Warehouse
*   **Technology**: Columnar Store (e.g., ClickHouse, BigQuery, Snowflake).
*   **Schema**:
    *   **Fact Tables**: `fact_beneficiary_activity`, `fact_grant_disbursement`.
    *   **Dimension Tables**: `dim_household` (SCD Type 2), `dim_location`, `dim_program`.
*   **Isolation**: Supports Row-Level Security (RLS) by TenantID and ProgramID.

### 2. ETL Pipeline
*   **Source**: Vertical Transactional DBs (PostgreSQL).
*   **Mechanism**: Change Data Capture (CDC) via Debezium -> Kafka -> Warehouse Sink.
*   **Latency**: Near real-time (< 15 mins).

## Cross-Vertical Query API
*   **Endpoint**: `/api/analytics/query`
*   **Language**: SQL-like JSON DSL.
*   **Authorization**: Policy Engine checks "Can View Analytics" permission on target dimensions.

## Use Case Support
*   **UC-25 (Women at Risk)**: Joins `Health` (Pregnancy) with `Economy` (Unemployed) and `Welfare` (No Aid).
*   **UC-29 (Impact Analysis)**: Aggregates `Grant` (Finance) vs `School Attendance` (Education).
