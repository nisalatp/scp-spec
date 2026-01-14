# Define Budget

## Description
Allocating funds to a specific Program or Vertical. This sets the "Cap" for pledges.

## Component
Finance

## Actors / Roles
- **Program Manager**
- **Finance Officer**

## Permissions
- `finance.budget.manage`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Program Active.

## Main Flow
1.  **Actor**: Selects Program "Drought Relief".
2.  **Actor**: Adds Budget Line "Cash Grants".
3.  **Actor**: Enters Amount "$1,000,000".
4.  **Action**: Save.
5.  **System**: Creates `BudgetEnvelope`.

## Data Read / Written
- **Budget**: Write.

## Audit & Compliance
- **Audit**: All changes logged.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/07-verticals/05-vertical-budgets.md`
