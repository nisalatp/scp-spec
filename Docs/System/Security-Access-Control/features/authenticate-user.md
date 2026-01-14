# Authenticate (Login & MFA)

## Description
Verifying the identity of a User or Machine. This is the entry point to the system. SCP implies strictly centralized AuthN via Keycloak, enforcing MFA for all human users.

## Component
Security & Access Control (AuthN)

## Actors / Roles
- **All Users**

## Permissions
- Public (Pre-Auth).

## Scope Rules
- Global.

## Preconditions
- User must exist in IDP (Keycloak).

## Main Flow
1.  **User**: Visits App. Redirected to Keycloak.
2.  **User**: Enters Credentials (Google OAuth or User/Pass).
3.  **System**: Challenges for MFA (Email Code / TOTP).
4.  **User**: Enters Code.
5.  **System**: Returns OIDC Token.

## Alternate / Error Flows
- **MFA Fail**: Access Denied.
- **Account Locked**: Too many attempts.

## Data Read / Written
- **IDP Session**: Create.

## Audit & Compliance
- **Login Audit**: Must capture IP, User Agent, Timestamp, Outcome.

## Related Use Cases
- UC-00: Login

## References
- `SPEC/04-security/02-authentication.md`
