# Register Household

## Description
Creating a new Group entity with a designated Leader (Head of Household) and a specific Location.

## Component
People, Households, & Families

## Actors / Roles
- **Field Agent**

## Permissions
- `household.create`

## Scope Rules
- **Geo Scope**: Agent must cover the location.

## Preconditions
- Leader MUST be a registered, verified Person (or captured in same session).

## Main Flow
1.  **Actor**: Selects "New Household".
2.  **Actor**: Scans NIC of Head of Household.
3.  **Actor**: Captures GPS Location.
4.  **Actor**: Adds Address "53, Temple Road".
5.  **Action**: Save.
6.  **System**: Creates `Household`.
7.  **System**: Links Leader.

## Alternate / Error Flows
- **Duplicate Address**: System warns if "53 Temple Road" already has 10 people.

## Data Read / Written
- **Household**: Write.

## Audit & Compliance
- **Location**: GPS is critical for Disaster Relief planning.

## Related Use Cases
- UC-05: Household Enrollment

## References
- `SPEC/06-platform-core/04-household-family.md`
