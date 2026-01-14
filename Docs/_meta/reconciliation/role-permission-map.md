# Role-Permission Map

This document formally maps SCP Roles to their canonical Permission Namespaces and Key Actions, verifying alignment with the SPEC.

| Role | Canonical Namespace(s) | Key Actions (Examples) | Status |
| :--- | :--- | :--- | :--- |
| **System Administrator** | `tenant.*`, `config.*`, `policy.*`, `audit.*` | `tenant.create`, `system.config.write` | [x] Verified |
| **Tenant Administrator** | `user.*`, `role.*`, `vertical.*`, `integration.*` | `user.create`, `role.assign`, `vertical.create` | [x] Verified |
| **Field Agent** | `person.*`, `household.*`, `visit.*`, `facility.*` | `person.create`, `visit.execute` | [x] Verified |
| **Case Worker** | `case.*`, `member.*`, `attachment.*` | `case.approve`, `member.update` | [x] Verified |
| **Program Manager** | `program.*`, `rules.*`, `form.*`, `report.*` | `program.create`, `rules.write`, `report.generate` | [x] Verified |
| **Vertical Owner** | `vertical.*`, `program.*`, `data.*`, `audit.*` | `vertical.delegate`, `program.approve` | [x] Verified |
| **Finance Manager** | `budget.*`, `finance.*`, `obligation.*`, `export.*` | `budget.create`, `finance.view`, `export.financial` | [x] Verified |
| **Integration Manager** | `integration.*`, `webhook.*`, `api.*` | `integration.register`, `webhook.configure` | [x] Verified |
| **Auditor** | `audit.*`, `report.*`, `*.read` | `audit.view-all`, `report.generate` | [x] Verified |

## Reconciliation Notes
- All permissions have been transitioned to **dot-notation** (`resource.action`) per `SPEC-SEC-06`.
- Overlaps between `Program Manager` and `Vertical Owner` regarding program approval have been clarified (Vertical Owner provides the high-level governance approval).
- `Field Agent` permissions are strictly geo-scoped at the AuthZ engine level.
- `Case Worker` and `Field Agent` roles for member management have been synchronized under the `Identity (Person & Household)` component.
