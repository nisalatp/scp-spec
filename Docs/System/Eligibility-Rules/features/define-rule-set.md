# Define Rule Set (Policy)

## Description
Translating a written policy (e.g., "Mothers with income < 5000") into a machine-executable format (JSONLogic). This decouples logic from code.

## Component
Eligibility Rules Engine

## Actors / Roles
- **Program Manager** (Analyst)
- **Vertical Owner**

## Permissions
- `rules.create`
- `rules.update.draft`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Attributes used in rules must exist in the Data Dictionary.

## Main Flow
1.  **Actor**: Creates Rule Set "Drought Eligibility 2024".
2.  **Actor**: Adds Logic Block:
    ```json
    { "and": [
        { "<": [ { "var": "household.income" }, 5000 ] },
        { "==": [ { "var": "person.district" }, "Galle" ] }
    ] }
    ```
3.  **Action**: Save Draft.

## Alternate / Error Flows
- **Validation Error**: Referencing undefined attribute "person.zodiac" -> Error.

## Data Read / Written
- **RuleSet**: Write.

## Audit & Compliance
- **Legibility**: Rules should be auto-translated to explanations ("Income MUST be less than 5000").

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/05-governance/04-policy-change-control.md`
