# Grant Access (Approve)

## Description
The official authorization of an external request. This generates a "Visa" (Access Grant) that allows the partner to use APIs within the defined scope.

## Component
Marketplace Access

## Actors / Roles
- **Umbrella Authority**
- **Vertical Owner** (Reviewer)

## Permissions
- `access.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Actor**: Reviews Request + Legal Purpose.
2.  **Action**: Approve.
3.  **System**:
    - Creates `AccessGrant`.
    - Sets Expiry (e.g., 1 Year).
    - Provisions API Keys (via Integrations).

## Data Read / Written
- **AccessGrant**: Write.

## Audit & Compliance
- **Liability**: Approver is responsible for external data usage.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/03-domain/12-marketplace-access-model.md`
