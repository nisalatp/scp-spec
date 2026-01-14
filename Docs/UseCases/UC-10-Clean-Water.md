# UC-10: Clean Water Access

## Goal
Identify areas where households have poor access to safe water sources (based on distance thresholds) and correlate these gaps with health data to prioritize the construction of new water points or infrastructure repairs.

## Actors
*   **Program Manager (Health and Environment)**: Strategizes water access interventions and site selection.
*   **System**: Performs spatial analysis and health data correlation.
*   **Case Worker**: Validates water source functionality on the ground.
*   **Vertical Owner**: Oversees regional water security policies.

## Preconditions
*   User is authenticated as `Program Manager`.
*   Water point registry (locations and status) is maintained in `Vertical: Health and Environment`.
*   Household location data is synchronized in the `Geo Engine`.
*   Health datasets (waterborne disease cases) are accessible in the `Health and Environment` vertical.

## Main Flow
1.  **Access Scan**: Program Manager initiates a "Water Gap Analysis" for a specific administrative region.
2.  **Radius Calculation**: The system identifies all "Safe Water Sources" and calculates a service radius (e.g., 200m) for each.
3.  **Gap Identification**: `Geo Engine` identifies households falling outside the safe water service radii (the "Unserved Population").
4.  **Health Correlation**: The `Health and Environment` vertical provides data on disease incidents (e.g., Diarrhea, Dysentery) in these unserved clusters.
5.  **Hotspot Mapping**: The system generates a "Water Risk Map" highlighting areas with high population density, long distances to water, AND high disease rates.
6.  **Site Selection**: Program Manager uses the map to propose the most impactful sites for new wells or piped water extensions.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to view health statistics for a region outside their geographic mandate.
*   **DATA-01: Source Failure**: System flags "Safe Sources" that have a reported malfunction or poor water quality test in the last 3 months, temporarily excluding them from the service radius.
*   **PERM-01: Configuration Denied**: User can view the gaps but cannot formally "Propose Project" due to lack of `vertical:configure` permission.

## Component Interactions
*   **Security & Access Control**: Manages role-based and scope-based permissions.
*   **Vertical: Health and Environment**: Repository of water infrastructure, quality data, and public health outcomes.*   **Geo Engine**: Provides the core spatial intersection and distance calculation logic.
*   **Data Collection**: Feeds real-time infrastructure status updates from field audits.

## Data Touched
*   `WaterPoint`: Location, type, and operational status.
*   `Household`: Geographic coordinates.
*   `HealthEvent`: Local disease burden records.
*   `GeoNode`: Regional hierarchy.

## Audit & Compliance
*   Spatial queries are logged to maintain a record of the evidence base used for infrastructure decisions.
*   Environmental impact assessments (EIA) are triggered as a mandatory next step in the `Workflows` component once a site is selected.
*   Accessibility targets (e.g., "% of population within 200m") are tracked as regional performance metrics.
