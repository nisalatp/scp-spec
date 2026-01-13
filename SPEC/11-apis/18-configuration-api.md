# SCP-SPEC-API-18: Configuration Management API

## Purpose

This document defines APIs for managing tenant configuration and feature flags.

## In Scope / Out of Scope

**In Scope**
- Tenant configuration versions
- Feature flags

**Out of Scope**
- Infrastructure provisioning

## Definitions

- Configuration: Tenant-scoped settings controlling platform behavior.
- Feature Flag: Toggle controlling feature availability.

## Rules (MUST/SHOULD/MAY)

- Configuration MUST be versioned.
- Changes MUST be auditable.
- Sensitive configuration MUST be encrypted.

## API Endpoints

- `GET /tenants/{tenant_id}/config`
  - Input: none
  - Output: config_version_id, config_payload
- `POST /tenants/{tenant_id}/config`
  - Input: config_payload, active_from (optional)
  - Output: config_version_id, created_at
- `GET /tenants/{tenant_id}/config/versions`
  - Input: none
  - Output: list of config_version_id, created_at

- `GET /tenants/{tenant_id}/feature-flags`
  - Input: none
  - Output: flag_key, status
- `POST /tenants/{tenant_id}/feature-flags`
  - Input: flag_key, status, reason_code (optional)
  - Output: flag_key, status, updated_at

## Edge Cases

- Conflicting flag changes.
- Partial config application failures.

## Audit & Logs

- Config changes MUST be logged.
- Feature flag changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/10-configuration-management.md
