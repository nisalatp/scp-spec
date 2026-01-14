# Define KPI

## Description
Standardizing a metric (e.g., "Poverty Reduction Rate") so everyone calculates it the same way.

## Component
Analytics & Data Mesh

## Actors / Roles
- **Analyst**
- **Umbrella Authority**

## Permissions
- `analytics.kpi.manage`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Creates Metric "Stunting Rate".
2.  **Actor**: Defines Formula `(Stunted Children / Total Children) * 100`.
3.  **Action**: Save.
4.  **System**: Validates Attributes exist.

## Data Read / Written
- **KPIDefinition**: Write.

## Related Use Cases
- UC-42: Policy Simulation

## References
- `SPEC/05-governance/07-kpi-reconciliation.md`
