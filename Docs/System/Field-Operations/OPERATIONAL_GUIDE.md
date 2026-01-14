# SCP Field Operations: Strategy & Operations

## 1. Executive Purpose
The **Field Operations** system is the "Human Connection" point of the platform. Its primary purpose is to enable trusted personnel (Field Agents) to perform complex documentation, enrollment, and verification tasks in environments with limited or no internet connectivity. It ensures that the "Ground Truth" captured in the village is securely and accurately transmitted to the central governance registries.

## 2. Why is it Needed?
*   **Reaching the Last Mile**: Many community members live in "Offline" zones. Field Operations allow the platform to serve these populations using offline-first mobile technology.
*   **Data Quality at Source**: By providing agents with dynamic forms and real-time validation (even offline), the system prevents data entry errors before they reach the server.
*   **Trusted Enrollment**: Assisted enrollment through a verified agent is safer and more inclusive than expecting every citizen to have a smartphone and high digital literacy.
*   **Operational Control**: Enables managers to track agent productivity, ensure they are visiting assigned geographic areas (GPS tracking), and manage the data sync lifecycle.

## 3. How it Operates (The Offline-First Lifecycle)

The system is built on a **Capture-Sync-Verify** model.

### 3.1 Offline Capture
1.  **Preparation**: The agent logs in while online to download their assigned "Geo-Context" and "Task List."
2.  **Field Activity**: The agent captures PII, Photos, and Consent signatures while offline. Data is stored in an encrypted vault on the device.
3.  **Local Validation**: The **Form Scripting** engine runs on the mobile device, enforcing logic (e.g., "Field X is required") without needing a server connection.

### 3.2 Synchronization (The Delta Sync)
Once the agent regains connectivity:
*   **Delta Upload**: Only the new or changed records are sent to the server.
*   **Conflict Detection**: If a record was modified by another user since the last sync, the system flags it for "Conflict Resolution."
*   **Policy Refresh**: The device downloads the latest security policies, role mappings, and person-records (for those who recently revoked consent).

### 3.3 Verification Gateway
All field-captured data enters the system as `PROVISIONAL`. It must pass through a **Verification Workflow** (handled by Case Workers) where evidence is checked against the national registry before the data becomes "Authoritative."

## 4. Operational Guardrails

### 4.1 Geographical Guardrails (Geo-Scoping)
Agents are strictly bound to a geographical node. If an agent tries to register a household in Village B while assigned to Village A, the system flags the registration as "Out of Scope" for audit.

### 4.2 Security of Data-at-Rest
If an agent's device is lost or stolen:
*   **Encryption**: All data on the mobile device is encrypted.
*   **Remote Revocation**: Tenant Administrators can remotely revoke the agent's session, which triggers an "Auto-Wipe" of sensitive data on the next attempted sync.

## 5. Audit & Transparency
*   **Sync Audit**: The system maintains a log of every sync attempt, including successes, partial failures, and the total duration.
*   **GPS Verification**: Every field submission is tagged with a GPS coordinate. Managers can use "Heatmaps" to verify that agents are actually where they claim to be.
*   **Agent Productivity Reports**: Provides insight into enrollment rates and submission quality per agent, helping identify those who may need additional training.
