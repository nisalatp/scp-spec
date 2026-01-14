# Manage Agent Profile (Onboard)

## Description
Registering a Person as a "Field Agent", activating their account, and assigning them to a specific Geo Scope (e.g., "Midwife for Village A").

## Component
Data Collection (Field Ops)

## Actors / Roles
- **Tenant Admin**
- **Program Manager**

## Permissions
- `agent.create`
- `agent.assign`

## Scope Rules
- **Tenant Scope**.
- **Geo Scope**: Manager can only assign agents to their own region.

## Preconditions
- Person Record must exist (Identity).
- User Account must exist (Security).

## Main Flow
1.  **Actor**: Selects Identity "Saman".
2.  **Actor**: Clicks "Promote to Agent".
3.  **Actor**: Assigns Role "Enumerator".
4.  **Actor**: Assigns Geo "Galle District".
5.  **System**: Creates `Agent` record.
6.  **System**: Sends "Welcome" SMS with App Download Link.

## Data Read / Written
- **Agent**: Write.
- **AgentAssignment**: Write.

## Audit & Compliance
- **Accountability**: Agent actions are legally binding.

## Related Use Cases
- UC-04: Household Registration

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
