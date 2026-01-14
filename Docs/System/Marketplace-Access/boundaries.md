# Boundaries: Marketplace Access

## Ownership
- **Owns**: The *Metadata* of the relationship (Contracts, Grants).
- **Owns**: The *Workflow* of onboarding a partner.

## Never Owns
- **The Data**: The Partner views data owned by Verticals (e.g., Health Records). Marketplace just holds the *Key*.

## Integration Boundaries
- **Inbound**:
    - **Partner Portal**: Interface for NGOs to submit requests.
- **Outbound**:
    - **Identity Provider (Keycloak)**: When a grant is created, SCP configures a Client/Role in Keycloak.
