# UC-07: Scholarship Targeting

## Goal
Identify students who meet both merit criteria (high grades) and means-test criteria (low household income) to award scholarships, ensuring that financial aid reaches the most deserving and vulnerable students.

## Actors
*   **Program Manager (Education, Sports, and Skill Development)**: Defines the scholarship parameters and oversees the selection process.
*   **System**: Automatically cross-references academic and economic records.
*   **Vertical Owner (Education)**: Approves the scholarship program design.
*   **Finance Manager**: Ensures availability of scholarship funds.

## Preconditions
*   User is authenticated and assigned the `Program Manager` role.
*   Academic records (grades) are available in the `Education, Sports, and Skill Development` vertical.
*   Household income data is validated in the `Social Protection` vertical or `People` registry.
*   Scholarship budget is allocated and approved.

## Main Flow
1.  **Criteria Definition**: Program Manager sets the merit threshold (e.g., GPA > 3.5) and the means-test threshold (e.g., Household Income < $300).
2.  **Merit Filtering**: System identifies all students meeting the academic threshold from `Vertical: Education, Sports, and Skill Development`.
3.  **Vulnerability Filtering**: System filters the merit list against the `Vertical: Social Protection` database to satisfy the means test.
4.  **Rank Selection**: Students are ranked by a combination of academic excellence and economic need.
5.  **Review**: Program Manager reviews the finalized list of scholars.
6.  **Award Initiation**: Program Manager triggers the award process, which creates payment schedules in the `Finance` component.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to assign scholarships to schools outside their assigned region.
*   **DATA-01: Inconsistent Records**: System flags students whose school records mismatch their household identity data for manual resolution.
*   **FIN-01: Funding Gap**: System warns if the number of eligible scholars exceeds the available scholarship budget.

## Component Interactions
*   **Security & Access Control**: Validates roles and sensitive data access permissions.
*   **Vertical: Education, Sports, and Skill Development**: Source of academic performance data.
*   **Vertical: Social Protection**: Source of household economic data.
*   **Finance**: Manages the scholarship fund, allocations, and recurring disbursement schedules.
*   **Notifications**: Alerts selected students and their families of the award.

## Data Touched
*   `Person`: Identification and demographic data.
*   `AcademicRecord`: Grades, attendance, and school enrollment.
*   `HouseholdIncome`: Economic flags.
*   `Obligation`: Recurring financial commitments (scholarship payments).

## Audit & Compliance
*   The selection logic is strictly audited to ensure zero bias.
*   Any manual overrides by the Program Manager are logged with required justification.
*   PII access for scholarship processing is restricted to "Need to Know" basis.
