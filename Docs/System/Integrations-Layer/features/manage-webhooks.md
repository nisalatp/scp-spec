# Manage Webhooks

## Description
Configuring event subscriptions so the external partner gets notified (e.g., "Tell me when a new baby is registered").

## Component
Integrations

## Actors / Roles
- **Tenant Admin**
- **Partner**

## Permissions
- `webhook.manage`

## Scope Rules
- **Event Scope**: Can only subscribe to events within the Integration's approved Vertical.

## Preconditions
- Integration must be Active.

## Main Flow
1.  **Actor**: Selects Event "Person.Created".
2.  **Actor**: Enters URL `https://partner.api/hooks`.
3.  **Action**: Save.
4.  **System**: Generates Signing Secret (HMAC).
5.  **Actor**: Configures Partner System to verify signature.

## Alternate / Error Flows
- **Rate Limit**: System enforces limits on event volume.

## Data Read / Written
- **WebhookSubscription**: Write.

## Audit & Compliance
- **Data Leak**: Webhook payloads must be stripped of PII unless explicitly authorized.

## Related Use Cases
- UC-09: Aid Distribution (Event Driven)

## References
- `SPEC/09-integrations/07-webhooks-events.md`
