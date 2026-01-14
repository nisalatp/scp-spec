# Emergency Access (Bypass)

## Description
Accessing PII without valid Consent in life-threatening situations. Strictly restricted to ROOT level override.

## Component
Consent Management

## Actors / Roles
- **ROOT** (System Admin)

## Permissions
- `consent.bypass` (Critical)

## Scope Rules
- **Global**.

## Main Flow
1.  **Actor**: Calls API with header `X-Emergency-Reason: "Medical Emergency UUID-123"`.
2.  **System**:
    - Bypasses Consent Check.
    - Returns Data.
    - **CRITICAL AUDIT**: Logs "Emergency Access by ROOT". Sends Alerts to Privacy Officer.

## Alternate / Error Flows
- **Non-ROOT**: Immediate 403 Forbidden.

## Data Read / Written
- **Person**: Read.

## Audit & Compliance
- **Audit**: Must be justified manually later.

## Related Use Cases
- UC-01: Emergency Blood Match

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
