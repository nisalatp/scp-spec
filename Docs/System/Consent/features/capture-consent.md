# Capture Consent

## Description
Recording a beneficiary's explicit permission to share data with a specific Program or Vertical. Requires linking to a Verified Identity and capturing evidence (Signature/Photo).

## Component
Consent Management

## Actors / Roles
- **Field Agent** (Offline/Online)
- **Case Worker**

## Permissions
- `consent.capture`
- `consent.capture.offline`

## Scope Rules
- **Vertical Scope**: Consent is specific to a Vertical (e.g., "Health"). Granting "Health" consent does not grant "Finance" consent.

## Preconditions
- Person Record must be Verified (or captured in same offline session).

## Main Flow
1.  **Actor**: Selects Person.
2.  **Actor**: Starts "Grant Consent" for "Social Protection Vertical".
3.  **Actor**: Explains Terms.
4.  **Actor**: Captures Evidence (Photo of Signed Form).
5.  **Actor**: Sets `Active Until` (typically 1 year or Policy Default).
6.  **System**:
    - Stores `ConsentRecord` (Status: Pending).
    - Stores Evidence.
7.  **Audit**: Logs `CONSENT_CAPTURED`.

## Alternate / Error Flows
- **Offline**: Stored locally. Uploaded on Sync.

## Data Read / Written
- **ConsentRecord**: Write.
- **Attachment**: Write (Evidence).

## Audit & Compliance
- **GDPR/PDPA**: This record is the legal basis for all subsequent processing.

## Related Use Cases
- UC-05: Household Enrollment

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
