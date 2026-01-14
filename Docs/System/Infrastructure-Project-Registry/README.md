# Infrastructure Project Registry

## Purpose
The Infrastructure Project Registry tracks large-scale initiatives (e.g., "Rural Electrification Phase 2", "Well Construction") that impact specific geographic areas. Unlike a "Facility" (which is a point), a Project is an activity that takes time and often covers a region.

## Responsibilities
- **Tracking**: Maintaining a list of active/planned infrastructure works.
- **Coverage Mapping**: Linking projects to one or more Admin Areas (Geo Nodes).
- **De-confliction**: Identifying overlapping projects in the same village.

## In Scope / Out of Scope
**In Scope**:
- Project Lifecycle (Planned -> Active -> Closed).
- Geographic Scope (Which villages benefit?).
- Vertical Tagging (Water vs. Roads).

**Out of Scope**:
- Financial Budgeting (See `Finance`).
- Contractor Management / Procurement.
- Daily Construction Logs.

## Key Concepts
- **Infrastructure Project**: An initiative with a start/end date.
- **Project Scope**: The set of Geo Nodes affected by the project.

## Component Relationship
- **Finance**: Projects consume Budgets.
- **Geo**: Projects are linked to Geo Nodes.
