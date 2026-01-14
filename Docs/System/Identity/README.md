# Identity (Person & Household)

## Purpose
The Identity component (Person & Household) acts as the Master Patient Index (MPI) and Social Structure Registry for the tenant. It allows for the creation, verification, and management of unique individual identities and their domestic groupings (Households).

## Responsibilities
- **Registration**: Capturing core demographics and biometric references.
- **Household Management**: Grouping persons into domestic units with a designated Head of Household.
- **Relationship Tracking**: Mapping familial links (Parent/Child, Spouse) across individuals.
- **Deduplication**: Preventing duplicate identities using NIC, Biometrics, or Fuzzy Match.
- **Verification**: Managing the status of an identity (Provisional -> Verified).

## In Scope / Out of Scope
**In Scope**:
- Core Person data (Name, DOB, Gender, IDs).
- Household definitions, Geolocation, and Head of Household.
- Relationship mapping and history.
- Verification Status and History.

**Out of Scope**:
- Case Management (handled by `Workflows & Case Management`).
- Biometric storage (Phase 2/External).

## Owned Data / Owned Policies
- **Data**: `Person`, `Household`, `Relationship`, `PersonIdentifier`.
- **Policies**: Duplicate Check Policy, Relationship Inference Policy, Household Split/Merge Rules.

## Dependent Components
- **Tenancy**: Identity is scoped to a Tenant.
- **Geo**: Persons are linked to a Geo Node (Address).
- **Security**: AuthZ controls access to Person data.

## Exposed Interfaces (APIs / Events)
- `POST /person` (Register Individual)
- `POST /households` (Create Household)
- `GET /person/{id}` (View Profile)
- `GET /persons/{id}/relationships` (Family Tree)
- Event: `PersonCreated`, `HouseholdCreated`, `MemberAdded`

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Person Registry)
- `UML/Core/system-class-diagram.puml` (Person Entity)

## Related Use Cases
- **UC-01**: Emergency Blood Match (requires ID search).
- **Household Registration**: Core entry point.

## References
- `SPEC/06-platform-core/03-person-registry.md`
- `SPEC/06-platform-core/04-household-family.md`
- `SPEC/03-domain/03-relationship-model.md`
