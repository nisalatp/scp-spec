# SCP Community Center Registry: Strategy & Operations

## 1. Executive Purpose
The **Community Center Registry** is the "Local Anchor" of the platform. Its primary purpose is to model the physical locations where citizens congregate to access services, submit applications, or participate in community governance. By linking digital services to physical centers, the platform ensures that aid is not just a digital transaction but a locally grounded intervention.

## 2. Why is it Needed?
*   **Service Delivery Hubs**: Programs often require a physical site for distributions or meetings. This registry provides the "Master List" of these locations.
*   **Geographical Targeting**: Allows the system to map "Demand" (from Households) against "Supply" (Available Centers) to identify service gaps.
*   **Localized Governance**: Provides an entity to which localized policies, agents, and resources can be assigned.
*   **Offline Coordination**: Acts as the logical sync-point for Field Agents working within a specific community radius.

## 3. How it Operates (The Physical Hub)

The system operates as a **Geo-Linked Entity** within the platform's hierarchy.

### 3.1 The Hub Model
1.  **Physical-Only Enforcement**: Unlike programs or verticals, Community Centers in SCP are strictly **Physical**. "Virtual Centers" are not supported to ensure accountability for physical asset management.
2.  **Geo-Node Linkage**: Every center must be linked to one or more nodes in the **Geo Engine** (e.g., linked to a specific Village or Ward).
3.  **Governance Ownership**: Each center has a designated "Governance Owner" (either an individual or an organization) responsible for operations at that site.

### 3.2 Time-Bound Activation
Centers are not permanent by definition. They have `Active From` and `Active Until` dates, allowing for:
*   **Temporary Pop-up Centers**: For emergency relief or short-term medical camps.
*   **Lifecycle Management**: Professional de-commissioning of old sites while preserving their history for longitudinal reporting.

## 4. Operational Guardrails

### 4.1 Verification Status
A center cannot host active programs until its status is `ACTIVE` and its physical location/ownership has been verified by the tenant admin.

### 4.2 Resource Assignment
The registry prevents "Resource Ghosting" by ensuring that only one primary governance owner is responsible for the center's data integrity at any given time.

## 5. Audit & Transparency
*   **Affiliation Tracking**: If a center changes its affiliation (e.g., moving from one NGO partner to another), the platform preserves a historical log of the transfer.
*   **Location Accuracy**: Every center registration requires a verified physical address or geo-coordinate, preventing the creation of "Ghost Centers" for fraudulent budget allocation.
*   **Visit Metrics**: The system can aggregate how many unique beneficiaries were served at a specific center across different programs, providing a "Footfall" metric for community health.
