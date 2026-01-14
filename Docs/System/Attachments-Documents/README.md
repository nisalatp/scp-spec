# Attachments & Documents

## Purpose
The Attachments component handles binary files (Images, PDFs) linked to System Entities. It ensures secure storage, virus scanning, and strict access control, complying with the principle that "If you can't see the Case, you can't see the Photo".

## Responsibilities
- **Storage**: Managing uploads to Object Storage (S3/Azure Blob).
- **Security**: Generating short-lived Signed URLs for access.
- **Scanning**: Malware detection on upload.
- **Linkage**: Polymorphic association to People, Cases, Facilities, etc.

## In Scope / Out of Scope
**In Scope**:
- File Lifecycle (Upload -> Scan -> Active -> Archived).
- Metadata management (Content-Type, Size).
- Access Control inheritance.

**Out of Scope**:
- Document Editing (e.g., Online Word Processor).
- File Systems (Folders/Directories).

## Key Concepts
- **Attachment**: A file.
- **Target**: The entity (Case, Person) the file belongs to.

## Component Relationship
- **All Functional Components**: Rely on this for storing proofs (e.g., "Photo of ID Card").
