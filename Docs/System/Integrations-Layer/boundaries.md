# Boundaries: Integrations Layer

## Ownership
- **Owns**: The *pipe* to the outside world.
- **Owns**: The API keys / Certificates for external services.

## Never Owns
- **The Decision to Share**: Logic (like "Is this person eligible for payment?") belongs in Case Management, not the Integration Layer.

## Integration Boundaries
- **Inbound**:
    - **Case Management**: Requests "Pay X".
- **Outbound**:
    - **External Systems**: The actual HTTP calls.
