# Boundaries: Geo Engine

## Ownership
- **Owns**: The definition of "Location".
- **Owns**: The relationship between "Province" and "District".
- **Owns**: The master list of valid Geo Codes (e.g., "LK-1").

## Never Owns
- **Person's Address**: Stored in `Identity`, but *validated* against Geo.
- **Facility Details**: Stored in Facility Registry, linked to Geo.

## Integration Boundaries
- **Inbound**:
    - **Field App**: Downloads offline geo-tree for cache.
    - **Analytics**: Queries Geo Hierarchy for aggregation.
- **Outbound**:
    - **AuthZ**: Geo provides scope resolution logic.
