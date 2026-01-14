# Workflows: Finance

## Workflow: Cash Transfer Approval
1.  **Case Worker**: Visits household, sees eligibility. Creates `Case`.
2.  **System**: Auto-calculates entitlement ($50).
3.  **Case Worker**: Submits "Payment Request" (Obligation: Draft).
4.  **Manager**: Reviews Case. Clicks "Approve".
5.  **Finance Component**:
    - Checks Budget. (Available?)
    - Locks Funds.
    - Sets Status: `Approved`.
    - Emits `ObligationApproved`.
6.  **Integration**: Pick up event -> Calls Bank API.
7.  **Callback**: Bank says "Success". Integration updates Obligation -> `Disbursed`.
