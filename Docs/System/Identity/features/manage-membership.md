# Manage Membership (Relationships)

## Description
Adding or removing members from a household and defining their relationship to the Head (e.g., "Spouse", "Son").

## Component
People, Households, & Families

## Actors / Roles
- **Field Agent**
- **Case Worker**

## Permissions
- `household.update`

## Scope Rules
- **Geo Scope**.

## Main Flow
1.  **Actor**: Opens Household Profile.
2.  **Actor**: Clicks "Add Member".
3.  **Actor**: Searches "Saman Perera".
4.  **Actor**: Selects Relationship "Son".
5.  **Action**: Save.
6.  **System**: Links Person to Household.

## Data Read / Written
- **HouseholdMember**: Write.
- **Relationship**: Write.

## Related Use Cases
- UC-05: Household Enrollment

## References
- `SPEC/06-platform-core/04-household-family.md`
