# 10 Permissions and Consent

This section explains how to handle permissions and consent in the UI.

## 1. Permissions

- The API is the final authority.
- The UI can hide or disable actions based on roles.
- Always handle 403 responses gracefully.

## 2. Consent

- Consent is per person and per vertical.
- Consent must be verified before data is usable.
- If consent is withdrawn, read only mode applies as per API rules.

## 3. Masking

- The API may return masked fields.
- The UI must display masked values as provided.
- Never attempt to infer hidden data.

## Checklist

- UI respects permission hints but does not bypass API
- Consent status is visible in workflows
- Masked data is displayed without alteration
