# Publish Data Product

## Description
Making a domain dataset (e.g., "Vaccination Rates") available for consumption by others. This involves defining the schema and access rules.

## Component
Analytics & Data Mesh

## Actors / Roles
- **Vertical Owner** (Data Steward)

## Permissions
- `analytics.publish`

## Scope Rules
- **Vertical Scope**: Steward can only publish their own data.

## Preconditions
- Data must exist in Operational DB.

## Main Flow
1.  **Actor**: Defines Query "Select count(*)...".
2.  **Actor**: Adds Metadata "Title: Daily Vax Rates".
3.  **Actor**: Sets Privacy Policy "Aggregate Only".
4.  **Action**: Publish.
5.  **System**: Registers in Data Catalog.

## Data Read / Written
- **DataProductDefinition**: Write.

## Related Use Cases
- UC-42: Policy Simulation

## References
- `SPEC/03-domain/10-analytics-reporting-model.md`
