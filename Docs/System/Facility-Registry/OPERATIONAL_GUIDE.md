# SCP Facility Registry: Strategy & Operations

## 1. Executive Purpose
The **Facility Registry** is the platform's "Social Infrastructure Catalog." Its primary purpose is to maintain a high-quality, verified inventory of service locations—such as hospitals, schools, shelters, and water points. By mapping these facilities against population demand, the system enables sophisticated analysis of service access, travel distance, and capacity planning.

## 2. Why is it Needed?
*   **Access Gap Analysis**: Allows planners to see which households are too far (e.g., >5km) from a secondary school or a health clinic.
*   **Referral Management**: When a Case Worker needs to refer a person for treatment, the registry provides the list of nearby facilities that actually offer the required service.
*   **Emergency Response**: In a disaster, the registry provides the coordinates for the nearest available shelters or distribution points.
*   **Inter-Vertical Coordination**: Schools (Education) can be used as vaccination centers (Health); the registry manages these cross-domain service tags.

## 3. How it Operates (The Infrastructure Inventory)

The system operates as a **Service-Tagged Registry** with links to the **Geo Engine**.

### 3.1 Facility Capabilities (Service Tagging)
A facility is more than just a name and location. It is defined by its **Services**:
*   A "General Hospital" (Facility) might have tags for `Maternity`, `Surgery`, and `Vaccination`.
*   A "Primary School" might have tags for `Meal Program` and `Special Needs`.
*   These tags are versioned, allowing the system to track when a facility adds or loses a specific capability.

### 3.2 The Infrastructure Lifecycle
To ensure data quality, facilities follow a rigorous workflow:
1.  **Draft**: Preliminary data entered.
2.  **Requested/Reviewed**: Local authorities verify the existence and details of the facility.
3.  **Approved/Active**: The facility becomes visible for referrals and spatial analysis.
4.  **Suspended/Deprecated**: Used when a facility is temporarily closed for repairs or permanently replaced.

## 4. Operational Guardrails

### 4.1 Geo-Anchoring
Facilities MUST be linked to a node in the **Geo Engine**. This ensures that searches (e.g., "Find all clinics in District X") are consistent with the platform's administrative boundaries.

### 4.2 Vertical Ownership
Facilities can be "Owned" by a specific Vertical (e.g., a Clinic is owned by Health). While other verticals can *see* the facility for spatial analysis, only the owner vertical can update its service capability tags.

## 5. Audit & Transparency
*   **Coordinate Verification**: The system tracks if a facility's `lat/long` was captured via GPS on-site or estimated via map. Estimated coordinates are flagged with a "Lower Confidence" warning for spatial analysts.
*   **Service Integrity**: Changes to a facility's services (e.g., "No longer providing maternity care") are logged with a reason code, preserving the historical record of অবকাঠামো performance.
*   **Capacity Reporting**: The registry can be used as a backend for aggregate capacity reports, helping donors see the impact of their infrastructure investments over time.
