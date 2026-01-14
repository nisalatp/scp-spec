# Workflows & Case Management

## Purpose
This component manages the lifecycle of both **Programs** (initiatives) and **Cases** (individual interventions). It provides the state engine for multi-step citizen journeys, program-level configurations, and automated task orchestration.

## Responsibilities
- **Program Lifecycle**: Defining eligibility, duration, and target audience for initiatives.
- **Case Tracking**: Managing individual applications and interventions (Draft -> Active -> Closed).
- **Workflow Engine**: Orchestrating approval steps and automated transitions.
- **Enrollment**: Linking verified persons to active programs.

## In Scope / Out of Scope
**In Scope**:
- Program and Case lifecycle management.
- State machines and transition logic.
- Enrollment rules and outcome tracking.

**Out of Scope**:
- Payout execution (handled by `Finance`).
- Eligibility logic evaluation (handled by `Eligibility Rules`).

## Owned Data / Owned Policies
- **Data**: `Program`, `Enrollment`, `Case`, `WorkflowDefinition`, `WorkflowInstance`.
- **Policies**: Approval Matrix, Enrollment Intersection Rules, Program Approval Policy.

## Dependent Components
- **Verticals**: Cases belong to a Vertical.
- **Identity**: Cases target a Person/Household.
- **Programs**: Cases are often an application *for* a Program.

## Exposed Interfaces (APIs / Events)
- `POST /programs` (Create Program)
- `POST /programs/{id}/enroll` (Enroll Person)
- `POST /cases` (Create Case)
- Event: `ProgramLaunched`, `CaseActivated`, `MemberEnrolled`

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Case Manager).
- `UML/States/case-lifecycle.puml`.

## Related Use Cases
- **Beni Application**: Citizen applies for Housing Support (Case Created).
- **Supervisor Review**: Officer approves the application (Workflow Step).

## References
- `SPEC/03-domain/04-program-model.md` (Program)
- `SPEC/03-domain/05-case-intervention-model.md` (Case)
- `SPEC/03-domain/06-workflow-approval-model.md` (Workflow)
