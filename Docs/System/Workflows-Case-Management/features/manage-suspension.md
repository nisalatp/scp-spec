# Manage Suspension

## Description
Putting a Case on "Hold". This happens automatically if Consent is withdrawn, or manually if an investigation is needed (e.g., Fraud Inspection).

## Component
Workflows & Case Management

## Actors / Roles
- **Supervisor** (Manual)
- **System** (Automatic)

## Permissions
- `case.suspend`
- `case.restore`

## Scope Rules
- **Vertical Scope**.

## Main Flow (Manual)
1.  **Actor**: Flags Case "Suspicious Activity".
2.  **System**: Sets `status = Suspended`. `reason = POLICY_SUSPENSION`.
3.  **Effect**: All benefits paused.

## Main Flow (System - Consent)
1.  **Event**: Consent Withdrawn.
2.  **System**: Queries all Active Cases for Person + Vertical.
3.  **System**: Sets `status = Suspended`. `reason = CONSENT_WITHDRAWN`.

## Data Read / Written
- **Case**: Update.

## Audit & Compliance
- **Legal Requirement**: Processing MUST stop immediately upon Consent Withdrawal.

## Related Use Cases
- UC-99: Fraud Control

## References
- `SPEC/03-domain/05-case-intervention-model.md`
