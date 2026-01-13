# SCP-SPEC-SEC-12: Audit Logging

## Purpose

This document defines audit logging requirements across SCP.

## In Scope / Out of Scope

**In Scope**
- Security-relevant actions
- Governance decisions

**Out of Scope**
- Debug-level logs

## Definitions

- Audit Log: Immutable security record.

## Rules (MUST/SHOULD/MAY)

- All critical actions MUST be audited.
- Logs MUST be append-only.
- Logs MUST include tenant and vertical context.
- Retention MUST follow policy.
- External SIEM integrations MAY be supported but are not required in the current phase.
- Audit events MUST include: event_id, timestamp, tenant_id, actor_id, action, resource_type, resource_id, outcome, and correlation_id.
- Vertical_id, program_id, and geo_id MUST be included when applicable; otherwise they MUST be null.
- ROOT actions MUST be logged with elevated severity.
- Audit logging for critical actions MUST fail closed if an event cannot be recorded.

## Audit Event Coverage (Minimum)

- Authentication and MFA outcomes
- Authorization decisions and deny overrides
- Role, group, permission, and deny rule changes
- Tenant lifecycle and configuration changes
- Geo and community center creation, update, archive, restore
- Vertical creation, approval, restriction, archive
- Program lifecycle and ownership transfers
- Case lifecycle transitions, suspensions, and reopenings
- Workflow approvals, rejections, and overrides
- Consent capture, verification, withdrawal, and evidence access
- Form definition lifecycle and submission verification
- Attachment uploads, version changes, verification, and downloads
- Integration onboarding, contract activation, exchange runs, and webhooks
- Pipeline definitions, runs, validation failures, and rollbacks
- Reports, exports, and chart executions
- Agent creation, suspensions, and visit verification
- Donor access grants and revocations
- Marketplace access requests and grants

## Audit Event Schema Example

```json
{
  "event_id": "e9b0c0d1-1a2b-4c3d-8e9f-0123456789ab",
  "timestamp": "2025-01-15T10:11:12Z",
  "tenant_id": "tenant-123",
  "actor_id": "user-456",
  "action": "case.suspend",
  "resource_type": "case",
  "resource_id": "case-789",
  "vertical_id": "vert-health",
  "program_id": null,
  "geo_id": "geo-001",
  "outcome": "success",
  "correlation_id": "corr-abc-123",
  "details": {
    "reason_code": "CONSENT_WITHDRAWN",
    "previous_status": "active",
    "new_status": "suspended"
  }
}
```

## Edge Cases

- High-volume audit events
- Partial failures during logging

## Audit & Logs

- Audit logs MUST be protected from modification.

## Open Questions

- None.

## References

- SPEC/02-architecture/06-eventing-and-audit-architecture.md
