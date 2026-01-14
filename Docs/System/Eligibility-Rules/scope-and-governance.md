# Scope & Governance: Eligibility Rules Engine

## Scope Rules

### 1. Versioning
- Policies are Immutable once Active.
- Changes require `New Version` + `Approval Workflow`.

### 2. Time-Bound
- `Rule v1` Active: Jan 1 - Dec 31.
- `Rule v2` Active: Jan 1 (Next Year) - Forever.
- Historical Cases (from last year) are re-evaluated using `v1` logic if audit is needed.

## Governance Examples
1.  **Allowed**: Changing "Poverty Line" from 3000 to 5000 LKR (New Version).
2.  **Denied**: "fixing" a typo in an Active Rule (Must create patch version).
3.  **Allowed**: Shared "Definition of Income" rule used by 5 Programs.

## Governance Logic
- **Impact Analysis**: Significant changes (affecting >10% of beneficiaries) trigger "Umbrella Authority" Review.
