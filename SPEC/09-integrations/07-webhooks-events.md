# SCP-SPEC-INT-07: Webhooks and Events

## Purpose

This document defines optional webhook and event mechanisms for notifying external systems of SCP events.

## In Scope / Out of Scope

**In Scope**
- Outbound webhooks
- Event subscriptions
- Retry and failure handling

**Out of Scope**
- Inbound event ingestion
- Guaranteed real-time delivery

## Definitions

- Webhook: HTTP callback triggered by an event.
- Event: Significant state change within SCP.
- Subscriber: External system receiving events.

## Rules (MUST/SHOULD/MAY)

- Webhooks MUST be explicitly enabled per tenant.
- Events MUST be scoped by tenant and vertical.
- Payloads MUST exclude sensitive data unless approved.
- Retries SHOULD use exponential backoff.
- Rate limits MUST be enforced.
- Webhooks MAY be disabled globally or per tenant.
- Webhook payloads MUST be signed.
- Webhook secrets MUST rotate automatically.
- Webhook signatures MUST use public key verification.
- Webhook delivery receipts MUST be supported.

## Edge Cases

- Subscriber endpoint downtime.
- Duplicate event delivery.
- Payload schema evolution.

## Audit & Logs

- Event emissions MUST be logged.
- Webhook delivery attempts MUST be auditable.
- Failures MUST be traceable.

## Open Questions

- None.

## References

- SPEC/02-architecture/06-eventing-and-audit-architecture.md
- SPEC/11-apis/01-api-standards.md
