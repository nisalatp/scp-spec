# Roles & Permissions: Audit Logging

## Participating Roles
- **Auditor**: Read-Only access to search logs.
- **Root Admin**: Configures retention policies.
- **System**: Writes logs.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `write` | `audit_entry` | System | **System Services** | Users | Users cannot spoof logs |
| `read` | `audit_entry` | Tenant | Auditor | Admin | Admins shouldn't audit themselves |
| `delete` | `audit_entry` | Any | **None** | All | Immutable |

## Consent Interactions
- **PII Handling**: Audit Logs MUST NOT contain raw PII (e.g. "Do not log the national ID number in the URL"). They log `resource_id`.
- **Bypass**: Auditors viewing logs *about* PII access do not technically access the PII itself, but rather the *metadata* of access.

## Deny Wins
- If Audit Service is down, critical actions (like Payments) MUST Fail Closed.
