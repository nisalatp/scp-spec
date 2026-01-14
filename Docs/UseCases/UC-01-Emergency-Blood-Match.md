# UC-01: Emergency Blood Matching

## Goal
To instantly locate and alert potential O-negative blood donors within a specific geographic radius of an emergency.

## Actors
- **Case Worker (Health and Environment)**: Initiates the search from a hospital/clinic context.
- **Potential Donor**: Receive the alert.
- **System**: Performs geo-spatial filtering and consent checks.

## Preconditions
- User has `Case Worker` role within the `Health and Environment` vertical.
- Geo Engine has up-to-date location indices.
- Health and Environment Vertical has blood group metadata for residents.

## Main Flow (Happy Path)
1. **Request**: Worker enters blood type (O-Neg) and radius (5km).
2. **Geo Filter**: System identifies all Person IDs within the 5km circle using `POST /geo/resolve`.
3. **Health Filter**: System filters IDs for `blood_group == O-Neg`.
4. **Consent Check**: System verifies `emergency_contact` consent for identified candidates.
5. **Alert**: System dispatches SMS/Push notifications via Integration Layer.
6. **Confirmation**: Worker receives count of alerted donors.

## Alternate / Error Paths
### a) Permission Denied
- **Condition**: User lacks `person:search` or `Health` vertical scope.
- **Flow**: System returns `403 Forbidden`. Action is logged as a security event.

### b) Scope Violation
- **Condition**: Worker attempts to search in a Geo Node outside their assigned scope (e.g., different district).
- **Flow**: System restricts results to the Worker's assigned scope regardless of requested radius.

### c) Consent Missing
- **Condition**: Valid donors are found but none have granted `EmergencyContact` consent.
- **Flow**: System returns "No consented donors found in radius". No alerts are sent.

### d) Integration Failure
- **Condition**: SMS Gateway is unreachable.
- **Flow**: System logs the failure, updates the Visit/Interaction status to `FAILED`, and notifies the Worker.

## Component Interactions
- **Geo Engine**: `POST /geo/resolve`
- **Identity**: `GET /person` (with masking)
- **Consent**: `VERIFY /consent`
- **Notifications**: `POST /internal/notify`

## Data Touched
- `Identity.BloodGroup` (Medical attribute)
- `Geo.Location` (Spatial index)
- `Consent.Permissions` (Privacy rule)

## Audit & Compliance
- Incident logged in Audit Trail including requester, parameters, and recipients.
- PII is masked in the UI; only total counts or authorized contact info shown.
