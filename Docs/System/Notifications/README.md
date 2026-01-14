# Notifications & Email

## Purpose
The Notifications component ensures that users and beneficiaries receive critical information. It abstracts the complexity of SMTP, SMS gateways, and future Push notifications, providing a unified messaging standard that respects Consent and Tenant configurations.

## Responsibilities
- **Delivery**: Sending messages via configured Adapters (e.g., SMTP).
- **Templating**: Merging data into localized message bodies.
- **Consent Checks**: "Can I email this person?"
- **Retries**: Handling transient failures (exponential backoff).

## In Scope / Out of Scope
**In Scope**:
- Transactional Emails (Password Reset, Assignment Alert).
- SMS Alerts.
- System Broadcasts.

**Out of Scope**:
- Validating the *content* accuracy (Business logic responsibility).
- Marketing/Campaign management (This is not a CRM).

## Owned Data / Owned Policies
- **Data**: `NotificationLog`, `Template`.
- **Policies**: Retry Policy, Bounce Policy.

## Dependent Components
- **Consent**: Must check `active_consent` before sending non-system messages.
- **Tenancy**: SMTP/SMS credentials are stored per-tenant vault.

## Exposed Interfaces (APIs / Events)
- `POST /notify/send` (Internal API).
- Event: `NotificationSent`, `NotificationFailed`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Notifications Module).

## Related Use Cases
- **Password Reset**: Immediate high-priority email.
- **Consent Expiry**: Scheduled warning SMS.

## References
- `SPEC/06-platform-core/09-notifications-email.md`
- `SPEC/09-integrations/02-smtp-adapter.md`
