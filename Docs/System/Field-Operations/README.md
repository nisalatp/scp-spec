# Data Collection (Field Ops)

## Purpose
The Data Collection component manages the "Last Mile" of the platform. It enables Field Agents to work offline, visit households, and capture data via the SCP Mobile App. It handles the synchronization, verification, and conflict resolution of field data.

## Responsibilities
- **Offline Sync**: Caching data for offline use and syncing back changes.
- **Visit Management**: Tracking "Who visited Whom, When, and Why".
- **Agent Scheduling**: (With `Routing`) Assigning tasks to agents.
- **Verification Queue**: Holding data in "Draft/Submitted" state until approved.

## In Scope / Out of Scope
**In Scope**:
- Mobile App API interactions.
- Agent assignments.
- Visit records.

**Out of Scope**:
- The UI of the Mobile App (Frontend).
- MDM/Device Management.

## Owned Data / Owned Policies
- **Data**: `Visit`, `AgentAssignment`, `SyncLog`.
- **Policies**: Sync Frequency Policy, Offline Data Retention Policy.

## Dependent Components
- **Identity**: Visits target Persons/Households.
- **Forms**: Visits capture data using Form Definitions.
- **Geo**: Agents are assigned to Geo Scopes.

## Exposed Interfaces (APIs / Events)
- `POST /field/sync` (The massive sync endpoint).
- `GET /field/tasks` (List assigned visits).
- Event: `VisitSubmitted`, `VisitVerified`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Field Ops Module).
- `UML/Sequences/core-flows.puml` (Offline Sync Flow).

## Related Use Cases
- **UC-04**: Household Registration (Offline).
- **UC-09**: Aid Distribution (Scanning QR).

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
