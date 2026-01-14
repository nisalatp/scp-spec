# Permissions: Case Worker

## List
*   Manage Cases
*   Verify Visits
*   View Person Profile (Scoped)
*   Manage Attachments

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `create` | `case` | `scope=assigned` | Yes | Enrollment |
| `update` | `case` | `scope=assigned` | Yes | Management |
| `verify` | `visit` | `scope=assigned` | Yes | QA |
| `view` | `person` | `consent=active` | Yes | PII access |
| `view` | `person` | `consent=withdrawn`| **No** | Blocked |
