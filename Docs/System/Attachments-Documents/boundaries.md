# Boundaries: Attachments & Documents

## Ownership
- **Owns**: The *Pointer* to the file (S3 Key).
- **Owns**: The *Security Process* (Scan, Sign).

## Never Owns
- **The Context**: The Attachment doesn't know *why* it was uploaded. The parent `Case` holds the business context.

## Integration Boundaries
- **Inbound**:
    - **Field App**: Uploads photo of beneficiary.
- **Outbound**:
    - **Object Storage**: S3/MinIO.
    - **Virus Scanner**: ClamAV or Cloud Native Scanner.
