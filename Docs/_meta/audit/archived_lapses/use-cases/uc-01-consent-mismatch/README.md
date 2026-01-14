# Lapse: UC-01 Consent Granularity Mismatch

**Audit ID:** AUD-021
**Area:** Use Cases
**Status:** OPEN

## Description
Use Case `UC-01` (Emergency Blood Match) relies on a granular "EmergencyContact" consent check, which is not supported by the core Consent Model.

## Mismatch
- **SPEC (04-security/09-consent-and-data-sharing.md)**: Defines consent as "Per Person/Per Vertical". It is a coarse-grained gate (Allow Health / Deny Health).
- **Use Case (UC-01)**: Step 4 says "System verifies emergency_contact consent". This implies the user can grant "Health" consent but deny "Emergency Contact" usage.

## Impact
Implementation Gap. Developers might build a boolean Vertical Consent system, failing to support the granular privacy requirement of UC-01.

## Resolution
Either update SPEC to support "Purpose-Based Consent" (Sub-scopes), or update UC-01 to rely on generic "Health Vertical" consent.
