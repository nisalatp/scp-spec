# Execute Field Visit

## Description
The core activity of a Field Agent: Going to a location, opening a Form, capturing data, and submitting it. Can be ad-hoc or scheduled.

## Component
Data Collection (Field Ops)

## Actors / Roles
- **Field Agent**

## Permissions
- `visit.create`

## Scope Rules
- **Geo Scope**: Agent must be assigned to the location.

## Preconditions
- Agent App must be Synced.

## Main Flow
1.  **Agent**: Arrives at House.
2.  **Agent**: Opens "Household Survey".
3.  **Agent**: Fills Form. Takes Photos.
4.  **Action**: Clicks "Submit".
5.  **System (App)**: Validates locally. Stores in Outbox.
6.  **System (Sync)**: Uploads to Server. Status -> `Submitted`.

## Alternate / Error Flows
- **GPS Fence**: App warns if Agent is too far from Target Location.

## Data Read / Written
- **Visit**: Write.
- **FormSubmission**: Write.

## Audit & Compliance
- **MetaData**: Captures GPS, Timestamp, Duration of Visit.

## Related Use Cases
- UC-04: Household Registration
- UC-09: Aid Distribution

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
