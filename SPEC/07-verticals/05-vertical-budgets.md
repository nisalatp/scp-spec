# SCP-SPEC-VERT-05: Vertical Budgets

## Purpose

This document defines budget handling within verticals, focusing on planning and monitoring rather than accounting.

## In Scope / Out of Scope

**In Scope**
- Annual vertical budgets
- Burn rate tracking
- Budget visibility

**Out of Scope**
- Financial transaction execution
- Accounting ledgers (MVP excluded)

## Definitions

- Vertical Budget: Allocated financial capacity for a vertical.
- Burn Rate: Rate of budget consumption.

## Rules (MUST/SHOULD/MAY)

- Each vertical MUST define its own budget.
- Budgets MUST be independent of donor accounts.
- Budget usage SHOULD be tracked per program.
- Budget data MUST respect consent and access rules.
- Budgets MAY trigger alerts when thresholds are crossed.
- Multi-year budgets MUST be supported.

## Edge Cases

- Budget overrun during emergencies.
- Budget changes mid-year.

## Audit & Logs

- Budget definitions and changes MUST be logged.
- Budget usage SHOULD be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/11-finance-model.md
- SPEC/07-verticals/06-vertical-analytics.md
