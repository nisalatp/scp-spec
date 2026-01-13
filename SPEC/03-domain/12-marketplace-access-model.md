# SCP-SPEC-DOM-12: Marketplace Access Model

## Purpose

This document defines how external organizations access SCP resources through a governed marketplace model.

## In Scope / Out of Scope

**In Scope**
- Access requests by external organizations
- Approval workflows
- Time-bound access

**Out of Scope**
- Commercial marketplaces
- Automated data resale

## Definitions

- Marketplace Access: Governed external access to SCP.
- Access Grant: Time-bound permission.

## Rules (MUST/SHOULD/MAY)

- All access MUST be requested and approved.
- Access MUST be scoped by tenant, vertical, and program.
- Access SHOULD be time-limited.
- Revocation MUST be immediate.
- Revenue-sharing models MUST NOT be required.
- Sandbox access MUST NOT be supported by default.

## Marketplace Access Workflow

1. External organization submits an access request (Requested).
2. Umbrella authority reviews and approves or rejects.
3. Approved requests create time-bound access grants (Active).
4. Grants MAY be revoked immediately by governance.
5. Expired grants become Inactive and are archived.

## Minimum Required Fields

### Access Request

- access_request_id (system GUID)
- tenant_id
- organization_name
- request_purpose
- vertical_ids
- program_ids (optional)
- status (requested, approved, rejected)
- requested_by, requested_at

### Access Grant

- access_grant_id (system GUID)
- tenant_id
- access_request_id
- vertical_ids
- program_ids (optional)
- active_from
- active_until
- status (active, revoked, expired, archived)
- created_by, created_at

## Edge Cases

- Access during emergencies.
- Overlapping access grants.

## Audit & Logs

- All access grants MUST be logged.
- External access usage MUST be auditable.

## Open Questions

- None.

## References

- SPEC/09-integrations/01-integration-overview.md
- SPEC/05-governance/02-umbrella-authority-model.md
