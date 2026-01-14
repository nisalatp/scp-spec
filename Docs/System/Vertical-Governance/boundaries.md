# Boundaries: Verticals

## Ownership
- **Owns**: The definition of "What is Health?".
- **Owns**: The list of valid programs under its umbrella.

## Never Owns
- **The Person ID**: The Person ID is global (Tenant-level). The Vertical owns the *Vertical-Specific Data* attached to that Person (e.g., Health Record).

## Integration Boundaries
- **Inbound**:
    - **Consent**: Checks "Does Person P allow Vertical V access?".
- **Outbound**:
    - **Programs**: Defines the parent context for Programs.
