# UC-103: Process Case Intervention

## Goal
Manage a specific need or issue affecting a beneficiary through a structured, auditable lifecycle—from identification in the field to successful resolution and closure—ensuring all accountability and proof-of-service requirements are met.

## Actors
*   **Field Agent**: Identifies needs during home visits and executes the assigned intervention tasks.
*   **Case Worker**: Reviews case submissions, triages applications, monitors progress, and formally closes cases.
*   **Beneficiary**: The subject of the intervention (e.g., a child receiving nutritional support).
*   **System**: Automates task generation, status transitions, and notifications.

## Preconditions
*   The beneficiary is successfully registered in the `People` registry.
*   The "Case Type" (e.g., "Malnutrition Follow-up", "Education Grant Appeal") is predefined in the system.
*   The Field Agent and Case Worker are authenticated and have valid administrative scopes.

## Main Flow
1.  **Identification**: Field Agent identifies a need while on a household visit and creates a new case using the mobile app, attaching evidentiary photos or notes.
2.  **Submission**: Case is submitted; status becomes `SUBMITTED`.
3.  **Triage**: Case Worker reviews the case details for completeness and policy compliance. They move the case to `ACTIVE`.
4.  **Tasking**: Based on the `Case Type`, the system automatically generates a set of mandatory tasks (e.g., "Deliver Supplement Pack", "Conduct 7-day Weight Check").
5.  **Execution**: Field Agent receives notifications for the tasks, executes them in the community, and captures "Proof of Service" (e.g., biometric scan or photo).
6.  **Progress Monitoring**: Case Worker monitors real-time updates and ensures tasks are completed within the defined SLAs.
7.  **Closure**: Once all tasks are marked as complete and the desired outcome is verified, the Case Worker marks the case as `CLOSED`.

## Alternate Paths
*   **SEC-01: Unauthorized Closure**: System prevents a Case Worker from closing a case if mandatory "Proof of Service" attachments are missing.
*   **TRIAL-01: Request Info**: Case Worker finds the initial report vague and moves the case to `PENDING_INFO`, notifying the Field Agent to provide more detail.
*   **FAIL-01: Intervention Failure**: If the intervention does not resolve the issue (e.g., child still malnourished), the Case Worker can re-open the case or escalate it to a different vertical.

## Component Interactions
*   **Workflows & Case Management**: Core state machine and task management engine.
*   **Field Operations**: Driving the mobile forms and proof-of-service capture.
*   **Notifications**: Real-time alerts to staff regarding status changes and upcoming tasks.
*   **Identity (Person & Household)**: Links cases to specific beneficiaries and tracks their evolving status.
*   **Attachments & Documents**: Securely stores and versions photos, signatures, and documents.

## Data Touched
*   `Case`: Header record with status and type.
*   `Task`: Granular units of work associated with the case.
*   `Attachment`: Evidentiary media.
*   `Person`: Affected beneficiary's flags (e.g., "In-High-Risk-Protocol").

## Audit & Compliance
*   Full audit trail of all state transitions (who changed Status from X to Y and when).
*   Proof-of-Service (GPS coordinates, timestamps, and biometrics) is mandatory for high-impact interventions.
*   Closure requires a "Satisfaction Check" or "Outcome Verification" according to SPEC guidelines.
