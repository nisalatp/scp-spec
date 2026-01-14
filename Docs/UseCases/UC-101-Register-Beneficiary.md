# UC-101: Register Beneficiary

## Goal
To record the identity, biometrics, and consent of a citizen in the platform’s national/tenant registry, enabling them to participate in social protection programs and ensuring a single source of truth for eligibility.

## Actors
*   **Field Agent**: The primary operator who captures the data on-ground via a mobile device.
*   **Beneficiary**: The citizen being registered.
*   **System**: Perfroms deduplication and validates data against national standards.
*   **Consent Manager**: Component that validates and archives the legal consent obtained during registration.

## Preconditions
*   Field Agent is authenticated on the SCP mobile app with a valid geolocation scope.
*   The platform’s `Identity (Person & Household)` and `Deduplication` services are active.
*   Data privacy policies are configured and ready for presentation to the beneficiary.

## Main Flow
1.  **Identity Initiation**: Field Agent selects "Register New Person" and performs a quick lookup using existing identifiers (e.g., NIC number) to prevent immediate duplicates.
2.  **Bio-Data Capture**: Agent records basic information: Name, DOB, Gender, and Residency details.
3.  **Biometric Enrollment**: Agent captures the required biometrics (e.g., facial photo or fingerprints) as defined by the tenant's security policy.
4.  **Consent Processing**: The system presents the mandatory data privacy and usage policy. The Beneficiary provides digital or paper-based consent, which the Agent records.
5.  **Deduplication (Online)**: If online, the system performs a real-time fuzzy match against the registry.
6.  **Submission**: Data is transmitted to the `Identity (Person & Household)` component.
7.  **Verification Status**: If no conflicts are found, the record is marked as `VERIFIED`. If potential matches exist, it is marked as `PROVISIONAL` for manual review.

## Alternate Paths
*   **SEC-01: Identity Conflict**: System identifies a high-confidence duplicate. It blocks the new registration and prompts the Agent to update the existing record instead.
*   **OFF-01: Offline Registration**: If no connectivity, data is stored in the app’s encrypted local storage and queued for sync once back online.
*   **CONS-01: Consent Refusal**: If the beneficiary refuses consent, the system blocks the registration process according to the platform's "Governance Pillar".

## Component Interactions
*   **Identity (Person & Household)**: Manages the persistent registry and unique identifiers.
*   **Deduplication Engine**: Performs the logic for conflict detection.
*   **Consent Manager**: Handles the legal and cryptographic proof of consent.
*   **Field Operations**: Facilitates the on-ground data entry and offline storage.
*   **Security & Access Control**: Ensures only authorized agents can capture and transmit PII.

## Data Touched
*   `Person`: Core identity, demographics, and status.
*   `BiometricTemplate`: Encrypted representation of physical traits.
*   `ConsentRecord`: Linking the person to a specific privacy policy version.
*   `AuditLog`: Record of the registration event.

## Audit & Compliance
*   All PII is encrypted at rest and in transit.
*   The system tracks the GPS location and timestamp of every registration for audit verification.
*   Biannual audits are performed to verify the validity of stored consent records.
