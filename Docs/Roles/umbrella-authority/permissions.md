# Permissions: Umbrella Authority

## List
*   Approve Policies
*   Approve Programs
*   Approve Verticals
*   Approve Role Definitions
*   Resolve Conflicts (Override)
*   View Escalated Issues

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `approve` | `policy` | None | Yes | Governance |
| `approve` | `program` | None | Yes | Governance |
| `approve` | `role` | None | Yes | Governance |
| `create` | `vertical` | None | Yes | Governance |
| `resolve` | `conflict` | None | Yes | Final arbiter |
| `create` | `case` | Any | **No** | Operational separation |
| `view` | `person` | Conflict Ctx | **Yes** | If resolving identity conflict |
