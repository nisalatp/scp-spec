# Select Tenant Session

## Description
After Login, a user who belongs to multiple countries (e.g., International Auditor) must explicitly choose which "Context" they are working in. This binds the Access Token to a specific `tenant_id`.

## Component
Security & Access Control

## Actors / Roles
- **Multi-Tenant Users**

## Permissions
- `tenant.access`

## Scope Rules
- User must have active membership in the target tenant.

## Main Flow
1.  **User**: Logged in (No Tenant Context yet).
2.  **UI**: Shows "Select Country".
3.  **User**: Clicks "Sri Lanka".
4.  **System**: Issues new Token with `claim.tenant_id = 'LK'`.
5.  **Subsequent Requests**: All API calls use this token.

## Alternate / Error Flows
- **Invalid Selection**: User tries to forge token for "KE" -> 403.

## Data Read / Written
- **Session Context**: Update.

## Audit & Compliance
- **Context Boundary**: Ensures data from Sri Lanka is never accidentally shown when context is Kenya.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/04-security/02-authentication.md`
