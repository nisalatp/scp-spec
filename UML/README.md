# System UML Diagrams

This directory contains the comprehensive PlantUML diagram set for the Smart Community Platform (SCP), generated from the SPEC documentation.

## Diagram Index

### Use Case (`/use-case`)
- [01_system-use-case.puml](./use-case/01_system-use-case.puml): High-level system actors and boundaries.
- [02_core-modules-use-case.puml](./use-case/02_core-modules-use-case.puml): Breakdown of use cases by module.

### Activity (`/activity`)
- [01_person-registration-workflow.puml](./activity/01_person-registration-workflow.puml): Registration flow (Offline/Online).
- [02_case-approval-workflow.puml](./activity/02_case-approval-workflow.puml): Case eligibility and approval chain.

### Sequence (`/sequence`)
- [01_api-person-create.puml](./sequence/01_api-person-create.puml): `POST /persons` API flow.
- [02_consent-check-flow.puml](./sequence/02_consent-check-flow.puml): Logic for checking consent before data access.

### Class (`/class`)
- [01_domain-class-model.puml](./class/01_domain-class-model.puml): Core domain entities (Person, Program, Tenant) and relationships.

### Component (`/component`)
- [01_system-components.puml](./component/01_system-components.puml): Logical components and services (Core, AuthZ, Verticals).

### Deployment (`/deployment`)
- [01_kubernetes-deployment.puml](./deployment/01_kubernetes-deployment.puml): Kubernetes topology (Pods, DBs, Keycloak).

### ERD (`/erd`)
- [01_database-erd.puml](./erd/01_database-erd.puml): Physical PostgreSQL schema.

### State (`/state`)
- [01_person-lifecycle.puml](./state/01_person-lifecycle.puml): State machine for Person entity (Provisional -> Active).


### Usage-Driven Use Cases (Vertical-Aware)
Located in `/UseCases/UC-###-Name/`.
Each folder contains a full "How it works" diagram pack.

- **[Catalog of all 44 Scenarios](./_meta/usage-cases-catalog.md)**
- **Samples**:
  - [UC-01 Emergency Blood Matching](./UseCases/UC-01-Emergency-Blood-Match/) (Health)
  - [UC-05 School Supplies](./UseCases/UC-05-School-Supplies/) (Education + Finance)
  - [UC-44 Community Risk Index](./UseCases/UC-44-Community-Risk-Index/) (All Verticals)

### Package (`/package`)

- [01_dotnet-packages.puml](./package/01_dotnet-packages.puml): .NET solution structure and dependencies.

## Usage
Open these files in VS Code with the PlantUML extension or paste the content into [PlantText](https://www.planttext.com/).
