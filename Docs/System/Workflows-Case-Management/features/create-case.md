# Create Case (Draft)

## Description
Initiating a new Intervention for a Person or Household. This captures the intent (e.g., "Requesting Housing Support") and initial evidence.

## Component
Workflows & Case Management

## Actors / Roles
- **Case Worker**
- **Field Agent**

## Permissions
- `case.create`

## Scope Rules
- **Vertical Scope**: Created within a specific Vertical (e.g., Social Welfare).
- **Geo Scope**: Agent must cover the beneficiary.

## Preconditions
- Subject (Person/Household) must be Verified.
- Consent must be Active for the Primary Vertical.

## Main Flow
1.  **Actor**: Selects Beneficiary.
2.  **Actor**: Selects "New Case" -> "Housing Support".
3.  **Actor**: Fills Intake Form (Evidence, Needs).
4.  **Action**: Save as Draft.
5.  **Action**: Submit for Verification.
6.  **System**: Sets `status = Submitted`.

## Data Read / Written
- **Case**: Write.

## Audit & Compliance
- **Consent Check**: System blocks creation if consent is missing.

## Related Use Cases
- UC-40: New Program Launch (Beneficiary Application)

## References
- `SPEC/03-domain/05-case-intervention-model.md`
