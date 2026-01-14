# Use Case Realization (Frontend)

## UC-01: Emergency Blood Matching
*   **Persona**: Doctor / Field Worker.
*   **Flow**:
    1.  Click "Emergency" Button.
    2.  Select "Blood Request". Input Type/Qty.
    3.  See Map with nearby compatible donors (Green Pins).
    4.  Tap Pin -> "Contact Donor".

## UC-05: School Supplies Donation
*   **Persona**: School Admin.
*   **Flow**:
    1.  Tab "Education". Select "Student List".
    2.  Filter "Eligible for Supplies" (Client-side filter).
    3.  Select All -> "Issue Supplies".
    4.  Scan Student QR Code to confirm receipt.

## UC-09: Sanitation Planning (WASH)
*   **Persona**: Planner (Desktop).
*   **Flow**:
    1.  Dashboard -> "WASH Extension".
    2.  View Map. Toggle "Sanitation Survey" layer.
    3.  Draw Polygon on Map.
    4.  Panel shows "Gap Analysis" charts.

## UC-18: Duplication Prevention
*   **Persona**: Registrar.
*   **Flow**:
    1.  "New Person" Wizard.
    2.  Step 1: Capture Biometric (Fingerprint/Iris).
    3.  **Spinner**: "Checking Global ID...".
    4.  Result: "Unique" (Proceed) or "Duplicate Found" (Show Profile).

## UC-25: Women at Risk Exclusion
*   **Persona**: Policy Planner.
*   **Flow**:
    1.  "Analytics" -> "Query Builder".
    2.  Drag & Drop Verticals: Education, Economy, Welfare.
    3.  Set Filters: "Unemployed", "Degree Holder", "No Aid".
    4.  Result: Table of 500 candidates. "Export to CSV".
