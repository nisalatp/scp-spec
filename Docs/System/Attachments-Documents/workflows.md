# Workflows: Attachments & Documents

## Workflow: Uploading a Photo
1.  **Frontend**: User selects `photo.jpg`. Calls `POST /sign`.
2.  **API**: Validates permissions. Returns `https://s3.aws.../upload?token...`
3.  **Frontend**: PUTs binary directly to S3.
4.  **Frontend**: Calls `POST /complete`.
5.  **System**:
    - Marks `scan_status: Pending`.
    - Triggers Async Scanner.
6.  **Scanner**: Downloads, checks. Returns 'Clean'.
7.  **System**: Updates `scan_status: Clean`.
8.  **User**: Can now view the image.

## Workflow: Malware Handling
1.  **Scanner**: Finds "Eicar Test File".
2.  **System**:
    - Updates `scan_status: Infected`.
    - Deletes file from S3 (or moves to Quarantine bucket).
    - Notifies User "Upload Failed: Security Violation".
