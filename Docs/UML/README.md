# SCP System UML Diagrams

This directory contains the **Complete System UML Set** for the Smart Community Platform (SCP), visualizing the technical specifications found in the `SPEC/` folder.

These diagrams are in **PlantUML** format and can be viewed in [Draw.io](https://app.diagrams.net/) (Insert -> Advanced -> PlantUML) or any PlantUML viewer.

## Diagram Catalog

### 1. Domain Model (Class Diagram)
**File:** [01-System-Class-Diagram.puml](./01-System-Class-Diagram.puml)
- **Concept**: The static structure of the system domain.
- **Key Entities**: `Person`, `Household`, `Case`, `Program`, `Vertical`, `Tenant`, `UmbrellaAuthority`.
- **Relationships**: Shows how Governance flows to Tenants, how Persons belong to Households and Geo Nodes, and how Cases link Interventions to Persons.

### 2. Database Schema (ERD)
**File:** [02-System-Database-ERD.puml](./02-System-Database-ERD.puml)
- **Concept**: The physical data storage model (PostgreSQL).
- **Key Tables**: `tenants`, `users`, `persons`, `households`, `cases`, `geo_nodes`, `audit_logs`.
- **Detail**: Primary Keys, Foreign Keys, JSONB columns.

### 3. Entity Lifecycles (State Machine)
**File:** [03-System-State-Machines.puml](./03-System-State-Machines.puml)
- **Concept**: The valid status transitions for core entities.
- **Focus**: The **Person Lifecycle**:
    - `Provisional` (Offline Capture)
    - `Pending Verification` (Sync)
    - `Verified` / `Active` (Official)
    - `Suspended` (Consent Withdrawal)
    - `Archived` (Soft Delete)

### 4. Core System Flows (Sequence)
**File:** [04-System-Sequence-Core-Flows.puml](./04-System-Sequence-Core-Flows.puml)
- **Concept**: Technical sequence of operations for critical mechanisms.
- **Focus**: **Offline Sync & Conflict Resolution**.
    - Shows how Field Agents sync data.
    - Shows how the Sync Engine detects conflicts (Timestamp deltas).
    - Shows the Conflict Resolver logic.
