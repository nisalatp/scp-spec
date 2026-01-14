# UC-11: Housing Repair

## Goal
Coordinate post-disaster or structural safety interventions by identifying damaged houses and prioritizing repairs for households with highly vulnerable residents (elderly, disabled), ensuring safe living conditions.

## Actors
*   **Program Manager (Health and Environment)**: Oversees the prioritization and grant approval process.
*   **Field Agent**: Conducts on-ground structural damage assessments.
*   **System**: Cross-references damage reports with vulnerability indices.
*   **Finance Manager**: Manages the release of emergency repair grants.

## Preconditions
*   User is authenticated as `Program Manager` or `Field Agent`.
*   Post-disaster survey data is being collected via the `Data Collection` component.
*   Vulnerability status (Elderly, Disability) is mapped in the `Social Protection` vertical.
*   Emergency funds are activated in the `Finance` component.

## Main Flow
1.  **Damage Reporting**: Field Agents submit damage assessments for specific households using mobile forms.
2.  **Structural Flagging**: System filters for homes marked as "Unsafe" or "Significant Damage".
3.  **Vulnerability Overlay**: System cross-references the list with `Vertical: Social Protection` to see if any residents are elderly, disabled, or have special needs.
4.  **Priority Scoring**: `Analytics` component produces a priority list where "Unsafe + Vulnerable" home repairs are ranked highest.
5.  **Review**: Program Manager reviews the prioritized list and cost estimates.
6.  **Grant Approval**: Program Manager approves the repair grants in batches.
7.  **Fund Release**: `Finance` component initiates the disbursement of emergency aid or contractor payments.

## Alternate Paths
*   **SEC-01: Unauthorized Territory**: User attempts to view or approve damage reports for a region outside their assigned scope.
*   **DATA-01: Duplicate Report**: System flags potential duplicate damage reports for the same household for manual deduplication.
*   **FIN-01: Exhausted Emergency Fund**: System warns if the total required exceeds the currently active emergency budget.

## Component Interactions
*   **Security & Access Control**: Ensures that access to sensitive household vulnerability data is scoped correctly.
*   **Data Collection**: Entry point for field damage reports.
*   **Vertical: Health and Environment**: Repository for housing structural data.
*   **Vertical: Social Protection**: Provides the human vulnerability context.
*   **Finance**: Manages grant lifecycle and disbursement constraints.

## Data Touched
*   `Household`: Structural status and damage severity.
*   `Person`: Age and disability status.
*   `Grant`: Record of financial aid.
*   `GeoNode`: District or Village level mapping.

## Audit & Compliance
*   All damage assessments and priority calculations are logged for auditability (to prevent favoritism).
*   Evidence of damage (photos, signatures) is required as a prerequisite for grant approval.
*   Grant utilization is tracked via post-repair visit reports.
