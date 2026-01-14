# Boundaries: Finance

## Ownership
- **Owns**: The *Record* of financial intent.
- **Owns**: The *Budgeting Rules* for verticals.

## Never Owns
- **The Money**: Actual funds sit in external Bank Accounts / Mobile Wallets.
- **The Transaction**: The execution happens externally; Finance only stores the *Result* (Success/Fail) reported back.

## Integration Boundaries
- **Inbound**:
    - **Case Mgmt**: "Approve Grant" -> Creates Obligation.
- **Outbound**:
    - **Integration Layer**: "Send Payment Instruction" -> Payment Gateway Adapter.
