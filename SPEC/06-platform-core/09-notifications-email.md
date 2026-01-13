# SCP-SPEC-CORE-09: Notifications and Email

## Purpose

This document defines notification delivery, with focus on email via tenant-configured SMTP.

## In Scope / Out of Scope

**In Scope**
- Email notifications
- SMS notifications when configured via adapter
- Templates and localization
- Consent-aware delivery

**Out of Scope**
- Push notifications (future)

## Definitions

- Notification: A system-generated message.
- SMTP Adapter: Tenant-configured email sender.

## Rules (MUST/SHOULD/MAY)

- Email MUST use tenant SMTP configuration.
- SMTP credentials MUST be encrypted at rest.
- Notifications MUST respect consent.
- System-critical notifications MAY bypass consent only if legally required and explicitly configured.
- Consent expiration notifications MUST be sent via email when configured and are treated as system-critical.
- Consent expiration notifications MUST use SMS when configured and available via the SMS adapter.
- Emergency broadcasts MUST be marked as operational and follow emergency override configuration.
- Templates SHOULD support localization.
- Retries SHOULD follow exponential backoff.
- Bounce handling MUST be supported at MVP.
- Per-vertical templates MUST NOT be required.
- Bounce handling MUST be tenant-configurable.

## Edge Cases

- SMTP misconfiguration.
- Provider downtime.

## Audit & Logs

- Notification attempts MUST be logged.
- Failures MUST be recorded.

## Open Questions

- None.

## References

- SPEC/09-integrations/02-smtp-adapter.md
- SPEC/04-security/09-consent-and-data-sharing.md
