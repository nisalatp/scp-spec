# Approve Integration

## Description
The governance gate. The Umbrella Authority reviews the proposed integration's scope and purpose against national data sovereignty laws before activating it.

## Component
Integrations

## Actors / Roles
- **Umbrella Authority** (Approver)
- **Vertical Owner** (Reviewer)

## Permissions
- `integration.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Reviewer**: Checks Data Contract. "Does this minimize data?"
2.  **Approver**: Reviews Legal Compliance.
3.  **Action**: Clicks "Approve".
4.  **System**:
    - Creates Keycloak Client ID & Secret.
    - Sets `status = Active`.
    - Generates API Credentials.

## Alternate / Error Flows
- **Reject**: Returns to Draft with "Reason".

## Data Read / Written
- **IntegrationRegistry**: Update.
- **Keycloak**: Write.

## Audit & Compliance
- **Accountability**: The Approver is liable for allowing this data exit.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/09-integrations/01-integration-overview.md`
