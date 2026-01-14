# Roles & Permissions: Workflows & Case Management

## Participating Roles
- **Case Worker**: Front-line staff who manage the case.
- **Approver / Supervisor**: Reviews decisions.
- **Vertical Owner**: Defines the Workflow steps.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `case` | Geo-Scoped | Case Worker | - | Intake |
| `approve` | `workflow_step` | Tenant/Unit | Supervisor | Case Worker | Segregation of Duty |
| `audit` | `case_history` | Tenant | Auditor | - | Compliance |

## Consent Interactions
- **Active Consent Required**: You cannot Create or View a Case for a Person who has not Consented to that Vertical.
- **Withdrawal**: If Consent is Withdrawn, the Case is **Auto-Suspended**.

## Deny Wins
- "Suspended" cases freeze all payouts and edits, overriding any User Permission.
