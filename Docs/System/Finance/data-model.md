# Data Model: Finance

## Entities

### Budget
- `budget_id`
- `program_id`
- `total_amount`
- `committed_amount`
- `fiscal_year`

### FinancialObligation
- `obligation_id`
- `case_id`
- `beneficiary_id`
- `type` (Grant, Loan, Fee)
- `amount`
- `status` (Draft, Approved, Disbursed, Repaid, WrittenOff)
- `payment_reference` (External Transaction ID)

## Storage Strategy
- **Transactional**: High consistency required (ACID).
- **Immutable Ledger Pattern**: Updates are stored as new "Events" or "Entries".

## Diagrams
- `UML/Core/system-class-diagram.puml`
