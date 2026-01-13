# 07 Post Deployment Checks

This section lists checks that must pass before go live.

## 1. Auth and MFA

- Log in with a standard user and confirm email MFA works.
- Log in with a ROOT account and confirm access is granted.
- Verify tokens include `tenant_id`.

## 2. Tenant Creation

- Create a test tenant.
- Verify a dedicated database is used.
- Verify tenant config can be retrieved.

## 3. Core Workflows

- Create a person and household.
- Capture consent and verify it.
- Create a case and move it through lifecycle states.

## 4. Reporting

- Create a sample report definition.
- Run a report and export CSV.
- Confirm audit logs are written.

## 5. Integrations

- Create a test integration client in Keycloak.
- Call a test endpoint using the machine client token.
- Verify audit logs capture the integration_id.

## Checklist

- Auth and MFA pass
- Tenant creation verified
- Core workflows pass
- Reporting works
- Integration test passes
