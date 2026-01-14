# Permissions: Program Manager

## List
*   View Program Details
*   View Program Reports
*   Manage Program Cases

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `view` | `program` | `id=assigned` | Yes | Context |
| `view` | `case` | `program=assigned` | Yes | Management |
| `view` | `report` | `program=assigned` | Yes | KPIs |
| `update` | `program` | Any | **No** | Owner only |
