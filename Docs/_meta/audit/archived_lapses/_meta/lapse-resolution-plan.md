# Lapse Resolution Plan

**Objective**: Systematically eliminate identified gaps by upgrading the `SPEC` to support all 44 Usage Scenarios.

## Lapse Requirements

| ID | Lapse Name | Severity | Missing Capability | Resolution Strategy |
|---|---|---|---|---|
| **L-01** | `gis-module` | **CRITICAL** | Spatial Overlays, Hazard Mapping | **SPEC Upgrade**: Add `GIS Service` (PostGIS) to Platform Core. |
| **L-02** | `geo-extension` | **HIGH** | Dynamic Vertical Runtime | **SPEC Upgrade**: Define `Vertical Meta-Schema` & `Auto-CRUD API`. |
| **L-03** | `data-mesh` | **HIGH** | Cross-Vertical Analytics | **SPEC Upgrade**: Add `Data Warehouse` (OLAP) & ETL Pipeline strategy. |
| **L-04** | `sim-engine` | MEDIUM | Policy Simulation (What-If) | **SPEC Upgrade**: Add `Simulation Service` to Policy Engine. |
| **L-05** | `routing-engine` | MEDIUM | Travel Time Calculation | **SPEC Upgrade**: Add `Routing Service` (External Integration). |
| **L-06** | `conditional-logic` | MEDIUM | Complex Form Validation | **SPEC Upgrade**: Mandate `JSONLogic` in Form Builder. |

## Execution Plan (Phase 2: SPEC Upgrade)

### 1. Platform Core Upgrades
*   **Modify**: `SPEC/06-platform-core/06-form-builder.md`
    *   *Action*: Mandate `JSONLogic` for `conditions`.
*   **Modify**: `SPEC/02-architecture.md`
    *   *Action*: Add `GIS Service`, `Routing Service`, `Simulation Service` to "Shared Services" layer.

### 2. Data & Analytics Upgrades
*   **Modify**: `SPEC/10-data/` (Create `10-analytics-and-olap.md`)
    *   *Action*: Define Data Warehouse and Cross-Vertical Querying.
*   **Modify**: `SPEC/10-data/` (Create `11-gis-and-spatial.md`)
    *   *Action*: Define PostGIS usage and Spatial Layers.

### 3. Vertical Extensibility
*   **Modify**: `SPEC/07-verticals/` (Create `06-geo-vertical-runtime.md`)
    *   *Action*: Define the schema-driven runtime for Dynamic Verticals.

## Impact Analysis
*   **Unblocked Scenarios**: UC-09, UC-10, UC-12, UC-21, UC-25, UC-29, UC-40.
*   **Documentation Updates**: Backend (New APIs), Frontend (Map Components), Deployment (PostGIS/OLAP).
