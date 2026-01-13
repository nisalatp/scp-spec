# SCP-SPEC-API-10: Attachments API

## Purpose

This document defines APIs for managing attachments and documents.

## In Scope / Out of Scope

**In Scope**
- Upload and download
- Metadata access

**Out of Scope**
- Content editing

## Definitions

- Attachment: Binary document.

## Rules (MUST/SHOULD/MAY)

- Attachment APIs MUST enforce access control.
- Attachments MUST be immutable after verification.
- Upload size limits SHOULD be enforced.
- Virus scanning MAY be applied.
- Attachment versions MUST be supported.
- New attachment versions MUST require fresh verification before access.

## API Endpoints

### Attachment Metadata

- `POST /attachments`
  - Input: target_type, target_id, file_name, content_type, size_bytes, classification_level (optional), vertical_id (optional), program_id (optional)
  - Output: attachment_id, version_id, status=pending_upload, upload_url, expires_at
- `GET /attachments/{attachment_id}`
  - Input: none
  - Output: attachment_id, status, target_type, target_id, current_version_id, created_at
- `GET /attachments`
  - Input: target_type (optional), target_id (optional), status (optional)
  - Output: attachment_id, status, target_type, target_id, updated_at

### Upload Completion and Verification

- `POST /attachments/{attachment_id}/complete`
  - Input: version_id, storage_key, checksum
  - Output: attachment_id, status=uploaded, updated_at
- `POST /attachments/{attachment_id}/scan`
  - Input: version_id
  - Output: attachment_id, scan_status, updated_at
- `POST /attachments/{attachment_id}/ocr`
  - Input: version_id
  - Output: attachment_id, ocr_status, updated_at
- `POST /attachments/{attachment_id}/verify`
  - Input: version_id, verified_by, verified_at
  - Output: attachment_id, status=verified, verified_at

### Versions

- `POST /attachments/{attachment_id}/versions`
  - Input: file_name, content_type, size_bytes
  - Output: attachment_id, version_id, status=pending_upload, upload_url, expires_at
- `GET /attachments/{attachment_id}/versions`
  - Input: none
  - Output: list of versions with status and created_at

### Access and Archive

- `GET /attachments/{attachment_id}/download`
  - Input: version_id (optional)
  - Output: download_url, expires_at
- `POST /attachments/{attachment_id}/archive`
  - Input: reason_code, reason_text (required if OTHER)
  - Output: attachment_id, status=archived, archived_at

## Edge Cases

- Upload interruption.
- Corrupt files.

## Audit & Logs

- Attachment API calls MUST be logged.
- Access events MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/08-attachments-documents.md
- SPEC/04-security/11-api-security.md
