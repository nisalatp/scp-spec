# Diagram Alignment Map

This document tracks the alignment of architectural and domain diagrams with the reconciled SCP System Inventory.

| Diagram Type | File Path | Status | Reconciliation Notes |
| :--- | :--- | :--- | :--- |
| **C4 Context (L1)** | `Diagrams/C4/01-context.puml` | [x] Aligned | Roles match canonical inventory. |
| **C4 Container (L2)** | `Diagrams/C4/02-container.puml` | [x] Aligned | DB read-replica renamed to 'Analytics & Data Mesh'. |
| **C4 Component (L3)**| `Diagrams/C4/03-component.puml` | [x] Aligned | All components updated to 20 canonical names. |
| **Domain Model** | `Diagrams/UML/Core/system-class-diagram.puml` | [x] Aligned | Verified terminology for Household, Person, Vertical. |

## Terminology Mapping
| Old Terminology | Canonical Terminology | Applied In |
| :--- | :--- | :--- |
| Tenancy | Tenant Management | C4-L3 |
| Identity | Identity (Person & Household) | C4-L3 |
| Geo & GIS | Geo Engine | C4-L3 |
| Forms & Scripting | Form Builder + Form Scripting | C4-L3 |
| Workflows & Case Mgmt| Workflows & Case Management | C4-L3, UML |
| Verticals | Vertical Governance | C4-L3 |
| Analytics & Reporting | Analytics & Data Mesh | C4-L2, C4-L3 |
| Integrations | Integrations Layer | C4-L3 |
| Data Collection | Field Operations | C4-L3 |
