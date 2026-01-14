# Permissions: System Auditor

## List
*   View Audit Logs
*   View System Configuration
*   View Governance Reports

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `view` | `audit_log` | None | Yes | Primary function |
| `view` | `tenant.config` | None | Yes | Verification |
| `view` | `policy` | None | Yes | Verification |
| `create` | `*` | Any | **No** | Read Only |
| `update` | `*` | Any | **No** | Read Only |
