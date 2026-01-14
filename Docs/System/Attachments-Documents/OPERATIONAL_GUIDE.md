# SCP Attachments & Documents: Strategy & Operations

## 1. Executive Purpose
The **Attachments & Documents** system is the "Evidence Vault" of the platform. Its primary purpose is to store, manage, and secure binary data—such as scanned National ID cards, photos of households, and signed consent forms. It ensures that every record in the platform is backed by verifiable digital evidence.

## 2. Why is it Needed?
*   **Trust Verification**: High-integrity registers (like Identity) require physical proof. This system provides the bridge between the digital record and the physical document.
*   **Non-Repudiation**: By storing immutable versions of documents, the platform prevents actors from claiming they "didn't sign" or " didn't provide" certain information.
*   **Privacy Control**: Attachments contain the most sensitive PII (e.g., photos, biometric hashes). This system applies extra layers of security beyond standard database rows.
*   **Operational Resilience**: Allows field workers to upload proof even in remote areas, which is then centrally verified by specialists.

## 3. How it Operates (The Immutable Storage)

The system operates on a **Verify-before-Authoritative** model.

### 3.1 The Upload Pipeline
1.  **Metadata Initiation**: The requester creates a metadata record in a `PENDING_UPLOAD` state.
2.  **External Storage**: The binary content is pushed to a secure, governed Object Store (e.g., S3 or MinIO).
3.  **Checksum & Scan**: The system verifies the file integrity via checksums and performs a mandatory **Virus Scan**.
4.  **Verification**: A Case Worker reviews the scan/photo. Only after approval is the attachment marked as `VERIFIED`.

### 3.2 Versioning & Immutability
Once a document is marked as `VERIFIED`, it is **Immutable**. If a new version of the same document is uploaded (e.g., a renewed Passport), the system creates a new version ID while preserving the original for audit history.

## 4. Operational Guardrails

### 4.1 Access Scoping
Access to an attachment is strictly inherited from the **Target Record** (e.g., Case or Person) it is linked to:
*   If you don't have permission to view Person A, you cannot view Person A's NIC scan.
*   **Consent Bound**: If consent for a Vertical is withdrawn, all attachments linked to cases in that Vertical are immediately blocked.

### 4.2 Handling Sensitivity (OCR & Masking)
*   **OCR (Optional)**: The system can automatically extract text from documents to assist in deduplication and data entry.
*   **Masking**: Standard users may see a "Redacted" or thumbnail version of a document, with full-resolution access restricted to verified specialists.

## 5. Audit & Transparency
*   **Access Logging**: Every single download or "View" of an attachment is logged as a high-severity audit event.
*   **Sanitization Record**: If an attachment is archived or removed for legal reasons, the system retains the metadata and the deletion reason, even if the binary content is purged from storage.
