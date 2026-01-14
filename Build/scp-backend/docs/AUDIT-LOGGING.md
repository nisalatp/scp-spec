# Audit Logging Standards

All state-changing operations in the SCP Backend MUST be audited.

## Audit Event Structure
```json
{
  "timestamp": "2026-01-14T12:00:00Z",
  "actor": "UserID",
  "action": "person.update",
  "resource": "uuid-123",
  "tenantId": "uuid-tenant",
  "changes": {
    "prev": { "status": "active" },
    "new": { "status": "deceased" }
  },
  "ipAddress": "1.2.3.4",
  "traceId": "correlation-id"
}
```

## Implementation Rules
- Audit logs MUST be written to an immutable, append-only store.
- Audit emission MUST happen as part of the database transaction where possible, or via reliable messaging (Outbox Pattern).
- Audit logs MUST NOT contain raw PII unless specifically encrypted for auditors.
