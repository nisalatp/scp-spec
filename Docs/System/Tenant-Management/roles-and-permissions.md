# Roles & Permissions: Tenancy

## Participating Roles
- **ROOT**: Can create/delete tenants.
- **Platform Admin**: Can configure *their* tenant.
- **Umbrella Authority**: Approves tenant config changes.
- **Auditor**: Views tenant lifecycle logs.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `tenant` | Global | ROOT | All Others | Physical provisioning |
| `update` | `tenant.config` | Tenant | Platform Admin | - | Subject to Umbrella functions |
| `view` | `tenant` | Global | ROOT, Auditor | - | List all tenants |
| `view` | `tenant` | Tenant | All Authenticated | - | "My Tenant" only |

## Consent Interactions
- **N/A**: Tenancy is infrastructure.

## Deny Wins
- If a User is banned globally (by Identity Provider), they cannot access *any* tenant.
