# Edge Cases & Failures: Security & Access Control

## Edge Cases
1.  **Scope Drift**: User moves to new Geo, but Token still has old Geo claim. (Requires Token Refresh/Revocation).
2.  **Circular Inheritance**: Roles inheriting from each other (Blocked by validation).
3.  **Orphaned Assignment**: Role deleted but User still assigned. (Database FK prevents this, or Soft Delete handled by PDP).
4.  **Expired Role**: `active_until` passed 1 second ago. (Must Deny).
5.  **Consent Race**: Consent withdrawn mid-request. (Might allow if check passed before withdrawal committed).
6.  **Root Lockout**: All admins auth failed. (Break-glass procedure).
7.  **Multi-Vertical User**: Has `Health` and `Edu` roles. (Must explicitly select context OR system merges permissions strictly).

## Failure Handling
- **PDP Down**: Fail Closed (Deny All).
- **Consent Service Down**: Fail Closed (Deny PII).
