# Verify Identity

## Description
Promoting a Person Record from "Provisional" to "Verified". This indicates that an official has checked the physical proofs (ID Card, Birth Certificate) and confirmed the data is accurate.

## Component
Identity (Person Registry)

## Actors / Roles
- **Case Worker**
- **Field Manager**

## Permissions
- `person.verify`

## Scope Rules
- **Geo Scope**: Verifier must have scope over the Person's registered location.

## Preconditions
- Person record exists in `Provisional` state.
- Proof documents (Attachments) are linked (optional but recommended).

## Main Flow
1.  **Case Worker**: Views "Provisional Records" list.
2.  **Case Worker**: Opens Record. Checks attached ID photo vs. Data.
3.  **Action**: Clicks "Verify".
4.  **System**:
    - Sets `status = Verified`.
    - Locks core fields (Name, DOB, Gender) - subsequent changes require "Correction Workflow".
5.  **Audit**: Logs `PERSON_VERIFIED` by Case Worker.

## Alternate / Error Flows
- **Rejection**: Case Worker marks `Rejected` (e.g., Fake ID). Record is marked Inactive/Flagged.

## Data Read / Written
- **Person**: Update Status.

## Audit & Compliance
- **Accountability**: The Verifier is legally responsible for the accuracy of this record.

## Related Use Cases
- UC-05: Household Enrollment (Verification Step)

## References
- `SPEC/06-platform-core/03-person-registry.md`
