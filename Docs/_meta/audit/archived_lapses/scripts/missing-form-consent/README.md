# Lapse: Missing Consent Capture in Forms

**Audit ID:** AUD-024
**Area:** Scripts
**Status:** OPEN

## Description
The Sri Lanka Form Scripts (e.g., `01-birth-registration`) lack explicit fields to capture Consent (Active From/Until/Scope) as required by the SPEC for data processing.

## Mismatch
- **SPEC (04-security/09-consent-and-data-sharing.md)**: "Consent MUST be captured... to process data." "Consent capture MUST be performed... and MUST be verified."
- **Script**: Captures signature (`informant_declaration`) but no structured Consent Record binding.

## Impact
Privacy Violation. Data is collected without a governable Consent Record, making future "Consent Withdrawal" or "Expiration" unmanageable.

## Resolution
Add a standard `Consent` section to all forms, binding to the `Consent` entity.
