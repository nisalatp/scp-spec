# Eligibility Rules Engine

## Purpose
The Eligibility Rules Engine is the brain that decides "Who gets what". It abstracts complex legislative logic (e.g., "Family Income < 5000 AND Child Age < 5") into a versioned, testable, and auditable Rule Set. It decouples *Policy* from *Code*.

## Responsibilities
- **Rule Evaluation**: Input (Person Data) -> Output (Eligible/Not Eligible).
- **Versioning**: Maintaining "Policy 2023" vs "Policy 2024".
- **Impact Analysis**: Simulating "What if we change age < 5 to age < 6?".

## In Scope / Out of Scope
**In Scope**:
- JSONLogic or similar Deterministic Rule Engine.
- Rule Lifecycle (Proposed -> Approved -> Active).
- Traceability (Which rule failed?).

**Out of Scope**:
- The actual *payout* (Finance).
- The *approval* of the exception (Workflow).

## Owned Data / Owned Policies
- **Data**: `RuleSet`, `RuleVersion`.
- **Policies**: Policy Change Control Policy.

## Dependent Components
- **Programs**: Every Program has an Eligibility Rule Set.
- **Verticals**: Vertical Owners define the rules.
- **People**: The data subject.

## Exposed Interfaces (APIs / Events)
- `POST /rules/evaluate` (Dry Run).
- `GET /rules/{program_id}/active` (Get definitions).

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Rules Engine).

## Related Use Cases
- **Grant Determination**: Assessing if Applicant A qualifies for Housing Grant.
- **Policy Simulation**: Estimating budget impact of a policy change.

## References
- `SPEC/05-governance/04-policy-change-control.md`
