# Approve Facility

## Description
Confirming the existence and validity of a facility before activated. Used to prevent "Ghost Clinics".

## Component
Facility Registry

## Actors / Roles
- **Umbrella Authority**
- **Vertical Owner**

## Permissions
- `facility.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Actor**: Reviews Location and Name.
2.  **Action**: Approve.
3.  **System**: Sets `status = Active`.
4.  **System**: Publishes to "Find Facility" API.

## Data Read / Written
- **Facility**: Update Status.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/11-facility-registry.md`
