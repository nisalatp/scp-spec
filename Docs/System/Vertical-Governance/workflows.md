# Workflows: Verticals

## Workflow: New Vertical Setup
1.  **Actor**: Tenant Admin (Govt official).
2.  **Action**: Create Vertical "Agriculture".
3.  **Config**: Assign "Agriculture Director" role.
4.  **Result**: New Domain available. Users can now be Onboarded to "Agriculture".

## Workflow: Suspension (Negative Flow)
1.  **Scenario**: "Agri-Subsidy" vertical found leaking data.
2.  **Action**: Umbrella Authority hits "Suspend".
3.  **Impact**: API returns 403 for ALL Agriculture endpoints.
4.  **Resolution**: Audit -> Fix -> Reinstate.
