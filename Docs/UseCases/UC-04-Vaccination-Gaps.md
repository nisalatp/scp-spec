# UC-04: Vaccination Coverage Gaps

## Goal
Analyze vaccination coverage for children under 5 across different geographic regions to identify gaps in service delivery and prioritize immunization drives.

## Actors
*   **Program Manager (Health and Environment)**: Initiates the analysis and reviews the report.
*   **System**: Aggregates data from health and population registries.
*   **Vertical Owner**: Oversees policy adjustments based on findings.

## Preconditions
*   User is authenticated and assigned the `Program Manager` role for the `Health and Environment` vertical.
*   Birth registration data and vaccination records are synced in the `Health and Environment` vertical.
*   Geographic boundaries are correctly defined in the `Geo Engine`.

## Main Flow
1.  **Analysis Request**: Program Manager selects the "Vaccination Coverage" tool in the Health and Environment dashboard.
2.  **Parameter Definition**: Specific age groups (e.g., Under 5) and vaccines (e.g., BCG, Polio) are selected.
3.  **Data Convergence**: The system pulls population data from `People` and vaccination history from `Vertical: Health and Environment`.
4.  **Gap Computation**: The `Analytics` component identifies children who have missed doses based on the national immunization schedule.
5.  **Visualization**: A heatmap or regional table is generated, showing coverage percentages.
6.  **Reporting**: Program Manager generates a detailed PDF/CSV report of identified gaps for field follow-up.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to analyze a region outside their assigned scope.
*   **DATA-01: Incomplete Records**: System warns that a percentage of the population has missing demographic data, potentially skewing results.
*   **PERM-01: Export Blocked**: User can view the dashboard but does not have the `report:export` permission.

## Component Interactions
*   **Security & Access Control**: Validates role and geo-scope.
*   **People Registry**: Provides the denominator (total child population).
*   **Vertical: Health and Environment**: Provides the numerator (actual vaccination events).
*   **Analytics Engine**: Performs the comparison and aggregation logic.
*   **Geo Engine**: Maps data to specific administrative levels.

## Data Touched
*   `Person`: Demographic info (age, location).
*   `VaccinationRecord`: Dates and types of vaccines administered.
*   `GeoNode`: Regional identifiers.

## Audit & Compliance
*   Report generation is logged as a "Sensitive Data Access" event.
*   Aggregate data is used for visualization to protect individual privacy at high levels.
*   Detailed PII lists are only available to users with explicit clinical data permissions.
