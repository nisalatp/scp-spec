# Register Person (Enrollment)

## Description
The process of creating a new identity record in the SCP system. This can be done online or offline (store-and-forward). Newly registered records start as "Provisional" until verified.

## Component
Identity (Person Registry)

## Actors / Roles
- **Field Agent** (Primary)
- **Case Worker**
- **System** (API Client)

## Permissions
- `person.create`
- `person.register.offline`

## Scope Rules
- **Tenant Scope**: Records are created within the Agent's Tenant.
- **Geo Scope**: Field Agent can only register people within their assigned Geo (e.g., District).
- **Vertical Scope**: Often requires a "Vertical Context" (e.g., Registering specifically for the "Health" program).

## Preconditions
- Agent must be authenticated.
- If offline, device must have valid sync credentials.

## Main Flow
1.  **Field Agent**: Selects "New Registration".
2.  **Field Agent**: Enters Demographics (Name, DOB, Gender).
3.  **Field Agent**: Captures Identifiers (NIC, Passport) if available.
4.  **Field Agent**: Captures Address (Geo Node).
5.  **Actions**: Submits Form.
6.  **System**:
    - Generates `system_guid`.
    - Sets `status = Provisional`.
    - Stores record.
    - Triggers "Duplicate Check" async.
7.  **Audit**: Logs `PERSON_CREATED`.

## Alternate / Error Flows
- **Offline**: Data stored locally. Synced later.
- **Duplicate Found**: System flags record as `Duplicate Suspect`. Alerts Case Worker for manual merge.

## Data Read / Written
- **Person**: Write.
- **PersonIdentifier**: Write.

## Audit & Compliance
- **Consent**: Registration usually implies initial consent, but explicit `Consent` record should be created in the `Consent` component in parallel.

## Related Use Cases
- UC-01: Emergency Blood Match (requires Identification) - *Wait, this is usage, not creation.*
- UC-05: Household Enrollment

## References
- `SPEC/06-platform-core/03-person-registry.md`
