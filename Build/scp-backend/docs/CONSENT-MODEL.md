# Consent Enforcement Model

Privacy and Consent are core guarantees of the Smart Community Platform.

## The Consent PIP (Policy Information Point)
Before any PII-containing resource is returned or modified, the service MUST query the `ConsentService`.

## Enforcement Logic
1.  **Request Capture**: User requests `Person(ID=123)`.
2.  **Consent Check**: `ConsentService.verifyAccess(UserID, PersonID, Action)`.
3.  **Outcome**:
    - If Consent exists AND is valid -> Return Data.
    - If Consent is missing or expired -> Return **403 Forbidden** with `ERR_CONSENT_REQUIRED`.

## Data Retention
- Consent records MUST be immutable and versioned.
- Withdrawal of consent MUST trigger immediate "soft-deletion" or anonymization of the associated PII in operational caches.
