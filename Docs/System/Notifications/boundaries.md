# Boundaries: Notifications & Email

## Ownership
- **Owns**: The *delivery mechanism* (Retry logic, Adapter selection).
- **Owns**: The *audit trail* of communication.

## Never Owns
- **The Message Content logic**: "Should we alert User X?" is a decision for Case Management, not Notifications. Notifications just delivers what it is told.

## Integration Boundaries
- **Inbound**:
    - **Any Service**: Can subscribe to events or call `notify()` to trigger messages.
- **Outbound**:
    - **SMTP Server**: External dependency.
    - **SMS Gateway**: External dependency.
