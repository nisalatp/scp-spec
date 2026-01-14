# UC-14: Disability Support

## Goal
Streamline the application and allocation process for disability support by cross-referencing medical certifications with social welfare needs assessments, ensuring that aid (financial or assistive) is tiered according to severity and need.

## Actors
*   **Case Worker**: Manages the application intake and conducts the social needs assessment.
*   **Medical Officer (Sub-actor of Health and Environment)**: Validates and signs off on the clinical disability status.
*   **Program Manager**: Defines the benefit tiers and eligibility logic.
*   **Finance Manager**: Oversees the disbursement of recurring disability stipends.

## Preconditions
*   User is authenticated and has permissions to access both `Social Protection` and `Health and Environment` vertical data (within scope).
*   The applicant has a valid national identity record.
*   Medical records or disability certificates are digitized in the `Health and Environment` vertical.

## Main Flow
1.  **Application Intake**: Case Worker initiates a "Disability Support Application" for a specific citizen.
2.  **Health Verification**: The system queries the `Health and Environment` vertical for a valid, current disability certification.
3.  **Needs Assessment**: Case Worker completes a standardized digital form assessing the household's economic and environmental needs (e.g., accessibility requirements).
4.  **Tier Selection**: Based on the medical severity (from `Health`) and the needs assessment (from `Social Protection`), the system proposes a "Benefit Tier" (e.g., Tier 1: Basic Stipend, Tier 3: High Support + Assistive Device).
5.  **Review & Approval**: Case Worker reviews the proposed plan and submits it for final approval.
6.  **Financial Activation**: Once approved, the `Finance` component creates a recurring `Obligation` and schedules monthly disbursements.

## Alternate Paths
*   **SEC-01: Unauthorized Medical Access**: System blocks viewing of specific medical diagnosis; only the "Disability Level" flag is exposed to the Case Worker.
*   **CERT-01: Expired Certificate**: System flags that the disability certificate is expired and triggers a "Re-certification" workflow in the `Health` vertical.
*   **BEN-01: Duplicate Benefit**: System blocks approval if the applicant is already receiving a conflicting benefit (e.g., specific veteran support) based on `Social Protection` business rules.

## Component Interactions
*   **Security & Access Control**: Enforces strict PII and medical data privacy.
*   **Vertical: Health and Environment**: Provides the clinical substrate for eligibility.
*   **Vertical: Social Protection**: Provides the socio-economic context and benefit rules.
*   **Finance**: Handles the automation of recurring payments.
*   **Digital Form Engine**: Drives the standardized needs assessment and medical verification forms.

## Data Touched
*   `Person`: Bio-data and clinical identity.
*   `DisabilityRecord`: Degree of disability, type, and certificate validity.
*   `Obligation`: Recurring financial commitment records.
*   `Attachment`: Scanned medical documents and IDs.

## Audit & Compliance
*   Access to medical disability data is logged with "Purpose of Use" (POU) tracking.
*   Every change in benefit tier requires a dual-authorization (Case Worker + Manager).
*   The system performs periodic "Proof of Life" audits for ongoing disability disbursements.
