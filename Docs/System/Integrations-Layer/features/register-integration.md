# Register Integration

## Description
Defining a connection to an external partner system. This process sets the "Terms of Engagement" including Scope, Data Contract, and Purpose. It starts in `Draft` and must pass governance checks.

## Component
Integrations

## Actors / Roles
- **Tenant Admin**
- **Partner** (via Portal)

## Permissions
- `integration.create`
- `integration.update.draft`

## Scope Rules
- **Tenant Scope**: Integrations are bound to a country.
- **Vertical Scope**: Must declare which verticals (Health, Finance) it needs access to.

## Preconditions
- Partner must be a registered entity.

## Main Flow
1.  **Actor**: Creates New Integration "MoH DHIS2 Sync".
2.  **Actor**: Selects Vertical "Health".
3.  **Actor**: Uploads Data Contract (OpenAPI Spec).
4.  **Actor**: Submits for Review.
5.  **System**: Sets `status = Requested`.

## Data Read / Written
- **IntegrationRegistry**: Write.

## Audit & Compliance
- **Purpose Limitation**: The description MUST justify why this access is needed.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/09-integrations/01-integration-overview.md`
