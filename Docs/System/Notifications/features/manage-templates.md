# Manage Templates

## Description
Defining the content of messages using variables (e.g., `Hello {{name}}`). Supports multi-language variants.

## Component
Notifications & Email

## Actors / Roles
- **Tenant Admin**
- **Translator**

## Permissions
- `template.manage`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- None.

## Main Flow
1.  **Actor**: Creates Template "password-reset".
2.  **Actor**: Adds "English" Subject: "Reset Password". Body: "Click {{link}}".
3.  **Actor**: Adds "Sinhala" Subject: "...".
4.  **Action**: Save.

## Data Read / Written
- **Template**: Write.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/09-notifications-email.md`
