# Audit & Compliance: Notifications & Email

## Logged Events
- `notify.sent`, `notify.failed`.

## Fields
- **Never Log**: The Body content (might contain PII like passwords/health info).
- **Log**: Template ID, Recipient Hash, Timestamp, Status.

## Retention
- Logs kept for proof of delivery ("We sent the warning on Monday").
