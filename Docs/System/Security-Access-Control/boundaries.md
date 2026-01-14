# Boundaries: Security & Access Control

## Ownership
- **Owns**: The "Decision Tree" (Sequence of checks).
- **Owns**: The Role definitions and assignments.
- **Owns**: The mapping of JWT Claims to SCP Context.

## Never Owns
- **Subject Data**: Does not store "Nimal's Address".
- **Consent State**: Fetches `ConsentStatus` from Consent Manager, does not master it.

## Integration Boundaries
- **Inbound**:
    - **API Gateway**: Calls `AuthZMiddleware` before hitting any controller.
- **Outbound**:
    - **Consent Manager**: "Does User X have consent for vertical Y?"
    - **Geo Engine**: "Is Location A inside GeoScope B?"
