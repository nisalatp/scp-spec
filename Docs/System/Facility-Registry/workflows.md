# Workflows: Facility Registry

## Workflow: New Clinic Registration
1.  **Ministry Admin**: Uploads CSV of 50 new clinics.
2.  **System**: Imports as `Draft`. Checks duplicates.
3.  **Admin**: Reviews map visualization. Confirms locations.
4.  **Admin**: Bulk Activates.
5.  **Event**: `FacilityCreated` x 50.
6.  **Field Agent**: Syncs tablet. Now sees 50 new clinics in "Referral" list.
