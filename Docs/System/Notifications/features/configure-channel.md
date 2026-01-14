# Configure Notification Channel

## Description
Setting up the pipeline for delivery (e.g., SMTP Server, SMS Gateway). This is tenant-specific, allowing each country to use its own provider.

## Component
Notifications & Email

## Actors / Roles
- **Tenant Admin**

## Permissions
- `setting.update` (Sensitive)

## Scope Rules
- **Tenant Scope**: Credentials are isolated in the Tenant Vault.

## Preconditions
- Valid 3rd Party Credentials (e.g., SendGrid Key).

## Main Flow
1.  **Actor**: Selects "Email Settings".
2.  **Actor**: Enters Host (`smtp.gmail.com`), Port (`587`), User, Pass.
3.  **Action**: Clicks "Test Connection".
4.  **System**: Sends Test Email.
5.  **System**: Encryption (AES-256) and Store.

## Data Read / Written
- **TenantConfig**: Write (Encrypted).

## Audit & Compliance
- **Security**: Credentials must NEVER return via API, only `*****`.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/09-notifications-email.md`
