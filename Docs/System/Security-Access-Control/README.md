# Security & Access Control (AuthZ)

## Purpose
The Security & Access Control component (AuthZ Engine) is the centralized enforcement point for all permission logic in SCP. It implements a strict "Policy Decision Point" (PDP) architecture where no service makes its own access decisions; they all consult AuthZ.

## Responsibilities
- **Authentication (AuthN)**: Verifying identity tokens (via external IdP like Keycloak/Google).
- **Authorization (AuthZ)**: Evaluating permissions against Scopes, Roles, and Policies.
- **Tenant Isolation**: Enforcing tenant boundaries.
- **Context Propagation**: Injecting `UserContext` into downstream requests.

## In Scope / Out of Scope
**In Scope**:
- Role-Based Access Control (RBAC).
- Attribute-Based Access Control (ABAC).
- Deny Rules & Inheritance.
- Scope Resolution (Geo/Vertical).

**Out of Scope**:
- Storing User Passwords (IdP responsibility).
- Defining Business Logic (Vertical responsibility).

## Owned Data / Owned Policies
- **Data**: `Role`, `Permission`, `Group`, `ScopeAssignment`.
- **Policies**: "Deny Wins", "Root Bypass", "Least Privilege".

## Dependent Components
- **Tenancy**: AuthZ is Tenant-Aware.
- **Identity**: Users are linked to Persons.
- **Consent**: AuthZ MUST check Consent engine for PII access.

## Exposed Interfaces (APIs / Events)
- `POST /auth/evaluate` (Internal PDP check).
- `POST /auth/login` (Exchange token).
- Event: `Role assigned`, `Login failed`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (AuthZ Component).
- `UML/Sequences/authz-evaluation.puml` (Evaluation Logic).

## Related Use Cases
- **All Use Cases**: Every API call triggers AuthZ.

## References
- `SPEC/04-security/05-authz-engine-evaluation.md`
- `SPEC/04-security/07-scopes-groups-roles.md`
