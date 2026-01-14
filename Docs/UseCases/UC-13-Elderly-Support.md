# UC-13: Elderly Support (Isolated Elderly)

## Goal
Identify elderly citizens (Age > 70) living alone in the community to proactively schedule welfare checks, ensure they have access to basic services, and mitigate the risks of social isolation.

## Actors
*   **Case Worker**: Responsible for identifying isolated elderly and conducting on-ground welfare checks.
*   **System**: Correlates demographic and household data to flag individuals at risk.
*   **Program Manager**: Oversees the welfare check program and assigns regional resources.

## Preconditions
*   User is authenticated as a `Case Worker` with a defined geographic scope.
*   The `People/Household` registry contains accurate age and household composition data.
*   The `Social Protection` vertical is configured to handle elderly welfare indicators.

## Main Flow
1.  **Isolation Scan**: Case Worker initiates a search for "Isolated Elderly" within their assigned district.
2.  **Multifactor Filtering**: The system filters the `People` registry for persons over age 70 AND where the associated `Household` has a size of 1.
3.  **Vulnerability Ranking**: system ranks the list based on additional factors (e.g., distance from nearest health center, length of time since last visit).
4.  **Task Creation**: The `Workflows` component automatically generates "Welfare Check" tasks for the flagged individuals.
5.  **Field Execution**: Case Worker receives the tasks on their mobile device and conducts the home visits.
6.  **Status Logging**: Case Worker logs the outcome of the visit (e.g., "Stable", "Requires Intervention", "Moved").
7.  **Follow-up**: If intervention is required, a new sub-case is created (e.g., for health services or food aid).

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to view solo-household data for individuals outside their assigned area.
*   **DATA-01: Incomplete HH Data**: System warns that several elderly persons are not correctly linked to any household, preventing isolation analysis for them.
*   **VISIT-01: Beneficiary Refusal**: If the elderly person refuses the welfare check, the Case Worker logs the refusal and notifies the Program Manager for policy compliance review.

## Component Interactions
*   **Security & Access Control**: Ensures that sensitive demographic and living-status data is protected.
*   **People & Household Registry**: The source of truth for age and residency status.
*   **Vertical: Social Protection**: Provides the business logic for isolation risk assessment.
*   **Workflows & Case Management**: Manages the lifecycle of the welfare tasks and resulting interventions.
*   **Data Collection**: Captures the results of the on-ground welfare checks.

## Data Touched
*   `Person`: Age and contact details.
*   `Household`: Composition and location.
*   `Case/Task`: Record of the welfare check.
*   `VisitLog`: Narrative and status of the interaction.

## Audit & Compliance
*   All welfare check triggers and outcomes are logged to ensure no vulnerable citizen is missed.
*   Access to "Living Alone" status is considered sensitive and is restricted to roles with a direct care mandate.
*   The system tracks the frequency of visits to ensure compliance with the "Minimum Care standards" defined in the SPEC.
