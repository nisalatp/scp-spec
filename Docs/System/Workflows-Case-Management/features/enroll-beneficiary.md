# Enroll Beneficiary

## Description
Registering a Person or Household into a specific Program. This creates the relationship `ProgramEnrollment`. The person must meet the Eligibility Criteria.

## Component
Programs

## Actors / Roles
- **Case Worker**
- **Field Agent**

## Permissions
- `program.enroll`

## Scope Rules
- **Geo Scope**: Agent must cover the Beneficiary's location.
- **Program Scope**: Agent must have access to the Program (via Vertical or Role).

## Preconditions
- Person Verified.
- Program Active.
- Eligibility Check Passed (System automated check).

## Main Flow
1.  **Actor**: Selects Person.
2.  **Actor**: Selects "Enroll in Drought Relief".
3.  **System**: Runs `EligibilityEngine.evaluate()`.
4.  **System (If Eligible)**: Creates `Enrollment`.
5.  **Audit**: Logs "Enrolled by [Agent]".

## Alternate / Error Flows
- **Not Eligible**: System blocks enrollment. (Can be overridden by Manager with Reason).

## Data Read / Written
- **ProgramEnrollment**: Write.

## Related Use Cases
- UC-05: Household Enrollment

## References
- `SPEC/03-domain/04-program-model.md`
