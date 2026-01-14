# Roles & Permissions: Eligibility Rules Engine

## Participating Roles
- **Policy Maker**: Definitions the rules.
- **Vertical Owner**: Approves the rules.
- **Case Worker**: Views the *Result* (Explanation).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `policy_draft` | Vertical | Policy Maker | - | Staging |
| `approve` | `policy_version`| Vertical | Vertical Owner | Policy Maker | Seg. of Duty |
| `simulate` | `policy_impact`| Tenant | Analyst | - | Heavy Query |

## Consent Interactions
- **Processing**: Evaluation requires access to PII. The Calling Service (Case Mgmt) must prove Consent.
- **Blackbox**: If Consent is missing for a specific field (e.g. "Income masked"), the rule using "Income" will fail or evaluate to False.

## Deny Wins
- If a Policy is "Suspended", evaluations using it return Error or Deny (Fail Safe).
