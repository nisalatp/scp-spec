# Scope & Governance: Finance

## Scope Rules
- **Vertical Partitioning**: Health Budget cannot settle Education Obligations.
- **Tenant Currency**: All records are stored in the Tenant's Base Currency. Multi-currency is an extension.

## Governance Policies
### 1. Zero-Trust Disbursement
- No money moves without an approved `Obligation` record linked to a `Verified` Case.

### 2. Immutable Audit
- You cannot "Edit" an Obligation amount. You must "Void" and "Re-create" (or Post an Adjustment) to preserve the trail.
