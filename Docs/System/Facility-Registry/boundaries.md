# Boundaries: Facility Registry

## Ownership
- **Owns**: The *Metadata* of the facility (Name, Location, Type).
- **Owns**: The *Global List* of public facilities.

## Never Owns
- **Clinical Records**: The registry knows "This is a Hospital". It does *not* hold the patients' files.

## Integration Boundaries
- **Inbound**:
    - **Ministry Import**: Bulk upload of government facility lists.
- **Outbound**:
    - **Field App**: Downloads local facility list for "Referral" dropdowns.
