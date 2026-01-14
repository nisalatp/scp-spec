# Evaluate Policy (PDP)

## Description
The internal engine decision: "Can User X do Action Y on Resource Z?". This is not human-triggered but is the core "Function" of the component.

## Component
Security & Access Control (AuthZ)

## Actors / Roles
- **System** (All Components call this)

## Permissions
- N/A (Internal).

## Scope Rules
- **Deny Wins**: Explicit Deny overrides any Grant.
- **Inheritance**: "View Province" implies "View District".

## Main Flow
1.  **Input**: User Context + Permission + Resource Scope.
2.  **Engine**:
    - Checks Deny Rules.
    - Checks Role Assignments (RBAC).
    - Checks Attributes (ABAC - e.g., "Is Case Active?").
    - Checks Consent (for PII).
3.  **Output**: `ALLOW` or `DENY`.

## Data Read / Written
- **Permissions**: Read.
- **Consent**: Read.

## Audit & Compliance
- **Decision Log**: Every `DENY` is logged for intrusion detection. Sample of `ALLOW` is logged.

## Related Use Cases
- **All**.

## References
- `SPEC/04-security/05-authz-engine-evaluation.md`
