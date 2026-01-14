# Search Audit Logs

## Description
Querying the immutable record to investigate incidents. (e.g., "Show me all accesses to Person #999 in the last 24 hours").

## Component
Audit Logging

## Actors / Roles
- **Security Officer**
- **Umbrella Authority**

## Permissions
- `audit.log.view`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Open Audit Console.
2.  **Actor**: Query `resource_id = 999 AND action = VIEW`.
3.  **System**: Returns List:
    - 10:00 AM - User A (Nurse) - Allowed.
    - 10:05 AM - User B (Teacher) - Denied.

## Data Read / Written
- **AuditLogEntry**: Read.

## Related Use Cases
- UC-99: Security Incident

## References
- `SPEC/02-architecture/06-eventing-and-audit-architecture.md`
