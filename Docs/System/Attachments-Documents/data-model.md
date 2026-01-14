# Data Model: Attachments & Documents

## Entities

### Attachment
- `attachment_id`
- `tenant_id`
- `target_type` (Enum: Person, Case, Facility)
- `target_id` (UUID)
- `bucket`
- `key` (Key path in bucket)
- `mime_type`
- `size_bytes`
- `checksum` (SHA-256)
- `scan_status` (Pending, Clean, Infected)

## Diagrams
- `UML/Core/system-class-diagram.puml`
