# Configure Report Template

## Description
Defining the layout and logic of a report (e.g., "Columns: Name, Age, Status").

## Component
Reporting & Exports

## Actors / Roles
- **Analyst**
- **Developer**

## Permissions
- `report.create`

## Scope Rules
- **Vertical Scope**.

## Main Flow
1.  **Actor**: Creates Template "Beneficiary List".
2.  **Actor**: Defines Columns (Name, NIC masked, Status).
3.  **Actor**: Sets Default Filters (Status = Active).
4.  **Action**: Save.

## Data Read / Written
- **ReportDefinition**: Write.

## Related Use Cases
- UC-42: Policy Simulation

## References
- `SPEC/03-domain/10-analytics-reporting-model.md`
