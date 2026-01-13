# SCP-SPEC-INT-03: SMS Adapter

## Purpose

This document defines the SMS adapter used by SCP for outbound messaging where email is insufficient or unavailable, while enforcing consent, tenant isolation, and governance.

## In Scope / Out of Scope

**In Scope**
- Tenant-configured SMS gateways
- Consent-aware SMS delivery
- Retry and rate limiting behavior

**Out of Scope**
- Inbound SMS processing
- Marketing or promotional campaigns

## Definitions

- SMS Adapter: Integration component responsible for sending SMS messages.
- Tenant SMS Config: Per-tenant configuration of an external SMS provider.
- Sender ID: Approved sender identifier for SMS messages.

## Rules (MUST/SHOULD/MAY)

- SMS delivery MUST be tenant-scoped.
- SMS MUST only be sent where explicit consent exists for the relevant vertical.
- System-critical SMS MAY bypass consent only if legally required and explicitly configured.
- Consent expiration notifications MUST be sent via SMS when configured and are treated as system-critical.
- Sender IDs MUST be approved per tenant.
- Rate limits MUST be enforced per tenant and per provider.
- Retries SHOULD use exponential backoff.
- Provider credentials MUST be encrypted at rest.
- SMS MAY be disabled for tenants without a configured gateway.
- Inbound delivery receipts are not required.
- Per-vertical sender IDs MUST NOT be required.

## Edge Cases

- Provider downtime or throttling.
- Invalid or unreachable phone numbers.
- Consent withdrawn after message queued.

## Audit & Logs

- All SMS send attempts MUST be logged.
- Failures and retries MUST be auditable.
- Consent checks MUST be traceable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/09-notifications-email.md
- SPEC/04-security/09-consent-and-data-sharing.md
