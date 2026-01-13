# SCP-SPEC-INTEGR-02: SMTP Adapter

## 1. Purpose and Objectives

The SCP SMTP Adapter provides a secure, tenant-scoped, consent-aware email delivery capability for all outbound email communications originating from the Smart Community Platform (SCP).

Objectives:

- Enable per-tenant email delivery using tenant-owned SMTP infrastructure
- Enforce security, privacy, and consent controls
- Support transactional and notification emails (not bulk marketing)
- Provide auditability, traceability, and governance
- Decouple email delivery from core business logic via a standard adapter

The SMTP Adapter is a platform service, not a direct mailer.

## 2. In Scope / Out of Scope

### 2.1 In Scope

- Tenant-scoped SMTP configuration
- Secure credential storage and usage
- Transactional and system notifications
- Template-based email generation
- Localization and language selection
- Bounce detection and suppression handling
- Rate limiting, retries, and failure handling
- Consent-aware sending
- Audit logging of all send attempts

### 2.2 Out of Scope

- Marketing or promotional email campaigns
- Mass mailing list management
- UI email editors
- Inbound email processing
- Third-party ESP account provisioning
- SMS or push notifications (handled by other adapters)

## 3. Definitions

| Term               | Definition                                                    |
| ------------------ | ------------------------------------------------------------- |
| SMTP Adapter       | SCP service responsible for sending emails via SMTP           |
| Tenant SMTP Config | SMTP host, port, credentials, and policies defined per tenant |
| Sender Identity    | Approved "From" name and address used in emails               |
| Template           | Parameterized email content with placeholders                 |
| Notification       | A system-triggered email (e.g. verification, alert)           |
| Consent Boundary   | Person-level permission to receive specific email types       |
| Suppression List   | Addresses blocked due to bounces or policy                    |

## 4. Normative Requirements (MUST / SHOULD / MAY)

### 4.1 Tenant-Scoped SMTP Configuration

- SMTP configuration MUST be defined per tenant (country).
- No global SMTP credentials MUST be shared across tenants.
- Each tenant MAY configure:
  - Host
  - Port
  - Authentication method
  - Encryption mode
  - Sender identities
  - Rate limits

### 4.2 Credential Storage and Encryption

- SMTP credentials MUST be encrypted at rest.
- Encryption MUST use platform-approved key management (KMS / Vault or internal).
- Credentials MUST NOT be logged, exposed via APIs, or returned in responses.
- Only the SMTP Adapter MUST have access to decrypted credentials.

### 4.3 TLS and Transport Security

- SMTP connections MUST use encrypted transport.
- Supported modes:
  - STARTTLS
  - SMTPS (implicit TLS)
- Plaintext SMTP MUST NOT be permitted.
- Certificate validation MUST be enforced.
- Weak ciphers SHOULD be rejected.

### 4.4 Sender Identity and Domain Rules

- Tenants MUST define allowed sender domains.
- "From" addresses MUST belong to approved domains.
- Dynamic or user-supplied "From" addresses MUST NOT be allowed.
- Reply-To addresses MAY be configured separately.
- SCP SHOULD warn tenants about missing SPF/DKIM/DMARC.

### 4.5 Rate Limiting and Retries

- SMTP Adapter MUST enforce per-tenant rate limits.
- Rate limits MAY be defined as:
  - Messages per minute
  - Messages per hour
- Retry behavior:
  - Transient failures -> retry with exponential backoff
  - Permanent failures -> no retry
- Retry attempts MUST be capped.
- Duplicate sends MUST NOT occur.

### 4.6 Bounce Handling and Suppression

- SMTP Adapter MUST track send outcomes.
- Hard bounces MUST place addresses on a suppression list.
- Soft bounces SHOULD be retried before suppression.
- Suppressed addresses MUST NOT receive further emails.
- Suppression lists MUST be tenant-scoped.

### 4.7 Content Templating and Localization

- Emails MUST be template-based.
- Templates MUST support:
  - Parameter substitution
  - Localization (language variants)
- Language selection SHOULD follow:
  1. User preference
  2. Tenant default
- Inline HTML MUST be sanitized.
- Attachments MAY be supported (size limits enforced).

### 4.8 Consent-Aware Sending

- Email sending MUST respect consent boundaries.
- Consent MUST be evaluated per:
  - Person
  - Vertical
  - Notification type
- If consent is withdrawn:
  - Email MUST NOT be sent.
  - Attempt MUST be logged as denied.
- System-critical emails MAY bypass consent only if legally required and explicitly configured.

### 4.9 Audit Logging

The SMTP Adapter MUST log:

- Tenant identifier
- Message type / template ID
- Sender identity
- Recipient (hashed or masked)
- Consent check result
- Send outcome (success, bounce, suppressed)
- Timestamp and correlation ID

Logs MUST be:

- Append-only
- Tamper-evident
- Retained per tenant policy

## 5. Error Handling Standards

- Configuration errors MUST fail fast and clearly.
- Errors MUST be categorized:
  - Configuration errors
  - Authentication failures
  - Transport errors
  - Policy/consent denials
- Errors MUST NOT expose credentials or message content.
- Machine-readable error codes SHOULD be returned to calling services.

## 6. Edge Cases and Failure Modes

### 6.1 Invalid SMTP Configuration

- Adapter disables sending.
- Administrator notified.
- Errors logged.

### 6.2 SMTP Provider Downtime

- Retries applied.
- Queue preserved.
- No message loss.

### 6.3 SPF / DKIM / DMARC Failures

- Emails may be rejected externally.
- SCP logs delivery failures.
- Tenant warned but SCP does not auto-modify DNS.

### 6.4 Quota Exceeded

- Sending throttled.
- Messages queued or rejected based on policy.
- Alert raised to tenant admin.

### 6.5 Duplicate Notification Triggers

- Idempotency keys SHOULD prevent duplicate sends.

## 7. Open Questions

- Should SCP provide optional SMTP health checks per tenant?
- Do any tenants require enforced DMARC alignment?
- Should per-template rate limits be supported?
- Is email encryption (S/MIME / PGP) required for some jurisdictions?

## 8. References (Related SCP Specs)

- `../09-integrations/01-integration-overview.md`
- `../04-security/02-authentication.md`
- `../04-security/09-consent-and-data-sharing.md`
- `../04-security/10-data-classification-and-masking.md`
- `../06-platform-core/09-notifications-email.md`
- `../05-governance/03-vertical-governance.md`
- `../15-runbooks/04-keycloak-ops-runbook.md`
