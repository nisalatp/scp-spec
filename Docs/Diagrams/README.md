# SCP Architecture Diagrams (C4 Model)

This directory contains the architecture diagrams for the Smart Community Platform (SCP), following the **C4 Model** guidelines. 

The diagrams are written in **PlantUML** and designed to be compatible with [Draw.io](https://app.diagrams.net/) (Insert -> Advanced -> PlantUML).

## Diagram Catalog

### Level 1: System Context
**File:** [01-System-Context.puml](./01-System-Context.puml)
- **Purpose:** Shows the SCP in its environment.
- **Audience:** Non-technical stakeholders, Project Managers.
- **Key Elements:** Beneficiaries, Agents, Donors, Government Systems, External APIs.

### Level 2: Container Diagram
**File:** [02-Container-Modular-Monolith.puml](./02-Container-Modular-Monolith.puml)
- **Purpose:** Shows the high-level technical building blocks.
- **Audience:** Architects, Developers, DevOps.
- **Key Elements:** Kubernetes Cluster, Web/Mobile Apps, Modular Monolith Service, Keycloak (Auth), PostgreSQL, Redis, Object Storage.

### Level 3: Component Diagram (The 5 Pillars)
**File:** [03-Component-Monolith-Modules.puml](./03-Component-Monolith-Modules.puml)
- **Purpose:** "Zooms in" to the Modular Monolith to show the internal modular architecture.
- **Audience:** Backend Developers.
- **Key Elements:** The 5 Pillars:
    1.  **Security**: AuthZ, Masking.
    2.  **Governance**: Policy, Authority.
    3.  **Platform Core**: Persons, Tenants.
    4.  **System Verticals**: Health, Education, Economy, Finance, Data.
    5.  **Operations**: Reporting, Field Ops.

### Level 4: Dynamic Flows (Pseudo-Code)
These diagrams illustrate complex business logic flows using sequence diagrams and pseudo-code annotations.

1.  **Authorization Evaluation**: [04-Flow-AuthZ-Evaluation.puml](./04-Flow-AuthZ-Evaluation.puml)
    - details the 9-step policy decision (Root -> Tenant -> Consent -> Policies -> ABAC).
2.  **Person Registration**: [05-Flow-Person-Registration.puml](./05-Flow-Person-Registration.puml)
    - details the "Provisional" status workflow, deduplication, and event publishing.

## How to Edit/View
1.  Open [Draw.io](https://app.diagrams.net/).
2.  Select **Arrange > Insert > Advanced > PlantUML**.
3.  Paste the content of the `.puml` file.
4.  Click **Insert**.

## Use Case Diagrams (Scenarios)

Located in `Docs/Diagrams/UseCases/`, these visualize specific usage scenarios found in the `Usage/` folder.

- **[UC-01: Emergency Blood Matching](./UseCases/UC-01-Emergency-Blood-Match.puml)** (Sequence)
  - Rapid search for O- donors within 10km radius.
- **[UC-05: School Supplies Donation](./UseCases/UC-05-School-Supplies.puml)** (Activity)
  - End-to-end flow from Donor Budget -> Distribution -> Verification.
- **[UC-Advanced: High-Risk Mothers](./UseCases/UC-Advanced-HighRisk-Mothers.puml)** (Sequence)
  - Complex cross-vertical query (Health + Housing + Finance + Geo).
- **[UC-Advanced: Infrastructure Investment](./UseCases/UC-Advanced-Infrastructure-Investment.puml)** (Activity)
  - Data aggregation from multiple verticals to score community needs.
