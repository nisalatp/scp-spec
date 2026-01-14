# Offline Sync

## Description
The mechanism ensuring Field Agents can work without internet. It manages the "Check-Out" (Download) and "Check-In" (Upload) of data.

## Component
Data Collection (Field Ops)

## Actors / Roles
- **Field Agent** (User Trigger)
- **System** (Background Process)

## Permissions
- `field.sync`

## Scope Rules
- **Geo Scope**: Agent downloads ONLY data for their assigned area (e.g., 500 Households).

## Main Flow
1.  **Agent**: Opens App. Clicks "Sync".
2.  **App**: Authenticates.
3.  **App**: Pushes "Outbox" (New Visits).
4.  **Server**: Processes Uploads. Returns IDs.
5.  **App**: Pulls "Updates" (New Assignments, Form Changes).
6.  **App**: Updates Local DB (SQLite).

## Alternate / Error Flows
- **Conflict**: Server has newer version of Household than Agent -> Server Wins (usually) or Manual Merge.

## Data Read / Written
- **SyncLog**: Write.

## Audit & Compliance
- **Data Leak**: Ensuring "Pull" only returns authorized data is critical.

## Related Use Cases
- All Field Work.

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
