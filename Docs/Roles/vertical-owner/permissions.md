# Permissions: Vertical Owner

## List
*   Manage Vertical Config
*   Manage Programs
*   Propose Policies
*   View Vertical Reports
*   Manage Vertical Staff

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `update` | `vertical` | `id=assigned_vertical` | Yes | Config |
| `create` | `program` | `vertical=assigned` | Yes | Setup |
| `propose` | `policy` | `vertical=assigned` | Yes | Governance |
| `view` | `case` | `vertical=assigned` | Yes | Oversight |
| `view` | `case` | `vertical=other` | **No** | Boundary |
