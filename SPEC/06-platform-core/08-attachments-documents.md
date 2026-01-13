# SCP-SPEC-CORE-08: Attachments and Documents

## Purpose

This document defines how documents and attachments are stored, accessed, and governed.

## In Scope / Out of Scope

**In Scope**
- File uploads
- Document metadata
- Access control

**Out of Scope**
- Content editing
- External DMS systems

## Definitions

- Attachment: A binary file linked to a record.
- Document: An attachment with metadata.

## Rules (MUST/SHOULD/MAY)

- Attachments MUST be immutable once verified.
- Access MUST respect authorization and consent.
- Attachments MUST NOT be added until the related record is verified.
- Attachments SHOULD be virus-scanned.
- Storage MAY be external but governed.
- Document versions MUST be supported.
- OCR MUST be supported and MAY be disabled per tenant.
- New attachment versions MUST require fresh verification before access.

## Attachment Lifecycle Workflow

1. Create attachment metadata in pending_upload state.
2. Upload file content to external object storage.
3. Complete the upload and verify checksum.
4. Run virus scan; block access if scan fails.
5. Run OCR if enabled for the tenant.
6. Mark attachment version as verified and immutable.
7. Archive attachment when it must be removed from active access; retain audit history.

## Minimum Required Fields

- attachment_id (system GUID)
- tenant_id
- target_type (person, household, case, program, or other)
- target_id
- version_id
- status (pending_upload, uploaded, scanned, verified, archived)
- file_name
- content_type
- size_bytes
- storage_key (external object storage reference)
- checksum
- classification_level (optional)
- vertical_id (nullable)
- program_id (nullable)
- created_by, created_at

## Edge Cases

- Large file uploads.
- Corrupt files.

## Audit & Logs

- Upload and access MUST be logged.
- Deletions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/11-api-security.md
- SPEC/10-data/03-physical-data-schema-postgres.md
