# 02 Environments and Configuration

This section explains how to organize environments and configuration.

## 1. Environments

Create at least three environments:

- Dev
- Test
- Prod

Rules:
- Prod data must never be copied into Dev or Test.
- Configurations must be versioned.

## 2. Configuration Strategy

SCP uses tenant scoped configuration:

- Global defaults
- Tenant overrides
- Vertical specific overrides

Store config in a versioned store and apply it via the Configuration API.

## 3. Required Configuration Values

These are required at minimum:

- `tenant_id`
- `data_residency_region`
- `smtp_config` (per tenant)
- `feature_flags`
- `root_accounts_hashes`
- `keycloak` settings (realm, issuer, client IDs)

## 4. Secrets

Secrets must never be stored in source code.

Store these in a secret manager:

- Database credentials
- Keycloak admin password
- SMTP credentials
- Object storage access keys
- Signing keys

## Checklist

- Environments created
- Config structure agreed
- Secrets stored securely
- Values reviewed by governance
