# Roles & Permissions: Metadata Versioning

## Participating Roles
- **Editor**: Creates Drafts.
- **Publisher**: Freezes Draft into Published Version.
- **Consumer**: Reads Published Version.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `create_draft` | `definition` | Tenant | Editor | |
| `publish` | `definition` | Tenant | Umbrella Admin | Irreversible Action |
| `read` | `definition_version` | None | All | Public Definitions |

## Deny Wins
- You cannot `edit` a `Published` version. Access functions simply fail/deny.
