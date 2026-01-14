# Roles Inventory

| Role Key | Role Name | Mentioned In (SPEC) | Primary Scope/Vertical | Notes |
|---|---|---|---|---|
| `platform-admin` | Platform Admin / Tenant Admin | `SPEC/04-security/07-scopes-groups-roles.md` | Tenant-wide | Configures tenant, creates users/roles. |
| `umbrella-authority` | Umbrella Authority | `SPEC/05-governance/02-umbrella-authority-model.md` | Tenant-wide | Governance approval, conflict resolution, overrides. |
| `root` | ROOT | `SPEC/04-security/03-root-accounts.md` | Global / Cross-Tenant | Bypass role, infrastructure level. |
| `auditor` | System Auditor | `SPEC/04-security/12-audit-logging.md` (Implied) | Tenant-wide | Read-only access to audit logs. |
| `vertical-owner` | Vertical Owner | `SPEC/05-governance/03-vertical-governance.md` | Vertical | Manages vertical config, programs, policy packs. |
| `field-agent` | Field Agent | `SPEC/03-domain/08-agent-field-ops-model.md` | Geo + Vertical | Data collection, visits. Can be Volunteer. |
| `donor` | Donor | `SPEC/08-operations/03-donor-operations.md` | Vertical + Program | Read-only funding visibility. |
| `case-worker` | Case Worker | `SPEC/03-domain/05-case-intervention-model.md` (Implied) | Vertical | operational role for managing cases. |
| `program-manager` | Program Manager | `SPEC/03-domain/04-program-model.md` (Implied) | Program | Manages specific program execution. |
