# Boundaries: Data Collection

## Ownership
- **Owns**: The `Visit` record lifecycle.
- **Owns**: The logic to "Checkout" data (Lock for offline edit) and "Checkin" (Merge).

## Never Owns
- **The Person Record**: Field Ops *updates* the Person Registry, but doesn't define what a "Person" is.
- **The Case Decision**: Field Ops collects facts; Case Management makes decisions.

## Integration Boundaries
- **Inbound**:
    - **Mobile App**: Uses `Sync API`.
- **Outbound**:
    - **Identity**: Pushes new Person registrations.
    - **Case Management**: Triggers workflow events upon Visit completion.
