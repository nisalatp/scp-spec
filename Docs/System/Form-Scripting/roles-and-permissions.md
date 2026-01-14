# Roles & Permissions: Form Scripting

## Participating Roles
- **Platform Admin**: Runs imports for their tenant.
- **Developer**: Writes the scripts (Offline).
- **ROOT**: Can force-import packages across multiple tenants.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `import` | `form_package` | Tenant | Platform Admin | - | Dangerous Impact |
| `view` | `import_log` | Tenant | Platform Admin | - | Auditing |
| `edit` | `script` | Local | Developer | - | Not a system permission |

## Consent Interactions
- **N/A**: Scripting is a metadata operation.

## Deny Wins
- Standard rules.
