# SCP Configuration Management: Strategy & Operations

## 1. Executive Purpose
The **Configuration Management** system is the platform's "Control Plane." Its primary purpose is to manage the myriad of settings—from API rate limits to localized UI labels—that define how SCP behaves for a specific tenant. It ensures that the platform remains flexible and configurable without sacrificing the stability or integrity of the core code.

## 2. Why is it Needed?
*   **Operational Tailoring**: Different countries have different requirements (e.g., date formats, mandatory fields, sync frequencies). Configuration Management allows for this without custom development.
*   **Safety & Governance**: Prevents "Cowboy Configuration" where a tenant admin could accidentally break a critical workflow. All changes require formal submission and approval.
*   **Feature Control**: Enables the "Umbrella Authority" to roll out new features to specific tenants gradually using feature flags.
*   **Security of Secrets**: Ensures that sensitive settings (e.g., encryption keys, external API credentials) are handled with the highest level of security and encryption.

## 3. How it Operates (The Scoped Control Plane)

The system operates on a **Hierarchical & Versioned** model.

### 3.1 Configuration Scoping
Settings are applied at three distinct levels:
1.  **Global**: Core platform behaviors that apply to all tenants (managed by ROOT).
2.  **Tenant**: Organization-wide settings (e.g., "Allow Offline Capture") requiring umbrella approval.
3.  **Vertical**: Domain-specific configurations (e.g., "Health Vertical Data Retention Period").

### 3.2 Change Workflow (Policy-as-Code)
1.  **Submission**: A Tenant Admin proposes a change (e.g., "Change Case Expiry from 30 days to 60 days").
2.  **Validation**: The system checks the value against allowed schemas and ranges.
3.  **Approval**: The **Umbrella Authority** reviews and signs off on the change.
4.  **Activation**: The configuration is "Reloaded" at runtime across all relevant application instances without a system restart.

## 4. Operational Guardrails

### 4.1 Immutable Versions
Every configuration change creates a new "Snapshot" version. If a new setting causes an operational issue, administrators can instantly "Roll Back" to a previous working version with a single click.

### 4.2 Encryption-at-Rest
Sensitive configuration values (secrets) are never stored in plain text. They are encrypted at the database level and only decrypted in memory during the specific process that requires them.

## 5. Audit & Transparency
*   **Drift Detection**: The system can compare current running configurations against the "Approved Baseline" to detect any unauthorized changes or manual database edits.
*   **Effective Config Trace**: For any event in the system, auditors can see exactly what the configuration settings were at that specific timestamp, ensuring "Explainability" for automated system actions.
*   **Approval Trail**: Every configuration value can be traced back to the specific approver and the "Reason for Change" provided during the submission workflow.
