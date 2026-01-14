# View Delivery Logs

## Description
Tracking the status of sent messages (Sent, Delivered, Bounced). Critical for debugging user complaints ("I didn't get the code").

## Component
Notifications & Email

## Actors / Roles
- **Tenant Admin**
- **Support Agent**

## Permissions
- `audit.log.view`

## Scope Rules
- **Tenant Scope**.
- **PII**: Logs may be redacted (e.g., masking Email).

## Main Flow
1.  **Actor**: Searches for User "user@example.com".
2.  **System**: Shows list of recent notifications.
3.  **System**: Displays Status "Failed: 550 Mailbox Full".

## Data Read / Written
- **NotificationLog**: Read.

## Audit & Compliance
- **Evidence**: Proof that the system *did* try to warn the user about consent expiry.

## Related Use Cases
- UC-99: Troubleshooting

## References
- `SPEC/06-platform-core/09-notifications-email.md`
