# Revoke Access

## Description
Immediate termination of an external partner's privileges. Used in case of policy violation, data leak, or expiry.

## Component
Marketplace Access

## Actors / Roles
- **Umbrella Authority**
- **Security Officer**

## Permissions
- `access.revoke`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Flags Partner "Unusual Activity".
2.  **Action**: Click "Revoke Grant".
3.  **System**:
    - Sets `status = Revoked`.
    - Invalidates API Keys immediately.
    - Updates Integration Layer cache.

## Data Read / Written
- **AccessGrant**: Update.

## Audit & Compliance
- **Incident Response**: This is a key capability for containment.

## Related Use Cases
- UC-99: Security Incident

## References
- `SPEC/03-domain/12-marketplace-access-model.md`
