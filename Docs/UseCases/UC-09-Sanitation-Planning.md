# UC-09: Sanitation Planning

## Goal
Identify households lacking basic sanitation infrastructure (toilets) and correlate this with local waterborne disease rates to prioritize the allocation of construction grants and infrastructure projects.

## Actors
*   **Program Manager (Health and Environment)**: Oversees WASH (Water, Sanitation, and Hygiene) initiatives and approves funding.
*   **System**: Correlates infrastructure survey data with health outcomes.
*   **Case Worker**: Conducts the on-ground sanitation surveys.
*   **Finance Manager**: Manages the construction grant disbursements.

## Preconditions
*   User is authenticated as `Program Manager` for the `Health and Environment` vertical.
*   Sanitation survey data (from `Data Collection` component) is synchronized.
*   Recent health data (specifically waterborne diseases like Cholera or Typhoid) is available in the `Health and Environment` vertical.
*   Funding for sanitation projects is available in the `Finance` component.

## Main Flow
1.  **Needs Assessment**: Program Manager selects the "Sanitation Infrastructure" planning tool.
2.  **Infrastructure Filtering**: System pulls records from the `People/Household` registry for homes marked with "No Toilet" or "Substandard Sanitation".
3.  **Health Risk Mapping**: The `Health and Environment` vertical provides a heatmap of waterborne disease incidents in the corresponding geographic areas.
4.  **Priority Ranking**: The `Analytics` component ranks households based on the absence of infrastructure AND high local disease burden.
5.  **Review**: Program Manager reviews the prioritized construction list.
6.  **Grant Allocation**: Program Manager triggers the creation of "Sanitation Grants" in the `Finance` component.
7.  **Implementation**: Grants are issued to contractors or beneficiaries; `Workflows` tracks the construction progress.

## Alternate Paths
*   **SEC-01: Unauthorized Search**: User attempts to view health data without being assigned to the `Health and Environment` vertical with cross-vertical permissions.
*   **DATA-01: Survey Gap**: System warns that a certain percentage of households in a region have NOT been surveyed for sanitation.
*   **FIN-01: Insufficient Funds**: System blocks grant creation if the total requested exceeds the current WASH budget.

## Component Interactions
*   **Security & Access Control**: Validates vertical and geo scopes.
*   **Vertical: Health and Environment**: Source of sanitation and infrastructure status data, and public health risk context.*   **Finance**: Manages grant definitions and disbursements.
*   **Workflows & Case Management**: Tracks the lifecycle of the toilet construction projects.

## Data Touched
*   `Household`: Sanitation status field.
*   `HealthEvent`: Records of specific disease incidents.
*   `Grant`: Financial record of the construction aid.
*   `GeoNode`: Location of the infrastructure need.

## Audit & Compliance
*   Targeting logic is logged to ensure funds are going to the areas with the highest objective risk.
*   Grant approvals require a clear "Infrastructure Survey" as a prerequisite.
*   Post-construction verification is required before the final grant tranche is released.
