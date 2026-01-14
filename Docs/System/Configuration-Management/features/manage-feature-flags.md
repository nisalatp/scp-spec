# Manage Feature Flags

## Description
Dynamically enabling or disabling functionality without deploying code (e.g., "Enable Beta Dashboard").

## Component
Configuration Management

## Actors / Roles
- **Platform Admin**
- **Developer**

## Permissions
- `feature.toggle`

## Scope Rules
- **Global / Tenant / User Percentage**.

## Main Flow
1.  **Actor**: Selects Flag `feature.modern_dashboard`.
2.  **Actor**: Sets Rollout `10% of Users`.
3.  **Action**: Save.
4.  **System**: Propagates to Edge instantly.

## Data Read / Written
- **FeatureFlag**: Write.

## Uses
- Canary Releases.
- Kill Switch.

## Related Use Cases
- UC-99: System Upgrade

## References
- `SPEC/06-platform-core/10-configuration-management.md`
