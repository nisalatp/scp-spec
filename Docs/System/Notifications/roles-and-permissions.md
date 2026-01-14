# Roles & Permissions: Notifications & Email

## Participating Roles
- **Platform Admin**: Configuration of SMTP credentials.
- **System**: The primary sender.
- **Auditor**: Views the delivery logs.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `configure` | `smtp` | Tenant | Platform Admin | - | Sensitive credentials |
| `view` | `notification_log` | Tenant | Platform Admin, Auditor | - | Debugging |
| `send` | `message` | System-Internal | **System Services** | Users | Users don't "send" directly |

## Consent Interactions
- **Strict Enforcement**: The Service checks `Consent.HasPermission(Person, Channel)` before dispatch.
- **Override**: `Type=SystemCritical` (e.g., "Privacy Breach Alert") bypasses consent but logs a warning.

## Deny Wins
- If Consent is missing, standard messages are dropped silently (or logged as Skipped).
