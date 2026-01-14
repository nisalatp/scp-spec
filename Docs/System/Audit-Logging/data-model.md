# Data Model: Audit Logging

## Entities

### AuditEntry
- `event_id` (UUID)
- `timestamp` (UTC)
- `actor_id` (User/System)
- `tenant_id`
- `action` (e.g., `auth.login.success`)
- `resource_type` (e.g., `case`)
- `resource_id`
- `context` (JSON: IP, UserAgent)
- `hash` (SHA256 of previous entry + content)

## Storage Strategy
- **Hot Storage**: ElasticSearch (30-90 days) for search.
- **Cold Storage**: S3 Gluten/Deep Archive (7 years) for compliance.

## Diagrams
- `UML/Core/system-class-diagram.puml`
