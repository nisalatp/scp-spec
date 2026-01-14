# SCP Infrastructure Project Registry: Strategy & Operations

## 1. Executive Purpose
The **Infrastructure Project Registry** is the platform's "Public Works Ledger." Its primary purpose is to maintain a high-level record of community-sized projects (e.g., building a new well, paving a road, or installing solar panels). By documenting these projects within the same platform that tracks beneficiary needs, the system allows for integrated planning—ensuring that physical infrastructure is built in the areas where it will have the maximum social impact.

## 2. Why is it Needed?
*   **Gap-Demand Mapping**: If a community records high "Water Borne Illness" in the Health vertical, planners can use the registry to see if a sanitation project is already planned or if a new one is required.
*   **Coordination & De-duplication**: Prevents "Overlapping Projects" where two different donor agencies might accidentally fund the same road or well in the same village.
*   **Donor Visualization**: Provides donors and government sponsors with a "Map of Impact," showing where their capital is being deployed and which communities are benefitting.
*   **Asset Lifecycle**: Tracks the existence of infrastructure from its initial proposal through to its decommissioning, providing a historical record of community development.

## 1. How it Operates (The Project Lifecycle)

The system operates as a **Geo-Scoped Registry** tied to the **Geo Engine**.

### 3.1 Project Geo-Coverage
A project is more than a single point on a map. It has a **Geo-Scope**:
*   A "Water Well" might be a single point, but its "Coverage" applies to a specific village node.
*   A "Road Project" might span multiple geo nodes (e.g., from Village A to Village B).
*   The system uses these links to automatically calculate which Households fall within a project's "Impact Zone."

### 3.2 Standardized Lifecycle
To maintain accountability, infrastructure projects follow a strict governance flow:
1.  **Draft**: Proposed projects with estimated scope.
2.  **Requested/Reviewed**: Local and vertical authorities verify the feasibility and community need.
3.  **Approved/Active**: The project is funded and physical work is authorized.
4.  **Suspended/Archived**: Used if funding is paused or if the project is successfully completed and enters "Cold Storage" history.

## 4. Operational Guardrails

### 4.1 Tenant Sovereignty
All infrastructure projects are strictly **Tenant-Scoped**. The registry prevents a project from spanning across country boundaries, respecting the legal and budgetary sovereignty of each nation.

### 4.2 Detecting Overlaps
The system automatically flags projects that share the same **Geo-Scope** and **Project Type** (e.g., two "Housing" projects in the same Ward). This allows administrators to intervene and coordinate between sponsors before funds are wasted.

## 5. Audit & Transparency
*   **Change History**: Every status update (e.g., from `Approved` to `Active`) is logged with the user ID and the mandatory reason cord (e.g., "Funding Secured").
*   **Vertical Tagging**: Projects are tagged to specific verticals (e.g., a Clinic build is tagged to `Health`). This ensures that only relevant officials can modify the technical details of the project.
*   **Sponsor Tracking**: The registry maintains a link to the sponsoring organization, allowing for "Follow the Money" auditing by public transparency bodies.
