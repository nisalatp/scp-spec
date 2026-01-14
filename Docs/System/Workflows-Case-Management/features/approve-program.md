# Approve Program

## Description
Governance gate to authorize the launch of a program. Ensures budget alignment and policy compliance.

## Component
Programs

## Actors / Roles
- **Umbrella Authority** (Approver)

## Permissions
- `program.approve`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Status = `Requested`.

## Main Flow
1.  **Actor**: Reviews Program Definition.
2.  **Actor**: Checks "Active From/To" dates.
3.  **Action**: Approve.
4.  **System**: Sets `status = Active` (at Start Date).
5.  **System**: Publishes to Catalog.

## Alternate / Error Flows
- **Reject**: Sends back to draft.

## Data Read / Written
- **ProgramDefinition**: Update Status.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/03-domain/04-program-model.md`
