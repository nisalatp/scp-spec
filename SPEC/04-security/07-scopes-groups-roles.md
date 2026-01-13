# SCP-SPEC-SEC-07: Scopes, Groups, and Roles

## Purpose

This document defines how users are granted permissions via roles, groups, and scopes.

## In Scope / Out of Scope

**In Scope**
- Role definitions
- Group membership
- Scope inheritance

**Out of Scope**
- UI role editors

## Definitions

- Role: A collection of permissions.
- Group: A team of users.
- Scope: Tenant + geo + vertical (+ program).

## Rules (MUST/SHOULD/MAY)

- Roles MUST not contain deny rules.
- Groups MAY contain multiple roles.
- Scopes MUST support inheritance.
- Users MAY have different roles in different scopes.
- Dynamic groups MUST be supported.
- Role definitions MUST declare their applicable scope type:
  - tenant-wide
  - geo-scoped
  - vertical-scoped
  - program-scoped (must include a parent vertical)
- Role assignments MUST include explicit scope bindings (tenant, geo, vertical, program as applicable).
- Roles MUST NOT grant cross-tenant access.
- Role definitions MUST align with the required scope matrix defined in SPEC/04-security/06-permission-catalog.md.

## Role Creation Workflow

1. Tenant admin proposes a role definition with scope type and permissions.
2. SCP validates that permissions are compatible with the proposed scope.
3. Umbrella authority reviews the role definition.
4. Umbrella authority approves and activates the role.
5. ROOT MAY create or activate roles directly without approval.
6. Role changes create a new version and preserve history.

## Permission Grant and Revoke Workflow

1. Grant permissions by assigning roles to users or groups within a specific scope.
2. Effective dates MAY be set for temporary grants.
3. Revocations MUST take effect immediately and be logged.
4. If a role is revoked, all inherited permissions within that scope MUST be removed.
5. Permission changes MUST be auditable with actor and reason.

## Edge Cases

- User in multiple groups with conflicting roles
- Orphaned group assignments

## Audit & Logs

- Role and group changes MUST be logged.

## Open Questions

- None.

## References

- SPEC/04-security/08-deny-and-inheritance.md
