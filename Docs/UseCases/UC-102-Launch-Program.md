# UC-102: Launch New Program

## Goal
To design, configure, approve, and activate a new social protection initiative (e.g., a subsidy or cash transfer program), ensuring all eligibility rules, budgetary constraints, and institutional approvals are met before the program goes live.

## Actors
*   **Program Manager**: Designs the program parameters and eligibility logic.
*   **Finance Manager**: Reviews financial feasibility and reserves the required budget.
*   **Vertical Owner**: Provides final institutional approval and policy alignment verification.
*   **System**: Automates the transition of states and notifies relevant stakeholders upon activation.

## Preconditions
*   User is authenticated with appropriate administrative roles.
*   The target `Vertical` exists and the user has a valid scope within it.
*   The tenant has sufficient funds or a budget allocation available in the `Finance` component.

## Main Flow
1.  **Drafting**: Program Manager creates a new program entry, defining the title, target audience, and benefit package.
2.  **Logic Configuration**: Program Manager uses the `Eligibility Rules` component to define the qualification criteria (e.g., "Land Size < 2 Acres AND Income < $X").
3.  **Simulation**: System runs the draft rules against the existing `People` registry to estimate the number of eligible beneficiaries and total cost.
4.  **Budgetary Sign-off**: Finance Manager reviews the cost estimate and allocates funds from a specific budget bucket, creating a reserved `Obligation`.
5.  **Final Approval**: Vertical Owner reviews the complete program design (Rules, Budget, Goals) and provides a digital approval.
6.  **Activation**: System changes the program status to `ACTIVE`, opening the enrollment window and notifying regional offices.

## Alternate Paths
*   **SEC-01: Unauthorized Vertical**: Program Manager attempts to launch a program in a vertical (e.g., Agriculture) they are not assigned to.
*   **FIN-01: Budget Overrun**: System blocks activation if the simulated cost exceeds the assigned budget limit.
*   **RULE-01: Invalid Logic**: system rejects eligibility rules that contain syntax errors or circular dependencies.

## Component Interactions
*   **Security & Access Control**: Validates roles and cross-vertical permissions at each step.
*   **Workflows & Case Management**: Manages the lifecycle and metadata of the program entity.
*   **Eligibility Rules**: Evaluates the criteria against population data.
*   **Finance**: Manages allocations, reservations, and budget tracking.
*   **Workflows & Case Management**: Drives the approval chain sequence.

## Data Touched
*   `Program`: Definition, status, and metadata.
*   `RuleSet`: Logic for beneficiary qualification.
*   `BudgetAllocation`: Link to financial resources.
*   `AuditLog`: Record of all configuration changes and approvals.

## Audit & Compliance
*   All rule changes are versioned; previous versions are retained for historical audit.
*   The "Approval" step requires a cryptographic signature or multi-factor confirmation from the Vertical Owner.
*   Budget reservations are immutable once the program is `ACTIVE`.
