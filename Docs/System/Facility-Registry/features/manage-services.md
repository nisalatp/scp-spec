# Manage Services (Capabilities)

## Description
Defining what a facility actually *does*. (e.g., "Has ICU", "Offers Vaccination").

## Component
Facility Registry

## Actors / Roles
- **Facility Manager**
- **Vertical Owner**

## Permissions
- `facility.update`

## Scope Rules
- **Vertical Scope**.

## Main Flow
1.  **Actor**: Opens Facility "Base Hospital".
2.  **Actor**: Adds Service "COVID Vaccination".
3.  **Actor**: Sets Status "Active".
4.  **Action**: Save.

## Data Read / Written
- **FacilityService**: Write.

## Uses
- Enabling "Filter by Service" in maps.

## Related Use Cases
- UC-99: Resource Allocation

## References
- `SPEC/06-platform-core/11-facility-registry.md`
