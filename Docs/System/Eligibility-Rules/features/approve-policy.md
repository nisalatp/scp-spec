# Approve Policy Change

## Description
Governance step to activate a new rule set. Rules are immutable once active.

## Component
Eligibility Rules Engine

## Actors / Roles
- **Umbrella Authority**
- **Vertical Owner**

## Permissions
- `rules.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Actor**: Reviews Plain English Summary.
2.  **Actor**: Reviews Simulation Results.
3.  **Action**: Approve.
4.  **System**: Sets `status = Active`.
5.  **System**: Archives old version (Effective Date switch).

## Data Read / Written
- **RuleSet**: Update Status.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/05-governance/04-policy-change-control.md`
