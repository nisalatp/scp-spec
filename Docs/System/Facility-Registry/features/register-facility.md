# Register Facility

## Description
Cataloging a physical location where services are provided (e.g., "District Hospital"). This enables geospatial analysis of service coverage.

## Component
Facility Registry

## Actors / Roles
- **Tenant Admin**
- **Vertical Owner**

## Permissions
- `facility.create`

## Scope Rules
- **Tenant Scope**.
- **Geo Scope**: Must be pinned to a valid Geo Node.

## Preconditions
- Geo Node must exist.

## Main Flow
1.  **Actor**: Creates Facility "Base Hospital Galle".
2.  **Actor**: Selects Type "Health".
3.  **Actor**: Pin Location on Map (Lat/Lon).
4.  **Action**: Submit for Review.
5.  **System**: Sets `status = Requested`.

## Data Read / Written
- **Facility**: Write.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/11-facility-registry.md`
