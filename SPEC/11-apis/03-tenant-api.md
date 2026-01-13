# SCP-SPEC-API-03: Tenant API

## Purpose

This document defines APIs for tenant management and lifecycle operations.

## In Scope / Out of Scope

**In Scope**
- Tenant creation
- Tenant configuration access

**Out of Scope**
- Tenant billing

## Definitions

- Tenant: Country-level SCP instance.

## Rules (MUST/SHOULD/MAY)

- Tenant APIs MUST be restricted to ROOT or umbrella authority.
- Tenant identifiers MUST be immutable.
- Tenant configuration MUST be versioned.
- Tenant suspension MAY be supported.
- Tenant cloning MUST be supported for authorized roles.

## API Endpoints

- `GET /tenants`
  - Input: status (optional)
  - Output: tenant_id, country_code, status, created_at
- `POST /tenants`
  - Input: tenant_name, country_code, data_residency_region, default_locale (optional)
  - Output: tenant_id, status=active, created_at
- `PATCH /tenants/{tenant_id}`
  - Input: tenant_name (optional), default_locale (optional), status (optional)
  - Output: tenant_id, updated_at
- `GET /tenants/{tenant_id}`
  - Input: none
  - Output: tenant details, configuration_summary
- `POST /tenants/{tenant_id}/suspend`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: tenant_id, status=suspended, suspended_at
- `POST /tenants/{tenant_id}/resume`
  - Input: none
  - Output: tenant_id, status=active, resumed_at
- `POST /tenants/{tenant_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: tenant_id, status=archived, archived_at
- `POST /tenants/{tenant_id}/restore`
  - Input: reason_code, reason_text (optional)
  - Output: tenant_id, status=active, restored_at
- `POST /tenants/{tenant_id}/clone`
  - Input: target_tenant_name, target_country_code, data_residency_region
  - Output: tenant_id, status=active, created_at

## Edge Cases

- Partial tenant creation failures.
- Tenant deactivation with active cases.

## Audit & Logs

- Tenant API calls MUST be logged.
- Configuration changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/01-tenant-management.md
- SPEC/05-governance/02-umbrella-authority-model.md
