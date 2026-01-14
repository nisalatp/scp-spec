# Data Model: Marketplace Access

## Entities

### AccessRequest
- `request_id`
- `organization_name` (e.g., "World Health Org")
- `purpose` (e.g., "Vaccination Audit")
- `requested_scopes` (List: `health.read`, `geo.read`)
- `status` (Pending, Approved, Rejected)

### AccessGrant
- `grant_id`
- `request_id`
- `client_id` (OIDC Client ID)
- `scopes` (Approved Scopes - can be subset of requested)
- `valid_from`, `valid_until`
- `status` (Active, Revoked)

## Diagrams
- `UML/Core/system-class-diagram.puml`
