# Roles & Permissions: Attachments & Documents

## Participating Roles
- **Uploader**: Can write new files.
- **Viewer**: Can read files *if* they can read the parent record.
- **System**: Can delete files (Retention Policy).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `upload` | `attachment` | Verified Record | Case Worker | |
| `read` | `attachment` | Parent Record Access | Viewer | Inherits Parent permissions |
| `delete` | `attachment` | Owner | Admin | Soft Delete usually |

## Deny Wins
- If a file is flagged "Malware Detected", NO ONE can download it, not even Admin.
