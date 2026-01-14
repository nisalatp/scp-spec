# Edge Cases & Failures: Attachments & Documents

## Edge Cases
1.  **Orphaned Uploads**: User gets Signed URL but never uploads.
    - *Cleanup*: S3 Lifecycle Rule deletes incomplete multipart uploads after 24h. System Job cleans up `Pending` DB records.
2.  **MIME Type Spoofing**: User names file `image.jpg` but it's a script.
    - *Detection*: Scanner / Magic Number check. Force Content-Disposition `attachment` on download to prevent browser execution.

## Failure Handling
- **S3 Down**: API returns 503. User must retry later.
