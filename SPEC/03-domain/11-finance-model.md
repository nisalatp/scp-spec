# SCP-SPEC-DOM-11: Finance Model

## Purpose

This document defines the finance domain model for SCP, excluding transaction execution in MVP.

## In Scope / Out of Scope

**In Scope**
- Financial obligations and pledges
- Budgeting and financial indicators
- Micro-loan concepts (conceptual)

**Out of Scope**
- Payment processing
- Ledger execution in MVP

## Definitions

- Financial Obligation: A recorded commitment.
- Micro-loan: Small-scale financial assistance.

## Rules (MUST/SHOULD/MAY)

- Financial data MUST be vertically scoped.
- Finance records MUST require explicit consent.
- Transactions MAY be added post-MVP.
- Finance analytics SHOULD be aggregated.
- Payment gateways MUST be configurable later through governance policy.
- Currency handling MUST use a separate subsystem for conversion between tenant currencies.

## Edge Cases

- Partial repayments.
- Financial data without beneficiary consent.

## Audit & Logs

- Financial records MUST be immutable.
- Access to finance data MUST be logged.

## Open Questions

- None.

## References

- SPEC/07-verticals/05-vertical-budgets.md
- SPEC/09-integrations/04-payment-gateway-adapter.md
