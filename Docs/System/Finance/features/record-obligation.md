# Record Obligation (Pledge)

## Description
Committing funds to a specific beneficiary. This reserves money from the budget but does not disperse it yet.

## Component
Finance

## Actors / Roles
- **Case Worker**
- **System** (Automatic)

## Permissions
- `finance.pledge.create`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Case in `Active` status.
- Budget Available.

## Main Flow
1.  **Event**: Case Approved ("Grant $500").
2.  **System**: Checks Budget Availability.
3.  **System (If Yes)**: Creates `FinancialObligation` (Status: Committed).
4.  **System**: Decrements Available Budget.

## Alternate / Error Flows
- **Budget Exceeded**: System blocks approval.

## Data Read / Written
- **FinancialObligation**: Write.
- **Budget**: Update.

## Related Use Cases
- UC-41: Supervisor Review

## References
- `SPEC/03-domain/11-finance-model.md`
