# Boundaries: Consent Management

## Ownership
- **Owns**: The boolean answer to "Can User U see Person P's data in Vertical V?".
- **Owns**: The storage of the "Signature" evidence.
- **Owns**: The logic for "Grace Period".

## Never Owns
- **The Data Itself**: Consent protects the Health Record, but does not store the Health Record.
- **User Permissions**: AuthZ handles Role permissions; Consent handles Subject permission.

## Integration Boundaries
- **Inbound**:
    - **AuthZ**: Calls `CheckConsent()` during evaluation.
    - **Field App**: Uploads signed forms.
- **Outbound**:
    - **Notification Service**: Sends expiry warnings.
