# View Financial Status

## Description
Monitoring the burn rate and outstanding obligations of a program.

## Component
Finance

## Actors / Roles
- **Finance Officer**
- **Program Manager**

## Permissions
- `finance.report.view`

## Scope Rules
- **Vertical Scope**.

## Main Flow
1.  **Actor**: Opens Dashboard.
2.  **System**: Aggregates Pledges by Status.
3.  **System**: Displays "Committed: $500k", "Disbursed: $200k", "Remaining: $500k".

## Data Read / Written
- **Budget**: Read.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/03-domain/11-finance-model.md`
