# Backend Architecture

## Overview
The SCP Backend is designed as a **Modular Monolith** (or coarse-grained Microservices) centered around the 5 Standard Verticals, with a "Core Platform" layer providing shared services.

### 4. Shared Services (New)
*   **GIS Service**: Handles spatial overlays and hazard checks (PostGIS).
*   **Routing Service**: Calculates travel time matrices.
*   **Simulation Engine**: Runs "What-If" policy scenarios.
*   **Data Warehouse**: Central OLAP store for cross-vertical reporting.

## Core Services

1.  **Identity & Access Management (IAM)**: Centralized user/beneficiary registry (`PersonID`).
2.  **Vertical Registry**: Managing lifecycle of dynamic Geo-Fenced Verticals.
3.  **Data Fabric**: Unified data access layer for cross-vertical queries.
4.  **Workflow Engine**: Orchestrating multi-step processes (e.g., Eligibility -> Approval -> Payment).

## Vertical Modules
Each Vertical (Health, Edu, Econ, Fin, Data) acts as a bounded context with its own:
*   **API Layer**: REST/GraphQL endpoints.
*   **Domain Logic**: Rules and Entities.
*   **Data Store**: Dedicated Schema/Service.

## Geo-Vertical Extensibility
Custom Verticals (WASH, Housing, etc.) are implemented as **Dynamic Modules**:
*   **Schema Definition**: JSON-Schema based extension.
*   **API Injection**: Auto-generated CRUD endpoints.
*   **Integration**: Webhooks for events.

## Diagram
(Reference `Docs/Diagrams/02-Container-Modular-Monolith.puml`)
