# Boundaries: Identity

## Ownership
- **Owns**: The global `system_guid` for every individual.
- **Owns**: The list of associated National IDs (NIC, Passport).
- **Owns**: The "Golden Record" of demographics.

## Never Owns
- **Clinical Data**: Health conditions belong to Health Vertical.
- **Financial Status**: Income/Assets belong to Economy Vertical.
- **Relationships**: Parent/Child links belong to `People-Households-Families`.

## Integration Boundaries
- **Inbound**:
    - **Field Ops**: Sends new registrations.
    - **Form Builder**: Lookup/Pre-fill person data.
- **Outbound**:
    - **Search Engine**: Updates search index when Person is modified.
