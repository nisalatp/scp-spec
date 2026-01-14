# SCP Geo Engine: Strategy & Operations

## 1. Executive Purpose
The **Geo Engine** is the spatial and administrative anchor of the Smart Community Platform. Its primary purpose is to model the world exactly as it exists for each tenant—ranging from official government provinces to unofficial community clusters. By providing a "Dynamic Hierarchy," the Geo Engine ensures that every person, household, and facility is located precisely within a defined governance structure.

## 2. Why is it Needed?
*   **Operational Scoping**: Ensures that a Field Agent in "District A" only sees cases in "District A," preventing unauthorized data exposure across regions.
*   **Hierarchical Reporting**: Allows leaders to view metrics (e.g., poverty rates) at the Village level, then "roll them up" to the District and Provincial levels automatically.
*   **Resource Optimization**: By mapping "Social Infrastructure" (Clinics, Schools) against "Household Demand," the platform helps planners identify underserved areas.
*   **Compliance & Sovereignty**: Supports different administrative models for different nations without requiring custom code changes.

## 3. How it Operates (The Dynamic Hierarchy)

The system operates as a **Recursive Tree Structure** of "Geo Nodes."

### 3.1 Tenant-Defined Levels
Unlike traditional systems with hard-coded "City/State/Country" fields, SCP allows each tenant to define their own levels:
*   Example A: `Province` -> `District` -> `DS Division` -> `Village`.
*   Example B: `State` -> `County` -> `Block`.

### 3.2 Scoped Inheritance
The engine works closely with the Security system:
*   **Access Inheritance**: If a user is granted access to a "Parent" node, the system automatically calculates their access to all "Children" nodes.
*   **Boundary Enforcement**: The system prevents the creation of households outside of a user's assigned active nodes.

### 3.3 Geo Metrics
The engine stores "Geo-Indicators" (e.g., population density, climate risk score) at each node. This allows for:
*   **Contextual Vetting**: Comparing a household's income against the average income of their specific village node.
*   **Risk Modeling**: Identifying all families living in villages with a high "Flood Risk" metric.

## 4. Operational Guardrails

### 4.1 Stability & Re-evaluation
*   **Impact Awareness**: Changing a node's parent (e.g., a village moving to a different district) triggers an automatic system-wide re-evaluation of all case assignments and access permissions.
*   **Suspension on Drift**: If a case becomes "Out of Scope" due to a geo-reorganization, it is automatically suspended for manual review to prevent unauthorized continuation.

### 4.2 Spatial Integrity
*   **WGS84 Centroids**: All nodes support `lat/long` centroids for mapping.
*   **Disputed Status**: The engine explicitly handles "Disputed Regions" as a status, allowing for neutral data collection while legal statuses are resolved.

## 5. Audit & Transparency
*   **Versioned Geography**: The system maintains a history of administrative boundaries. You can "look back" and see what the village structure looked like five years ago for longitudinal reporting.
*   **Change Logging**: Moving or renaming a geo node is a high-privilege action that is logged with a "Reason for Change" and mandatory vertical-owner approval.
