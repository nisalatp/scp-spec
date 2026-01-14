# Interface Requirements Catalog

This catalog defines the Data Collection Interfaces (Forms) required to support the 44 Usage Scenarios.
Each form is implemented using the Metadata-Driven Form Builder defined in `SPEC/06-platform-core/06-form-builder.md`.

## Standard Forms (Tenant Scope)

| ID | Name | Target Actor | Scope | Usage Case |
|---|---|---|---|---|
| **FB-001** | Household Registration | Registrar | Tenant | UC-18, UC-13, UC-28 |
| **FB-002** | Health Risk Assessment | Health Worker | Vertical: Health | UC-02, UC-03, UC-26 |
| **FB-003** | Student Enrollment | School Admin | Vertical: Education | UC-05, UC-06 |
| **FB-004** | Jobseeker Profile | Youth / Agent | Vertical: Economy | UC-08, UC-29 |
| **FB-007** | Grant Disbursement | Finance Officer | Vertical: Finance | UC-14, UC-17 |

## Geo-Vertical Forms (Dynamic Scope)

| ID | Name | Target Actor | Scope | Usage Case |
|---|---|---|---|---|
| **FB-005** | Sanitation Survey | Field Surveyor | Geo: WASH | UC-09 |
| **FB-006** | Disaster Damage Report | Response Team | Geo: Housing | UC-11, UC-12 |
| **FB-008** | Water Point Mapping | Planner | Geo: WASH | UC-10 |
| **FB-010** | Policy Feedback | Citizen | Geo: Governance | UC-21, UC-22 |

## Detailed Requirements

### FB-001: Household Registration
*   **Purpose**: Census / Beneficiary onboarding.
*   **Fields**: Head of HH (Person Picker), Members (Repeatable), Location (GPS), Housing Type (Enum).
*   **Validation**: Biometric Uniqueness Check (API Hook).
*   **Storage**: `Household` Entity.

### FB-005: Sanitation Survey (WASH)
*   **Purpose**: Assessing toilet coverage in a specific region.
*   **Fields**: Lat/Lon, Toilet Type, Is_Functional, Photo (Upload).
*   **Conditional**: If `Is_Functional=False`, show "Reason" dropdown.
*   **Storage**: `CustomEntity` (WASH Schema).

### FB-002: Health Risk Assessment
*   **Purpose**: NCD and Maternal Health screening.
*   **Fields**: BP, Weight, Symptoms (Multi-select), Pregnancy Status.
*   **Logic**: If `BP > 140/90`, set `Risk_Level=High`.
*   **Permissions**: Only accessible by role `Health_Worker`.
