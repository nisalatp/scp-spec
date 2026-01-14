# Field Agent

## Purpose
Field Agents are the frontline workforce responsible for data collection, household registration, and delivering last-mile services. They operate primarily via the Mobile App (Offline/Online) and are strictly bound by geography.

## Responsibilities
- Register Persons and Households.
- Conduct home visits.
- Deliver interventions (e.g., distributing kits).
- Update status (e.g., verifying a specific claim).

## Associated Verticals
- **Standard Verticals**: Can serve multiple (e.g., a "Grama Niladhari" might serve Health + Welfare).
- **Geo-Verticals**: **Always** assigned to a specific Geo Node (e.g., "GN Division X").

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: **Strict**. Cannot create or view records outside their assigned GeoFence.
- **Vertical scope**: Intersects with Visit data.
- **Program scope**: N/A (usually task-based).

## Permissions Summary
- **Allowed**: `visit.create`, `visit.update` (own), `person.create`, `person.search` (scoped), `household.create`.
- **Denied**: `case.delete`, `case.suspend` (Case Worker task), `role.*` (Admin task).
- **Conditional**: Search results are filtered to their Geo Scope.

## Data Access Boundaries
- **PII access**: YES. Necessary for identification.
- **Sensitive health data**: Only if authorized for Health Vertical visits.
- **Audit log visibility**: None.

## Consent Requirements
- **Capture**: Agents are often the *capturers* of Consent (e.g., uploading a signed form).
- **View**: Cannot view a person's profile if consent is withdrawn.

## Audit Expectations
- All visits are GPS-tagged and timestamped.
- "Offline Sync" events are audited as a batch.

## Typical Workflows / Use Cases
- **Household Registration**: Going door-to-door to register families.
- **Service Delivery**: Scanning a QR code to confirm aid delivery.

## Edge Cases
- **Volunteer Mode**: Reduced permissions (e.g., pure data entry, no view history).
- **Offline Mode**: Operations queued and synced later; permissions checked at sync time.

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
