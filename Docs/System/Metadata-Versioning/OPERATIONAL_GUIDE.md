# SCP Metadata Versioning: Strategy & Operations

## 1. Executive Purpose
The **Metadata Versioning** system is the "Immutable Heart" of the platform. Its primary purpose is to ensure that the system's logic (Forms, Rules, Configurations) is never changed "in-place." By treating every update as a new, immutable snapshot, the system guarantees that historical records remain accurate to the logic that existed at the time of their creation. It prevents "Silent Logic Drift," where changing a setting today could accidentally rewrite the interpretation of a record from last year.

## 2. Why is it Needed?
*   **Scientific & Legal Integrity**: If a grant was approved based on "Rule Version 1.0," you must be able to prove exactly what that rule said, even five years later after the system has moved to "Rule Version 5.0."
*   **Safe Rollbacks**: If a new configuration or form update causes an issue in the field, this system allows for a perfect "Rollback" to a known-stable version without any data loss.
*   **Auditability**: Every "Logic Change" is a controlled event. This prevents unauthorized actors from subtly modifying system behavior without leaving a traceable version increment.
*   **Offline Consistency**: Field agents can be "Pinned" to a specific version of a form while out of sync, ensuring the mobile device and server remain in lock-step during the capture lifecycle.

## 3. How it Operates (The Immutable Snapshots)

The system operates on the principle of **Versioned References**.

### 3.1 Immutable Snapshots
1.  **Creation**: A modification to a managed object (e.g., a form field) does not overwrite the existing record.
2.  **Versioning**: The system increments the version ID and saves the entire object state as a new, read-only "Snapshot."
3.  **Indefinite Retention**: Old snapshots are never deleted. They are archived and can be recalled at any time for auditing or historical reporting.

### 3.2 Reference Pinning
Transactional records (e.g., a Case or a Form Submission) do not point to the "current" form; they point to a **Fixed Version ID**. This ensures that the record's schema is always stable, regardless of future platform updates.

## 4. Operational Guardrails

### 4.1 Draft Isolation
New versions of metadata start in a `DRAFT` state. Drafts are invisible to the general field population (Agents/Case Workers). They are only visible to the "Owner," the "Umbrella Authority," and "ROOT," allowing for safe staging and review before a policy goes live.

### 4.2 Migration Policy
When moving from one version to another, the system applies strict **Compatibility Checks**. If a change is "Breaking" (e.g., removing a mandatory field that old records depend on), the system requires explicit governance approval to manage the transition.

## 5. Audit & Transparency
*   **The Chain of Truth**: Each version includes metadata about **Who** created it, **When**, and which **Governance Decision** authorized the change.
*   **Diff Visibility**: Administrators can use the versioner to "Compare" any two snapshots, highlighting exactly what changed in the underlying logic.
*   **Outcome Explanations**: When a user asks "Why did the system do this?", the Versioning system provides the exact logic snapshot that was active at that moment, providing a clear and transparent explanation.
