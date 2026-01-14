# UC-05: School Supplies

## Goal
Identify students from low-income households with active school enrollment to provide them with school supplies (via vouchers or direct financial aid) ensuring equity and targeting efficiency.

## Actors
*   **Program Manager (Education, Sports, and Skill Development)**: Designs the program, sets eligibility criteria, and approves the disbursement.
*   **System**: Automates eligibility check and budget validation.
*   **Field Agent**: Performs on-ground verification of student status if required.
*   **Finance Manager**: (Secondary) Oversees the actual fund movement.

## Preconditions
*   User is authenticated as `Program Manager`.
*   Household income data is up-to-date in the `System`.
*   Education, Sports, and Skill Development vertical has active links to school enrollment registries.
*   Budget is allocated for the education sector.

## Main Flow
1.  **Program Initiation**: Program Manager selects the "School Supplies Initiative" template.
2.  **Targeting**: Manager sets criteria (e.g., Household Income < $500, Age 6-18, Region = 'South').
3.  **Eligibility Verification**: The system queries the `People` registry for income and the `Vertical: Education, Sports, and Skill Development` for enrollment status.
4.  **Rule Application**: `Eligibility Rules` engine applies parity rules (e.g., 50/50 gender split).
5.  **Budgeting**: The `Finance` component calculates the total requirement and checks against available budgets.
6.  **Approval**: Program Manager reviews the final list and approves the disbursement.
7.  **Disbursement**: System generates vouchers or triggers bank transfers; `Notifications` are sent to beneficiaries.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to allocate funds for a region they do not manage.
*   **FIN-01: Budget Exceeded**: System blocks approval if the calculated amount exceeds the allocated budget.
*   **PERM-01: Unauthorized Approval**: User has `program:create` but not `program:approve` permission.

## Component Interactions
*   **Security & Access Control**: Validates roles and vertical/geo scopes.
*   **Vertical: Education, Sports, and Skill Development**: Manages school-specific data and enrollment links.
*   **People Registry**: Provides household context and economic data.
*   **Finance**: Handles budget checks, obligations, and disbursement records.
*   **Integrations**: (Optional) Connects to school systems or banking APIs.

## Data Touched
*   `Person`: Age, gender, relationship to household.
*   `Household`: Economic indicators.
*   `EnrollmentRecord`: School ID and attendance status.
*   `Obligation`: Financial commitment per student.

## Audit & Compliance
*   Every eligibility evaluation is logged for transparency.
*   Budget approvals require double-verification (Manager + Finance) for large amounts.
*   Disbursement success/failure is tracked per beneficiary.
