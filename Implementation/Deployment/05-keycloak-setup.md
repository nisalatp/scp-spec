# 05 Keycloak Setup and Integration

This section explains how to deploy Keycloak and connect it to SCP.

## 1. Deploy Keycloak

1. Deploy Keycloak in the `scp-keycloak` namespace.
2. Expose it at `auth.<domain>` with TLS.
3. Ensure Keycloak has access to its own database.

## 2. Create the SCP Realm

1. Log in as Keycloak admin.
2. Create a new realm (example: `scp`).
3. Set the realm to require email verification.

## 3. Configure Email (Required for MFA)

1. In Keycloak, set SMTP host, port, username, and password.
2. Send a test email to confirm it works.
3. Enable Email OTP or email based MFA in the authentication flow.

## 4. Configure Google OAuth (Required for ROOT)

1. Register SCP in Google Cloud as an OAuth client.
2. Add the client ID and secret to Keycloak as an Identity Provider.
3. Enable login via Google for the realm.

ROOT accounts MUST use Google OAuth only.

## 5. Create SCP Clients

Create these clients:

- `scp-api` (confidential, used by the API)
- `scp-admin` (optional admin tools)
- integration clients (machine clients, one per integration)

Client settings:

- OIDC enabled
- Standard flow disabled for machine clients
- Service account enabled for machine clients
- Redirect URIs set for interactive clients

## 6. Token Claims and Mappers

Add protocol mappers so tokens include:

- `tenant_id`
- `verticals`
- `integration_id` (for machine clients)

Tokens without tenant_id MUST be rejected by SCP.

## 7. Roles and Groups

Create initial roles:

- Tenant Admin
- Vertical Owner
- Case Worker
- Read Only

Assign roles to groups as required. Use groups to simplify access management.

## 8. ROOT Accounts

ROOT accounts are hard coded in SCP as hashed email values.

Steps:

1. Collect ROOT email addresses.
2. Generate hashes using the SCP approved hashing method.
3. Add hashes to the SCP configuration.

Keycloak does not manage ROOT privileges. SCP enforces them at runtime.

## 9. Integration Clients

For each external system:

1. Create a machine client in Keycloak.
2. Assign allowed verticals.
3. Add `tenant_id` and `integration_id` claims.
4. Share the client credentials securely with the partner.

## Checklist

- Keycloak deployed and reachable over TLS
- SCP realm created
- Email MFA enabled
- Google OAuth configured
- Clients created with correct claims
- ROOT hashes added to SCP config
