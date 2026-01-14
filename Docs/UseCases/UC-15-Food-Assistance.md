# UC-15: Food Assistance

## Goal
Efficiently target and distribute food assistance (rations or vouchers) to households whose income falls below the official poverty line, further adjusted for family size and specific nutritional needs (e.g., children or nursing mothers).

## Actors
*   **Program Manager**: Defines relief criteria and approves distribution plans.
*   **Case Worker**: Validates household composition during distribution.
*   **System**: Automates the targeting logic based on income and dependency ratios.
*   **Logistics Partner (Sub-actor)**: Receives the distribution manifest for physical delivery or voucher redemption.

## Preconditions
*   User is authenticated as `Program Manager`.
*   Household income data and member composition (age/gender) are synchronized in the `People` registry.
*   Poverty line thresholds and ration calculation rules are configured in the `Rules Engine`.

## Main Flow
1.  **Relief Initiation**: Program Manager triggers a "Food Security Assessment" for a target region.
2.  **Income Filtering**: The system identifies all households with a reported monthly income below the configured threshold from the `Economy and Livelihood` vertical.
3.  **Vulnerability Weighting**: Households with high dependency ratios (many children/elderly) or specific health flags are prioritized.
4.  **Ration Calculation**: The `Analytics` component calculates the required "Food Basket" size based on the number of residents in each qualified household.
5.  **Distribution Layout**: The system generates a "Distribution Manifest" grouped by local distribution points (e.g., community centers).
6.  **Review**: Program Manager reviews the total budget and ration volume.
7.  **Order Generation**: The system exports the manifest to the `Integrations` layer for the logistics partner or triggers digital voucher issuance.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to generate a distribution list for a region where they do not have `report:view` or `program:approve` permissions.
*   **DATA-01: Stale Income Data**: System warns if the income data for a high-priority household has not been updated in over 12 months.
*   **LOG-01: Inventory Shortfall**: If ration volume exceeds available stock (integrated via partner APIs), the system prompts the Program Manager to adjust the income threshold or priority weighting.

## Component Interactions
*   **Security & Access Control**: Manages geo-scoped access to vulnerable household lists.
*   **Vertical: Economy and Livelihood**: Core repository for socio-economic and income data.
*   **Rules Engine**: Defines the math for "Nutritional Requirements" and "Poverty Thresholds".
*   **Analytics**: Performs the heavy-lifting on ration volume and targeting intersections.
*   **Integrations**: Communicates distribution lists to external partners (NGOs, Retailers).

## Data Touched
*   `Household`: Income level, location, and size.
*   `Person`: Age and nutritional priority flags.
*   `Voucher/Grant`: Financial record of the assistance value.
*   `DistributionManifest`: Operational record for the relief cycle.

## Audit & Compliance
*   All targeting criteria are versioned and logged to ensure transparency in aid distribution.
*   The system tracks "Aid Leakage" by requiring digital confirmation (OTP or biometric) at the point of distribution.
*   Impact audits correlate subsequent health records (from `Health and Environment` vertical) with the receipt of food assistance.
