# Update Person Profile

## Description
Modifying demographic data (e.g., Name Correction, Phone Number change) for an existing person. For Verified records, this creates a version history and may require approval for sensitive fields.

## Component
Identity (Person Registry)

## Actors / Roles
- **Case Worker**
- **Field Agent**

## Permissions
- `person.update` (General)
- `person.update.sensitive` (Name/DOB/Gender)

## Scope Rules
- **Geo Scope**: Must cover Person's location.

## Main Flow
1.  **Actor**: Opens Person Profile.
2.  **Action**: Edits "Phone Number". Clicks Save.
3.  **System**:
    - Updates field.
    - Creates Audit Entry.
4.  **Action**: Edits "Date of Birth" (Sensitive).
5.  **System**:
    - Creates "Amendment Request" (if Role < Supervisor).
    - OR: Archives old value, sets new value, records "Reason for Change".

## Alternate / Error Flows
- **Concurrent Edit**: Optimistic Locking (Version Mismatch) fails the save.

## Data Read / Written
- **Person**: Update.

## Audit & Compliance
- **Immutable History**: Old values are never overwritten, only superseded. Code can query `GetPersonAtDate(d)`.

## Related Use Cases
- UC-12: Beneficiary Data Update

## References
- `SPEC/06-platform-core/03-person-registry.md`
