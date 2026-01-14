# Generate Report

## Description
Running a query against the Data Mesh to produce insights. Must respect Consent (filtering out opted-out users).

## Component
Analytics & Data Mesh

## Actors / Roles
- **Analyst**
- **Program Manager**

## Permissions
- `analytics.report.view`

## Scope Rules
- **Vertical/Geo Scope**: User only sees data they are allowed to see.

## Main Flow
1.  **Actor**: Selects Report "Monthly Impact".
2.  **System**: Checks User Scope.
3.  **System**: Filters out "Consent Withdrawn".
4.  **System**: Aggregates Data.
5.  **System**: Returns Chart/Table.

## Data Read / Written
- **DataProduct**: Read.

## Audit & Compliance
- **Audit**: Log query execution.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/03-domain/10-analytics-reporting-model.md`
