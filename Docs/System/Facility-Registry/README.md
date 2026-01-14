# Facility Registry

## Purpose
The Facility Registry is the "Yellow Pages" of the SCP platform. It maintains a master list of all service delivery points (Hospitals, Schools, Warehouses, Community Centers) and their locations. It is essential for "Distance to Service" analysis and referral workflows.

## Responsibilities
- **Registration**: Storing the existence and type of a Facility.
- **Location Linkage**: Pinning facilities to the `Geo Engine` (Hierarchy and Lat/Long).
- **Service Catalog**: Listing what services are available (e.g., "Vaccination capable").

## In Scope / Out of Scope
**In Scope**:
- Managing the list of facilities.
- Tagging facilities with attributes/capabilities.
- Managing "Operating Status" (Active/Closed).

**Out of Scope**:
- Managing the *Stock/Inventory* inside the facility.
- Scheduling appointments (That's in `Calendaring` or external).
- Managing Facility Staff (That's `Identity`).

## Key Concepts
- **Facility**: A physical place providing service (e.g., "General Hospital Kandy").
- **Facility Status**: Is it open?

## Component Relationship
- **Geo**: Validation of `geo_id`.
- **Verticals**: Health manages Hospital records; Education manages Schools.
