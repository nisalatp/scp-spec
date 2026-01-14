# Permissions: Platform Admin

## List
*   Manage Tenant Configuration
*   Create and Manage Users
*   Create and Manage Groups
*   Propose New Roles
*   View System Audit Logs
*   Manage Feature Flags

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `update` | `tenant.config` | None | Yes | Branding, basics |
| `create` | `user` | None | Yes | Onboard staff |
| `assign` | `role` | `scope=tenant` | Yes | Assign roles to users |
| `view` | `person` | Any | **No** | No PII access |
| `update` | `policy` | Any | **No** | Policy requires Umbrella |
| `read` | `audit_log` | `type=system` | Yes | Debugging access |
| `read` | `audit_log` | `type=data_access`| **No** | Cannot snoop on case data |
