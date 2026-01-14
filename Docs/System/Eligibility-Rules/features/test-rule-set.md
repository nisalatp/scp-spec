# Test Rule Set (Simulation)

## Description
Running a proposed rule against a sample population to see who qualifies. This prevents "Policy Bugs" (e.g., accidentally excluding everyone).

## Component
Eligibility Rules Engine

## Actors / Roles
- **Program Manager**

## Permissions
- `rules.evaluate`

## Scope Rules
- **Scope**: Can only test on anonymized data or data within their scope.

## Main Flow
1.  **Actor**: Selects Rule Set "Draft 1".
2.  **Actor**: Uploads/Selects Sample Data (100 Households).
3.  **Action**: Run Simulation.
4.  **System**: Returns Stats (60 Eligible, 40 Ineligible).
5.  **System**: Highlights "Near Misses" (e.g., Income = 5001).

## Data Read / Written
- **Person**: Read (Anonymized).

## Audit & Compliance
- **Audit**: "User X ran simulation on Y records".

## Related Use Cases
- UC-42: Policy Simulation

## References
- `SPEC/05-governance/04-policy-change-control.md`
