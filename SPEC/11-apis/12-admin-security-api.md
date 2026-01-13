# SCP-SPEC-API-12: Admin and Security API

## Purpose

This document defines administrative and security management APIs.

## In Scope / Out of Scope

**In Scope**
- Role and permission management
- Policy management

**Out of Scope**
- Authentication UI

## Definitions

- Admin API: Privileged management interface.

## Rules (MUST/SHOULD/MAY)

- Admin APIs MUST be restricted to authorized roles.
- Security changes MUST be auditable.
- Deny rules MUST be enforced immediately.
- Policy cache invalidation MUST occur on changes.
- Bulk admin operations MUST NOT be required.

## API Endpoints

### Permissions

- `GET /permissions`
  - Input: scope_type (optional), status (optional)
  - Output: permission_id, action, resource, scope_type, description, status

### Roles

- `POST /roles`
  - Input: role_name, description, scope_type (tenant|geo|vertical|program), permission_ids, active_from, active_until (optional), requires_approval (optional)
  - Output: role_id, version_id, status=draft, created_at
- `PATCH /roles/{role_id}`
  - Input: role_name (optional), description (optional), permission_ids (optional), active_from (optional), active_until (optional)
  - Output: role_id, version_id, updated_at
- `POST /roles/{role_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: role_id, approval_state=pending, requested_at
- `POST /roles/{role_id}/review`
  - Input: review_notes (optional)
  - Output: role_id, approval_state=reviewed, reviewed_at
- `POST /roles/{role_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: role_id, status=active, approval_state=approved, approved_at
- `POST /roles/{role_id}/reject`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: role_id, approval_state=rejected, rejected_at
- `POST /roles/{role_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: role_id, status=archived, archived_at

### Groups

- `POST /groups`
  - Input: group_name, description (optional), dynamic_rule (optional), active_from, active_until (optional)
  - Output: group_id, status, created_at
- `PATCH /groups/{group_id}`
  - Input: group_name (optional), description (optional), dynamic_rule (optional), active_until (optional)
  - Output: group_id, updated_at
- `POST /groups/{group_id}/members`
  - Input: user_id, effective_from, effective_until (optional)
  - Output: membership_id, group_id, user_id
- `POST /groups/{group_id}/members/{user_id}/end`
  - Input: effective_until, reason_code
  - Output: membership_id, effective_until

### Role Assignments (Grant and Revoke)

- `POST /users/{user_id}/roles`
  - Input: role_id, scope (tenant_id, geo_id, vertical_id, program_id), effective_from, effective_until (optional)
  - Output: assignment_id, user_id, role_id
- `POST /groups/{group_id}/roles`
  - Input: role_id, scope (tenant_id, geo_id, vertical_id, program_id), effective_from, effective_until (optional)
  - Output: assignment_id, group_id, role_id
- `POST /role-assignments/{assignment_id}/revoke`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: assignment_id, status=revoked, revoked_at

### Deny Rules

- `POST /deny-rules`
  - Input: subject_type (user|group|role), subject_id, action, resource, scope (tenant_id, geo_id, vertical_id, program_id), active_from, active_until (optional), reason_code, reason_text (required if OTHER)
  - Output: deny_id, status=active, created_at
- `POST /deny-rules/{deny_id}/revoke`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: deny_id, status=revoked, revoked_at

### Policy Packs and Policy Changes

- `GET /policies/packs`
  - Input: vertical_id (optional), status (optional)
  - Output: policy_pack_id, vertical_id, status, version_id
- `POST /policies/packs`
  - Input: vertical_id, policy_rules, active_from, active_until (optional)
  - Output: policy_pack_id, status=draft, created_at
- `PATCH /policies/packs/{policy_pack_id}`
  - Input: policy_rules (optional), active_until (optional)
  - Output: policy_pack_id, version_id, updated_at
- `POST /policies/packs/{policy_pack_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: policy_pack_id, status=requested
- `POST /policies/packs/{policy_pack_id}/review`
  - Input: review_notes (optional)
  - Output: policy_pack_id, status=reviewed, reviewed_at
- `POST /policies/packs/{policy_pack_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: policy_pack_id, status=approved, approved_at
- `POST /policies/packs/{policy_pack_id}/activate`
  - Input: none
  - Output: policy_pack_id, status=active, activated_at
- `POST /policies/packs/{policy_pack_id}/restrict`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: policy_pack_id, status=restricted, restricted_at
- `POST /policies/packs/{policy_pack_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: policy_pack_id, status=suspended, suspended_at
- `POST /policies/packs/{policy_pack_id}/deprecate`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: policy_pack_id, status=deprecated, deprecated_at
- `POST /policies/packs/{policy_pack_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: policy_pack_id, status=archived, archived_at

- `POST /policies/changes`
  - Input: policy_pack_id, change_summary, active_from, active_until (optional)
  - Output: policy_change_id, status=draft, created_at
- `POST /policies/changes/{policy_change_id}/request-review`
  - Input: request_reason_code, request_reason_text (required if OTHER)
  - Output: policy_change_id, status=requested
- `POST /policies/changes/{policy_change_id}/review`
  - Input: review_notes (optional)
  - Output: policy_change_id, status=reviewed, reviewed_at
- `POST /policies/changes/{policy_change_id}/approve`
  - Input: approval_reason_code, approval_reason_text (required if OTHER)
  - Output: policy_change_id, status=approved, approved_at
- `POST /policies/changes/{policy_change_id}/activate`
  - Input: none
  - Output: policy_change_id, status=active, activated_at
- `POST /policies/changes/{policy_change_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: policy_change_id, status=archived, archived_at

### Authorization Evaluation (Restricted)

- `POST /authz/evaluate`
  - Input: subject_id, action, resource, scope (tenant_id, geo_id, vertical_id, program_id), context (optional)
  - Output: decision (allow or deny), reasons, applied_denies, masked_fields (if any)

## Edge Cases

- Conflicting policy updates.
- Partial application of changes.

## Audit & Logs

- Admin actions MUST be logged.
- Security events MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/06-permission-catalog.md
- SPEC/04-security/12-audit-logging.md
