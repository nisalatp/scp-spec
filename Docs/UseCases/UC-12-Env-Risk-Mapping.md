# UC-12: Environmental Risk Mapping

## Goal
Perform spatial analysis to identify households located in high-risk environmental zones (e.g., flood plains, landslide-prone areas) and correlate this with resident-level health and vulnerability data to generate prioritized evacuation and disaster preparedness plans.

## Actors
*   **Program Manager (Health and Environment)**: Initiates risk mapping and coordinates with disaster management teams.
*   **Vertical Owner**: Approves regional disaster preparedness policies.
*   **System**: Processes high-volume spatial overlays and health data intersections.
*   **Case Worker**: Notifies high-risk households during pre-disaster mobilization.

## Preconditions
*   User is authenticated and assigned to the `Health and Environment` vertical.
*   Environmental hazard maps (GeoJSON or Raster) are uploaded to the `Geo Engine`.
*   Household location data is accurate and up-to-date.
*   Health vulnerability data (disability status, chronic conditions) is available in the `Health and Environment` vertical.

## Main Flow
1.  **Hazard Identification**: Program Manager selects or uploads an environmental hazard map (e.g., 100-year Flood Zone).
2.  **Spatial Intersection**: The system uses the `Geo Engine` to identify all households located within the hazard polygon.
3.  **Vulnerability Correlation**: The system cross-references at-risk households with the `Health and Environment` vertical to identify "Medically Fragile" or high-vulnerability residents (e.g., oxygen-dependent, non-mobile).
4.  **Priority Generation**: `Analytics` component produces an evacuation priority list, ranking households by both hazard severity and individual vulnerability.
5.  **Resource Planning**: Program Manager reviews the list to determine resource requirements (e.g., ambulances, temporary shelters).
6.  **Plan Activation**: The final evacuation plan is shared with local authorities and emergency responders.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to run risk analysis on a region outside their assigned administrative boundary.
*   **DATA-01: Low Geo-Accuracy**: System warns that a percentage of household locations have low GPS accuracy (e.g., cell-tower based), potentially affecting the polygon intersection results.
*   **INT-01: Weather API Integration**: (Optional) System pulls real-time rainfall data to trigger automated risk warnings; if API fails, system falls back to manual trigger.

## Component Interactions
*   **Security & Access Control**: Validates vertical, geo, and cross-vertical data access.
*   **Geo Engine**: Performs the core spatial overlay and polygon intersection logic.
*   **Vertical: Health and Environment**: Repository of hazard, topographical data, and human vulnerability context.*   **Notifications**: Triggers SMS alerts to households in the identified risk zone.

## Data Touched
*   `Household`: Geographic coordinates and structural type.
*   `Person`: Medical status and age.
*   `HazardMap`: (Linked entity) Spatial representation of risks.
*   `GeoNode`: District and village mapping.

## Audit & Compliance
*   All risk analysis parameters (the hazard polygons used) are logged to ensure evidence-based decision making.
*   PII access during evacuation planning is strictly controlled; only necessary medical info is shared with responders.
*   The system maintains a history of hazard mappings to track changes in regional vulnerability over time.
