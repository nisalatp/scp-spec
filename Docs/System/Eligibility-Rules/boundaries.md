# Boundaries: Eligibility Rules Engine

## Ownership
- **Owns**: The *Logic* of entitlement.
- **Owns**: The *Audit Trail* of why a decision was made.

## Never Owns
- **The Data Value**: It doesn't store Income. It reads Income from `Person` or `Case`.
- **The Final Decision**: It outputs a recommendation (`Eligible=True`). A human or Workflow Engine might override it or finalize it.

## Integration Boundaries
- **Inbound**:
    - **Case Management**: Calls `Evaluate(CaseID)`.
- **Outbound**:
    - **Identity/Household**: Fetches attributes if not provided in payload.
