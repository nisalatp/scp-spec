# Upload Attachment

## Description
Securely storing a binary file (e.g., ID Photo, Medical Record) linked to a system entity. Uses a 2-step process (Metadata -> Presigned URL) to handle large files efficiently.

## Component
Attachments & Documents

## Actors / Roles
- **User** (Agent, Case Worker)
- **System** (Scanner)

## Permissions
- `attachment.create`

## Scope Rules
- **Access Inheritance**: User must have `write` access to the Target Entity (e.g., The Case).

## Preconditions
- Target Entity must exist.

## Main Flow
1.  **Actor**: Request Upload URL for `case-123`.
2.  **System**:
    - Validates Access.
    - Generates Presigned URL (S3).
    - Creates Metadata `status = Pending`.
3.  **Actor**: Uploads File directly to S3.
4.  **System (Webhook)**: Triggers Virus Scan.
5.  **System**: Sets `status = Active` (if clean).

## Alternate / Error Flows
- **Virus Detected**: File Deleted. Status = `Rejected`.

## Data Read / Written
- **Attachment**: Write.

## Related Use Cases
- UC-04: Household Registration (Photo)

## References
- `SPEC/06-platform-core/08-attachments-documents.md`
