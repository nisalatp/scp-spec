# Manage Annexures (Splits)

## Description
Handling the scenario where a single physical structure is divided into multiple households (e.g., 53A, 53B).

## Component
People, Households, & Families

## Actors / Roles
- **Tenant Admin**
- **Geo Admin**

## Permissions
- `household.split`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Selects Household #53.
2.  **Actor**: Selects "Create Annexure".
3.  **Actor**: Defines Label "53/A".
4.  **Actor**: Moves Members "Saman & Family" to 53/A.
5.  **Action**: Save.
6.  **System**: Links 53/A to Parent 53 (so History is preserved).

## Data Read / Written
- **Household**: Write (Create new, Update old).

## Audit & Compliance
- **Electoral Register**: Splits impact voting and funding allocation.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/04-household-family.md`
