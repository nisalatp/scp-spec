# SCP Form Builder: Strategy & Operations

## 1. Executive Purpose
The **Form Builder** is the platform's "Data Schema Engine." Its primary purpose is to transform high-level requirements (e.g., "Collect maternal health data") into a structured, machine-readable metadata format. It ensures that every piece of data captured in the field—whether a name, a GPS coordinate, or a photo—is defined by a version-controlled schema that enforces validation and privacy rules from the moment of entry.

## 2. Why is it Needed?
*   **Decoupling Policy from Development**: Admins can update the questions in a survey without requiring a software developer to change the database schema.
*   **Portability**: By using the **JSONLogic** standard, the same form logic can be evaluated on a web browser, an Android phone, or a backend server, ensuring consistent behavior across all devices.
*   **Regulatory Compliance**: Fields are tagged with "Sensitivity Classifications" (PII, Medical, etc.) within the builder, allowing the Security system to automatically mask data based on the user's role.
*   **Scientific Accuracy**: The system allows for "Baseline" vs. "Outcome" form types, enabling researchers to measure the real-world impact of interventions over time.

## 3. How it Operates (The Metadata Engine)

The system operates as a **Versioned Schema Registry**.

### 3.1 Form Lifecycle
Forms are treated as first-class governance entities:
1.  **Draft**: Design phase where fields and logic are defined.
2.  **Requested/Reviewed**: Subject matter experts (e.g., Doctors or Financial Officers) verify the appropriateness of the questions.
3.  **Active**: The form is pushed to field agents for data collection.
4.  **Deprecated**: Used when a form is replaced. No new records can be created, but historical records remain visible for longitudinal analysis.

### 3.2 Submission Versioning (The Gold Standard)
To ensure the integrity of social protection data, SCP implements strict versioning:
*   **Pinned Versions**: Every submission is "Pinned" to a specific version of a form. Even if the form is updated tomorrow, the old record remains tied to the version that was active during its capture.
*   **Submission Immutability**: Verified submissions cannot be edited "in-place." Any change creates a **New Submission Version**, which must be re-verified by a Case Worker, preserving a complete audit trail of how information changed.

## 4. Operational Guardrails

### 4.1 "Capture-Time" Validation
The Form Builder enforces rules before data leaves the field:
*   **Type Safety**: Prevents entering letters into a "Phone Number" or "Age" field.
*   **Logic Guards**: Prevents "Impossible Data" combinations (e.g., Pregnancy=Yes for Gender=Male) through JSONLogic cross-field validation.

### 4.2 Vertical Scoping
Forms can be scoped to a specific Vertical. This ensures that a Case Worker in "Education" cannot accidentally use a private "Health" form for one of their cases.

## 5. Audit & Transparency
*   **Schema History**: Every change to a form definition is logged. You can see exactly which question was added, who approved it, and why.
*   **Metadata Completeness**: The system tracks if a submission contains mandatory fields. Records with missing data are flagged as "Incomplete," preventing them from being used for eligibility or financial payouts.
*   **Verification Tracking**: The system records the user ID who verified a submission against the form's specific ruleset, ensuring clear accountability for data quality.
