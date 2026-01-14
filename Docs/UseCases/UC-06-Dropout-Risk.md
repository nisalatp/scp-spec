# UC-06: Dropout Risk

## Goal
Proactively identify students at high risk of dropping out by correlating low school attendance with household economic vulnerability (low income), enabling early intervention and support.

## Actors
*   **Program Manager (Education, Sports, and Skill Development)**: Initiates risk scans and manages intervention programs.
*   **System**: Correlates data from Education and Social Protection verticals.
*   **Case Worker**: Receives notifications for high-risk students to conduct follow-up visits.

## Preconditions
*   User is authenticated and assigned the `Program Manager` role.
*   Attendance data is synced from school management systems to the `Education, Sports, and Skill Development` vertical.
*   Household income data is available in the `Social Protection` vertical or `People` registry.

## Main Flow
1.  **Risk Parameter Selection**: Program Manager defines risk thresholds (e.g., Attendance < 80% over 3 months, Household Income < $200).
2.  **Cross-Vertical Correlation**: The system pulls attendance flags from `Vertical: Education, Sports, and Skill Development` and economic flags from `Vertical: Social Protection`.
3.  **Risk Intersection**: The `Analytics` component identifies the intersection of these sets—students who are both economically vulnerable and showing poor attendance.
4.  **Prioritization**: Students are ranked by a composite risk score.
5.  **Review**: Program Manager reviews the flagged list on the Education, Sports, and Skill Development dashboard.
6.  **Intervention Trigger**: Program Manager creates "Early Warning Cases" for top-priority students, assigning them to local Case Workers.

## Alternate Paths
*   **SEC-01: Scope Violation**: User attempts to scan a district outside their administrative jurisdiction.
*   **DATA-01: Stale Data**: System notifies the user if attendance data for certain schools has not been updated in the last 30 days.
*   **PERM-01: Case Creation Blocked**: User can see the risk report but lacks permission to initiate formal cases.

## Component Interactions
*   **Security & Access Control**: Validates access to sensitive education and economic data.
*   **Vertical: Education, Sports, and Skill Development**: Provides raw attendance data and school context.
*   **Vertical: Social Protection**: Provides household vulnerability data.
*   **Analytics Engine**: Performs the set intersection and risk scoring.
*   **Workflows & Case Management**: Manages the resulting dropout prevention cases.

## Data Touched
*   `AttendanceRecord`: Student daily/monthly attendance.
*   `HouseholdIncome`: Validated economic status.
*   `Person`: Student identification and school linkage.
*   `Case`: Record of the dropout risk intervention.

## Audit & Compliance
*   Risk scans are logged as "Decision Support Queries".
*   Access to student-level attendance is restricted to Education-specific roles.
*   Data retention policies apply to risk flags to ensure "Right to be Forgotten" for students whose attendance improves.
