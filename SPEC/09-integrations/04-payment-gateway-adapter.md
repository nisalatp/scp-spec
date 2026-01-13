# SCP-SPEC-INT-04: Payment Gateway Adapter

## Purpose

This document defines the payment gateway adapter framework for SCP, supporting future financial transactions while excluding execution from MVP.

## In Scope / Out of Scope

**In Scope**
- Payment gateway abstraction
- Recording payment intents and references
- Governance and audit controls

**Out of Scope**
- Actual payment execution in MVP
- Ledger and accounting systems

## Definitions

- Payment Gateway Adapter: Integration abstraction for external payment providers.
- Payment Intent: Recorded intention to perform a financial transaction.

## Rules (MUST/SHOULD/MAY)

- Payment adapters MUST be tenant-scoped.
- Financial data MUST be vertically scoped.
- No payment execution MUST occur in MVP.
- All payment intents MUST be auditable.
- Sensitive financial data MUST be masked.
- Execution MAY be enabled post-MVP via governance approval.
- Post-MVP gateway priorities MUST be configured later through governance policy.
- Refunds MUST be represented using internationally accepted standards and payment gateway conventions.

## Edge Cases

- Partial or failed external payment references.
- Duplicate payment intent submissions.

## Audit & Logs

- Payment intent creation MUST be logged.
- Gateway interaction metadata MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/11-finance-model.md
- SPEC/07-verticals/05-vertical-budgets.md
