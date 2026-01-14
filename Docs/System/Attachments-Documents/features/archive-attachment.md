# Archive Attachment

## Description
Removing a file from active use without deleting the audit trail. Files are moved to cheaper "Cold Storage" or marked deleted.

## Component
Attachments & Documents

## Actors / Roles
- **User**
- **System** (Retention Policy)

## Permissions
- `attachment.delete`

## Scope Rules
- **Inheritance**.

## Main Flow
1.  **Actor**: Clicks "Delete".
2.  **System**: Sets `status = Archived`.
3.  **System**: Moves file to Glacier (optional).

## Data Read / Written
- **Attachment**: Update.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/06-platform-core/08-attachments-documents.md`
