# Lapse: Policy Simulation Engine

**Missing Capability**: "What-If" Analysis for Policy Design.

## Evidence
*   **Use Cases**: UC-21 (Policy Design).
*   **Spec Gap**: `SPEC/10-data` mentions Analytics (Retrospective), but not Simulation (Prospective).

## Impact
*   **Severity**: **Medium**.
*   **Blocker**: Planners cannot predict costs of new subsidies before rollout.

## Proposed Changes
1.  **Sim Service**: Use "Digital Twin" approach.
2.  **Logic**: Run Policy Rule X against Anonymized Population Sample Y to estimate Cost Z.
