# Data Model: Identity

## Entities

### Person
- `person_id` (GUID, PK)
- `tenant_id` (FK)
- `full_name` (String)
- `date_of_birth` (Date, Nullable)
- `age_estimate` (Int, Nullable if DOB known)
- `gender` (Enum)
- `status` (Enum: Provisional, Verified, Archive)
- `geo_node_id` (FK, Location)

### PersonIdentifier
- `identifier_id` (PK)
- `person_id` (FK)
- `type` (Enum: NIC, Passport, DL)
- `value` (String)
- `authority` (String)

## Storage Strategy
- **Relational**: High integrity required.
- **History**: Temporal tables or Audit Log for all demographic changes.

## Diagrams
- `UML/Core/system-class-diagram.puml`
