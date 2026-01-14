# Define Program (Design)

## Description
Designing the structure of an aid initiative. This includes defining the Target Audience (Who), the Benefits (What), and the Duration (When).

## Component
Programs

## Actors / Roles
- **Program Manager** (Designer)
- **Vertical Owner**

## Permissions
- `program.create`
- `program.update.draft`

## Scope Rules
- **Vertical Scope**: Must belong to a Primary Vertical.
- **Geo Scope**: Can be limited to specific Districts.

## Preconditions
- Primary Vertical must exist.

## Main Flow
1.  **Actor**: Creates New Program "Drought Relief 2024".
2.  **Actor**: Assigns Vertical "Social Welfare".
3.  **Actor**: Sets Geo Scope "Polonnaruwa District".
4.  **Actor**: Links Eligibility Rule "Income < 5000".
5.  **Action**: Submit for Review.

## Data Read / Written
- **ProgramDefinition**: Write.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/03-domain/04-program-model.md`
