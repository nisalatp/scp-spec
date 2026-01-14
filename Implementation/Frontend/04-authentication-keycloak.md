# 04 Authentication and Keycloak

This section explains how the frontend integrates with Keycloak.

## 1. Login Flow

1. User clicks login.
2. Redirect to Keycloak.
3. User completes login and MFA.
4. Keycloak returns tokens to the app.

## 2. Tokens

Use the access token for API calls.

Tokens MUST include:

- `tenant_id`
- `verticals` (if applicable)

If tenant_id is missing, block access.

## 3. Token Refresh

- Use silent refresh or refresh token.
- If refresh fails, log the user out.

## 4. Role and Scope Checks

The frontend should read roles/scopes from tokens but must not make final decisions.
The API is authoritative for authorization.

## 5. ROOT Behavior

ROOT bypass is enforced server side only.
The UI should still render correctly, but do not add extra UI bypasses.

## Checklist

- Login works with MFA
- Tokens include tenant_id
- Refresh works or logs out cleanly
