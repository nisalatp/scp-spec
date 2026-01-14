# Create Version (Draft)

## Description
Improving a system definition (Form, Rule, Config) without breaking the running system.

## Component
Metadata Versioning

## Actors / Roles
- **Metadata Owner** (e.g., Form Designer)

## Permissions
- `*.create` (Dependent on component)

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Previous Active Version exists.

## Main Flow
1.  **Actor**: Opens "Registration Form v1".
2.  **Action**: Click "Create New Draft".
3.  **System**:
    - Copies v1 definition to v2 (Draft).
    - Locks v1 context (Preventing accidental edits to live).
4.  **Actor**: Modifies v2.

## Data Read / Written
- **VersionedEntity**: Write.

## Uses
- Safely adding a new question to a survey.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/07-metadata-versioning.md`
