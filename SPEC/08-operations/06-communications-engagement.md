# SCP-SPEC-OPS-06: Communications and Engagement

## Purpose

This document defines communication and engagement practices with communities and stakeholders.

## In Scope / Out of Scope

**In Scope**
- Notifications and messaging
- Consent-aware communications
- Engagement tracking

**Out of Scope**
- Marketing campaigns
- Social media integrations

## Definitions

- Communication: Outbound message from SCP.
- Engagement: Interaction response from recipients.
- Emergency Broadcast: A time-sensitive, authorized message sent to a targeted population based on geo and criteria filters.

## Rules (MUST/SHOULD/MAY)

- Communications MUST respect consent and preferences.
- Messages MUST be scoped by vertical.
- System-critical communications MAY bypass consent only if legally required and explicitly configured.
- Consent expiration notifications MUST be sent via all configured channels and are treated as system-critical.
- Content SHOULD be localized.
- Bulk messaging MAY be rate-limited.
- Inbound replies MUST be supported.
- Message scheduling MAY be added later but is not required.
- Emergency broadcasts MUST be limited to authorized roles and require a reason code.
- Emergency broadcasts MUST support geo-radius targeting and criteria-based targeting.
- Emergency broadcasts MUST use all configured channels (email and SMS) when available.
- Emergency broadcasts MAY use emergency_override consent mode only if tenant configuration explicitly allows it.
- Emergency broadcasts MUST be logged with target filters, channel set, and delivery outcomes.

## Edge Cases

- Consent withdrawn after message queued.
- Message delivery failures.
- Missing or stale geo coordinates for targeted recipients.

## Audit & Logs

- Communication attempts MUST be logged.
- Consent checks MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/09-notifications-email.md
- SPEC/04-security/09-consent-and-data-sharing.md
- SPEC/11-apis/22-communications-api.md
