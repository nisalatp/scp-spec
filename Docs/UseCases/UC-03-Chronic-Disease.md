# UC-03: Chronic Disease Outreach

## Goal
Identify households with members suffering from chronic diseases (e.g., Diabetes, Hypertension) within a specific geographic area to plan mobile health camps or targeted interventions.

## Actors
*   **Case Worker (Health and Environment)**: Initiates the search and plans the outreach.
*   **System**: Processes geo-queries and filters patient data.
*   **Field Agent**: Receives outreach tasks (implied follow-up).

## Preconditions
*   User is authenticated and assigned the `Case Worker` role.
*   User has scope access to the `Health and Environment` vertical and the target `Geo` location.
*   Health data has been previously collected via mobile visits or clinical system integrations.

## Main Flow
1.  **Search Initiation**: Case Worker logs into the SCP and selects the "Health and Environment" vertical dashboard.
2.  **Filter Application**: Case Worker applies filters for specific chronic conditions (e.g., "Diabetes").
3.  **Geo-Scoping**: Case Worker selects a geographic boundary (Village, District, or Custom Radius).
4.  **Data Retrieval**: The system queries the `Vertical: Health and Environment` data store, intersecting it with `Geo Engine` results.
5.  **Review**: A list of potential patients/households is displayed with risk indicators.
6.  **Action**: Case Worker creates an "Outreach Case" in the `Workflows` component and assigns it to local Field Agents.

## Alternate Paths
*   **AUTH-01: Session Expired**: User is redirected to login.
*   **SEC-01: Scope Violation**: User attempts to view data outside their assigned geo-region; system returns "Access Denied".
*   **SEC-02: Permission Denied**: User can view the list but cannot create a case (`case:create` permission missing).
*   **DATA-01: No Results**: System notifies the user that no matches were found in the selected area.

## Component Interactions
*   **Security & Access Control**: Validates vertical and geo-scope permissions.
*   **Vertical: Health and Environment**: Provides the domain-specific data and filtering logic.
*   **Geo Engine**: Provides geographic hierarchy and spatial resolution.
*   **Workflows & Case Management**: Handles the creation and tracking of the outreach intervention.
*   **Notifications**: Sends alerts to assigned Field Agents.

## Data Touched
*   `Person`: Identification of beneficiaries.
*   `HealthRecord`: Chronic disease status and medical history.
*   `Household`: Location and family context.
*   `Case`: Record of the outreach attempt.

## Audit & Compliance
*   All data access is logged with the filter criteria used.
*   PII access is restricted based on role; Case Worker sees only necessary clinical data.
*   Patient consent for outreach is verified before case creation.
