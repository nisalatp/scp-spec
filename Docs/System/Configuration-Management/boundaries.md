# Boundaries: Configuration Management

## Ownership
- **Owns**: The *Values* of the settings.
- **Owns**: The *History* of changes.

## Never Owns
- **The Logic**: The Config Service says `max_upload_size=10MB`. The *Attachment Service* is responsible for actually enforcing that limit.

## Integration Boundaries
- **Inbound**:
    - **Admin Console**: UI for Admins to change settings.
- **Outbound**:
    - **Notification Bus**: "Config Changed" event.
