# Data Model: Notifications & Email

## Entities

### NotificationRequest
- `request_id` (PK)
- `tenant_id`
- `recipient_identity` (Email/Phone)
- `channel` (EMAIL, SMS)
- `template_id`
- `context_data` (JSON)
- `status` (Queued, Sent, Failed, Bounced)
- `retry_count`

### NotificationTemplate
- `template_id` (PK)
- `key` (e.g., `password-reset`)
- `locale` (en, si, ta)
- `subject_template`
- `body_template` (Mustache/Handlebars)

## Storage Strategy
- **Transient**: High volume logs. Archived/Purged after 90 days commonly, unless Compliance requires longer.

## Diagrams
- `UML/Core/system-class-diagram.puml`
