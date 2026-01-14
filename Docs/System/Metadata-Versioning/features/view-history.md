# View Version History

## Description
Auditing the evolution of a policy or form over time.

## Component
Metadata Versioning

## Actors / Roles
- **Auditor**
- **Analyst**

## Permissions
- `*.view`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Selects "Income Rule Set".
2.  **Action**: View History.
3.  **System**: Displays Timeline:
    - v1 (2020): Income < 3000
    - v2 (2022): Income < 5000
    - v3 (2024): Income < 8000

## Data Read / Written
- **VersionedEntity**: Read.

## Related Use Cases
- UC-99: Forensic Audit

## References
- `SPEC/06-platform-core/07-metadata-versioning.md`
