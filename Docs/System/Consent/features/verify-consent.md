# Verify Consent

## Description
Back-office validation of captured consent. Ensuring the signature matches and the form is valid. Until verified, the Consent is "Pending" and grants NO access.

## Component
Consent Management

## Actors / Roles
- **Case Worker**
- **Field Manager**

## Permissions
- `consent.verify`

## Scope Rules
- **Geo/Vertical**: Actor must have scope over the Person and the Vertical.

## Preconditions
- Consent is in `Pending` state.

## Main Flow
1.  **Actor**: Views Pending Consents.
2.  **Actor**: Checks Evidence (Photo).
3.  **Action**: Clicks "Verify".
4.  **System**:
    - Sets `status = Active`.
    - Enables Data Sharing for that Vertical.
5.  **Audit**: Logs `CONSENT_VERIFIED`.

## Alternate / Error Flows
- **Rejection**: Evidence Unclear -> Mark `Rejected`. Access remains blocked.

## Data Read / Written
- **ConsentRecord**: Update Status.

## Audit & Compliance
- **Four Eyes Principle**: Ideally, the verifier is different from the capturer.

## Related Use Cases
- UC-05: Household Enrollment (Back office step)

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
