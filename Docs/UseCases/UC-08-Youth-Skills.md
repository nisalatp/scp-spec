# UC-08: Youth Skills Matching

## Goal
Bridge the gap between unemployed youth and local economic opportunities (jobs or vocational training) by matching individual qualifications and interests with market demand.

## Actors
*   **Case Worker**: Facilitates the matching process at the local level and supports youth in the community.
*   **System**: Automates the intersection of employment status, education history, and current job vacancies.
*   **Youth**: Beneficiary of the matching service.

## Preconditions
*   User is authenticated as a `Case Worker` with the appropriate geographic scope.
*   Education and vocational training data is available in the `Education, Sports, and Skill Development` vertical.
*   Employment status (unemployed/NEET) is tracked in the `Social Protection` vertical.
*   A "Job/Training Vacancy" registry is maintained or integrated (e.g., via `Integrations` layer).

## Main Flow
1.  **Search Initiation**: Case Worker queries for "Unemployed Youth" within their assigned district.
2.  **Profile Retrieval**: System pulls demographic and employment status from `Vertical: Social Protection`.
3.  **Skills Verification**: System cross-references profiles with `Vertical: Education, Sports, and Skill Development` to retrieve certificates, degrees, and training history.
4.  **Market Matching**: The `Analytics` component compares individual skills against active job or training vacancies.
5.  **Review & Selection**: Case Worker reviews the top matches and validates them against the current community context.
6.  **Connection**: Case Worker facilitates the connection between the youth and the employer/trainer.
7.  **Notification**: An automated notification is sent to the youth's mobile device with details of the opportunity.

## Alternate Paths
*   **SEC-01: Unauthorized Data Access**: System blocks access to youth PII if the Case Worker's scope does not cover the specific location.
*   **DATA-01: Missing Skills Profile**: System prompts Case Worker to update the youth's profile with missing educational data.
*   **INT-01: External API Failure**: Notification fails; system logs the error and retries or notifies the Case Worker for manual follow-up.

## Component Interactions
*   **Security & Access Control**: Ensures data privacy and scope-bound access.
*   **Vertical: Social Protection**: Provides the target population list (NEET/Unemployed).
*   **Vertical: Education, Sports, and Skill Development**: Provides the skills and qualification substrate.
*   **Analytics Engine**: Performs the multi-factor matching logic.
*   **Notifications**: Handles communication via SMS or Email.

## Data Touched
*   `Person`: Contact info and status.
*   `AcademicRecord`: Degrees and certifications.
*   `VocationalTraining`: Specific skills training records.
*   `Vacancy`: (Linked entity) Local job/training descriptions.

## Audit & Compliance
*   All matches are logged to track the effectiveness of different vocational programs.
*   PII visibility is minimized during the initial matching phase.
*   Youth consent is required before sharing their full profile with an employer.
