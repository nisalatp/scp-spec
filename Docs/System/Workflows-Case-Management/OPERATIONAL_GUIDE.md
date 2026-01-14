# SCP Workflows & Case Management: Strategy & Operations

## 1. Executive Purpose
The **Workflows & Case Management** system is the "Engine of Action" for the platform. Its primary purpose is to manage the lifecycle of an intervention—whether it is a simple health checkup or a multi-year social grant. It ensures that every interaction with a citizen is structured, policy-compliant, and moves toward a defined outcome.

## 2. Why is it Needed?
*   **Structured Service Delivery**: Prevents "Ad-hoc" aid by requiring every interaction to follow a pre-defined state machine.
*   **Compliance Enforcement**: Automatically suspends cases if dependencies (like Consent or Eligibility) fail, ensuring that nobody receives benefits they are not legally entitled to.
*   **Cross-Vertical Coordination**: Allows multiple departments (Health, Education, Social Services) to collaborate on a single "Unified Case" for a household without duplicating effort.
*   **Outcome Tracking**: Provides the data needed to see if a program is actually working (e.g., "Is this household moving from 'Crisis' to 'Stabilized' status?").

## 3. How it Operates (The Intervention Lifecycle)

The system manages cases through a series of strictly defined, non-lineal states.

### 3.1 The Standard Lifecycle
Records move through the following stages:
1.  **Draft**: Work in progress; only visible to the creator.
2.  **Submitted**: Awaiting verification of ground-truth data.
3.  **Verified**: Data is confirmed; ready for program enrollment.
4.  **Active**: The intervention is ongoing (e.g., monthly payments or weekly visits).
5.  **Stabilized**: Objectives are met; awaiting final case closure.
6.  **Closed**: The intervention is complete.

### 3.2 Automated State Triggers
The system monitors external signals to protect the case's integrity:
*   **Auto-Suspension**: If a beneficiary withdraws **Consent**, the case is instantly locked (`SUSPENDED`). No further actions or disbursements can occur.
*   **Geo-Review**: If a household moves to a different district, the case enters a `GEO_REVIEW` state until the new district's staff accepts ownership.

## 4. Operational Guardrails

### 4.1 Primary vs. Participant Verticals
*   **Primary Vertical**: Owns the case and is responsible for its progress.
*   **Participant Vertical**: Other departments can "Opt-in" to the case. They can see case data (subject to consent) and add their own sub-tasks, but they cannot close the primary case.

### 4.2 Intersection Rules
In a multi-vertical case, actions must pass the **strictest intersection** of all participating vertical policies. This prevents a "lower-security" program from accidentally exposing "higher-security" data.

## 5. Audit & Transparency
*   **Full State History**: Every transition (e.g., `Active -> Suspended`) is logged with the timestamp, the user ID who triggered it, and the mandatory **Reason Code**.
*   **Conflict Detection**: The system scans for "Duplicate Support Conflicts"—flagging cases where a household is receiving similar benefits from two different programs simultaneously.
*   **Immutable Reasons**: Once a case is suspended for a specific reason (e.g., `POLICY_SUSPENSION`), that reason cannot be changed without high-level umbrella approval, ensuring the integrity of the audit trail.
