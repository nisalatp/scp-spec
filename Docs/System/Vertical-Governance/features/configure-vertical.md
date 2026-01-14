# Configure Vertical

## Description
Setting domain-level policies that apply to all Programs within the vertical (e.g., "Risk Thresholds", "Default Consent Period").

## Component
Verticals

## Actors / Roles
- **Vertical Owner**

## Permissions
- `vertical.config.update`

## Scope Rules
- **Vertical Scope**: Changes only affect this specific domain.

## Main Flow
1.  **Actor**: Opens "Health Settings".
2.  **Actor**: Sets "Emergency Risk Threshold" = "High".
3.  **Action**: Save.
4.  **System**: Updates `VerticalConfig`.

## Data Read / Written
- **VerticalConfig**: Write.

## Related Use Cases
- UC-42: Configure Risk Policy

## References
- `SPEC/05-governance/03-vertical-governance.md`
