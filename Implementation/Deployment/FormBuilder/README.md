# Form Builder: Deployment

## Storage Requirements
*   **Schema Store**: PostgreSQL (Relational metadata) + Redis (Cache for high-read schemas).
*   **Submission Store**: PostgreSQL (JSONB) or MongoDB (for high-volume, varying schema data).
*   **Media**: S3-compatible storage for Photos/Signatures attached to forms.

## Scaling
*   **Read-Heavy**: Field workers download schemas (~50KB) every morning. CDN caching is recommended.
*   **Write-Spiky**: Sync happens when workers return to connectivity. The Submission API must be horizontally scalable.
