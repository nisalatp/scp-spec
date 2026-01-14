# View Attachment (Download)

## Description
Fetching a file securely. The system never proxies the bytes; it generates a short-lived URL for the client to fetch from Object Storage.

## Component
Attachments & Documents

## Actors / Roles
- **User**

## Permissions
- `attachment.view`

## Scope Rules
- **Inheritance**: User must have `read` access to the Target Entity.

## Main Flow
1.  **Actor**: Requests File `ID_Card.jpg`.
2.  **System**:
    - Checks Permissions on Target Case.
    - Generates Signed URL (Valid for 5 mins).
3.  **Actor**: Follows Redirect.

## Data Read / Written
- **Attachment**: Read Metadata.

## Audit & Compliance
- **Audit**: "User X viewed Attachment Y".

## Related Use Cases
- UC-41: Supervisor Review

## References
- `SPEC/06-platform-core/08-attachments-documents.md`
