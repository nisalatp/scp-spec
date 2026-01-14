# Data Model: Consent Management

## Entities

### ConsentRecord
- `consent_id` (PK)
- `person_id` (FK)
- `vertical_id` (FK)
- `status` (Pending, Active, Withdrawn, Rejected, Expired)
- `active_from`, `active_until`
- `grace_until`
- `evidence_ref` (Link to Document)

### ConsentHistory
- Immutable log of all state changes.

## Storage Strategy
- **Relational**: status and dates.
- **Object Store**: Evidence (images/audio).

## Diagrams
- `UML/Core/system-class-diagram.puml`
