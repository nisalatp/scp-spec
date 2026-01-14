# Finance

## Purpose
The Finance component tracks financial *concepts* such as Budgets, Pledges, and Beneficiary Obligations (e.g., Micro-loans) within the SCP platform. It is **NOT** a payment processor or a full General Ledger. It serves as the record of "Who owes what?" or "What funds are available?".

## Responsibilities
- **Budget Tracking**: Tracking allocated vs. committed funds per Program/Vertical.
- **Obligation Tracking**: Recording that "Beneficiary A is pledged $500".
- **Integration Point**: Staging data for external Payment Gateways (future).

## In Scope / Out of Scope
**In Scope**:
- Recording Pledges / Grants.
- Tracking Repayment Schedules (conceptually).
- Aggregating Financial Indicators.

**Out of Scope**:
- Actual Payment Processing (Stripe, Mobile Money) - Handled by external systems via Integration Layer.
- General Ledger / Accounting.

## Key Concepts
- **Financial Obligation**: A promise of money (either Incoming or Outgoing).
- **Pledge**: A commitment of funds to a Project/Person.

## Component Relationship
- **Program**: Programs have Budgets.
- **Case**: Cases result in Financial Obligations (e.g., Cash Transfer).
