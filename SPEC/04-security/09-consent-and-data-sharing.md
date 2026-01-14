# SCP-SPEC-SEC-09: Consent and Data Sharing

## Purpose

This document defines how consent is recorded and enforced in SCP.

## In Scope / Out of Scope

**In Scope**
- Consent per person and vertical
- Data sharing enforcement

**Out of Scope**
- Legal text management

## Definitions

- Consent: Explicit permission to process data.
- Consent Boundary: Scope of consent applicability.
- Consent Active From: Timestamp when consent becomes valid.
- Consent Active Until: Timestamp when consent expires.
- Consent Grace Period: Tenant-configurable read-only window after consent expiry.
- Consent Reminder Schedule: Tenant-configurable set of days before expiry for reminder notifications.
- Consent Version: Immutable record of a consent decision.
- Consent Rejection: Verification outcome that marks a consent record as invalid and inactive.

## Rules (MUST/SHOULD/MAY)

- Consent MUST be per person and per vertical.
- Consent MAY be refined by specific Purposes (e.g., Emergency Contact, Research) if supported by the Vertical.
- Consent capture MUST require the related person record to be verified.
- Consent MUST include Active From and Active Until timestamps.
- Consent MUST be enforced only within its active window.
- Consent MAY be open-ended by setting Active Until to null or a far-future date.
- Consent records MUST be immutable; changes MUST create a new consent version.
- Consent versioning MUST be supported and auditable.
- Consent withdrawal MUST be performed by authorized online roles; offline agents MUST NOT withdraw consent.
- Consent capture MAY be performed offline by authorized field agents and MUST be verified upon sync.
- Consent capture MUST be blocked for provisional persons; offline capture is allowed only after a verified person record exists.
- Offline consent capture MUST be restricted to designated field agent roles.
- Captured consent MUST be effective immediately only when required evidence is captured; otherwise it MUST remain pending.
- Offline consent capture MUST include agent-recorded identity verification using any reliable document.
- A photo or scan of the verification document MUST be captured.
- Consent evidence MUST be captured (signature, photo, or recording) for all consent captures.
- If evidence is unavailable, the consent record MUST be marked pending and is not effective until evidence is provided.
- Consent evidence MUST be stored as an attachment linked to the consent record.
- Consent evidence attachments MUST follow the standard attachment rules for verified records.
- Viewing consent evidence MUST require a separate permission from viewing the underlying record.
- Consent evidence MUST be masked or redacted by default unless an audit-level permission is granted.
- Consent evidence MUST be retained for the same duration as the consent record.
- Consent evidence MUST use the standard attachment encryption approach.
- Consent evidence access MUST be logged as a distinct audit event type.
- Verification MAY reject a consent record if evidence or identity checks fail.
- Rejected consent MUST not grant any access and MUST not enter grace period.
- Rejected consent MUST record a reason code from a global fixed list.
- Rejection reason codes MUST include: IDENTITY_MISMATCH, EVIDENCE_INSUFFICIENT, SCOPE_INVALID, DUPLICATE_ACTIVE, OTHER.
- If rejection reason code is OTHER, a free-text reason MUST be provided.
- Rejected consent MUST be re-captured via a new consent record; renew MUST NOT be used for rejected consents.
- Withdrawal MUST block all non-ROOT access (no read or write) for the affected vertical once the withdrawal is effective.
- Consent withdrawal MUST also block use of the data in aggregated or anonymized outputs once effective.
- Consent withdrawal MUST become effective at the next sync cycle or within 24 hours, whichever occurs first.
- Consent withdrawal MUST record a reason code.
- Consent withdrawal reason codes MUST use a global fixed list.
- Reason codes MUST include: USER_REQUEST, CONSENT_EXPIRED, DATA_INACCURATE, LEGAL_REQUIREMENT, DUPLICATE_RECORD, SAFETY_RISK, SYSTEM_ERROR, OTHER.
- If reason code is OTHER, a free-text reason MUST be provided.
- When consent expires, records MUST enter a tenant-configured read-only grace period for non-ROOT users, with no exports or integrations.
- Grace period duration MAY be any tenant-configured value approved by umbrella authority, up to a global maximum of 90 days.
- After the grace period, expired consent MUST be treated the same as withdrawal.
  - Read-only access during grace period is permitted for staff with valid roles.
  - Read-only access during grace period MAY include attachments and consent evidence, subject to existing permissions.
- ROOT exports MAY proceed during the grace period with audit logging.
- No workflow actions, approvals, or status transitions MAY occur during the grace period.
- Data sharing MUST check consent before access.
- ROOT access MUST bypass consent checks, with elevated audit logging.
- Emergency consent bypass MUST NOT be available to non-ROOT users.
- Consent expiration MUST trigger notifications to the person via all configured channels (email/SMS) when available.
- Consent expiration reminders SHOULD be sent before expiry based on tenant-configured schedules.
- Default reminder schedule MUST be 30, 7, 3, and 1 days before expiry unless overridden by tenant policy.
- Tenants MAY change reminder schedules via tenant configuration without umbrella approval.
- If no valid contact channel exists, reminders and expiry notifications MUST be suppressed and logged.
- Reminders and expiry notifications MUST NOT be sent for inactive or archived persons.
- Delivery status for consent expiry and reminder notifications MUST be logged separately (sent/failed).

## Consent Lifecycle Workflow

1. Consent is captured (online or offline) with required evidence and Active From/Until.
2. Offline captures are created as pending and require verification on sync.
3. Verified consent becomes active within its Active From/Until window.
4. Consent expires automatically at Active Until and enters grace period.
5. Consent verification either activates the consent or rejects it with a reason code.
6. Rejected consent requires a fresh consent capture to proceed.
7. Consent withdrawal creates a new version and is effective within 24 hours or next sync.
8. After the grace period, expired consent is treated as withdrawn.
9. Consent renewal creates a new version with updated dates and evidence.

## Minimum Required Fields

- consent_id (system GUID)
- tenant_id
- person_id
- vertical_id
- status (pending, active, rejected, expired, withdrawn)
- active_from
- active_until (nullable)
- grace_until (nullable)
- capture_mode (online or offline)
- evidence_attachment_ids
- verification_document_attachment_id
- reason_code (for withdrawal or rejection)
- reason_text (required if OTHER)
- version_id
- captured_by, captured_at

## Edge Cases

- Partial consent across verticals
- Consent withdrawn mid-case
- Consent withdrawal triggers case auto-suspension for the primary vertical.
- Consent expires during an active case and crosses the grace-period boundary.

## Audit & Logs

- Consent changes MUST be logged.
- Consent version history MUST be visible only to ROOT and tenant admins.

## Open Questions

- None.

## References

- SPEC/04-security/10-data-classification-and-masking.md
