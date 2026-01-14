# SCP Audit Logging: Strategy & Operations

## 1. Executive Purpose
The **Audit Logging** system is the platform's "Undeletable Memory." Its primary purpose is to maintain a high-fidelity, immutable record of every action significant to security, governance, or privacy. It ensures that the platform remains a "System of Trust" by providing accountability for every decision made by both human actors and automated engines.

## 2. Why is it Needed?
*   **Accountability**: Every action (e.g., "Why was Case X suspended?") must be traceable to a specific actor and a specific reason code.
*   **Legal Evidence**: In disputes regarding benefit eligibility or privacy breaches, the audit log acts as the definitive legal evidence of system activity.
*   **Security Forensics**: Allows security teams to reconstruct a timeline of events during an investigation (e.g., identifying if an actor performed "Bulk PII Viewing").
*   **Operational Transparency**: Vertical Owners and Auditors need to verify that policies are being followed correctly on the ground.

## 3. How it Operates (The Immutable Stream)
The system operates as an **Append-Only Event Store**.

### 3.1 Fail-Closed Security
For critical actions (e.g., AuthN, Consent Withdrawal, Disbursement), the system implements a **Fail-Closed** policy:
*   If the Audit Engine cannot guarantee that an event will be recorded (e.g., due to a logging database outage), the primary action itself is **Blocked**. 
*   This ensures that no "Dark Actions" can occur without a record.

### 3.2 The Rich Event Schema
Every audit event captures the full context of the "Scene":
*   **Actor**: Who did it? (User ID, IP Address, Device ID).
*   **Action**: What happened? (e.g., `case.suspend`, `consent.withdraw`).
*   **Scope**: Where did it happen? (Tenant ID, Vertical ID, Geo ID).
*   **Outcome**: Was it successful? (Success, Failure, Denied).
*   **Correlation**: Linking multiple logs together (e.g., "This API request triggered these 3 internal module events").

## 4. Operational Guardrails

### 4.1 Immutability
Audit logs are stored in a way that prevents modification, even by a Database Administrator. The system does not support an "Update" or "Delete" command for the audit table.

### 4.2 Selective Visibility
While the system logs everything, the visibility of these logs is strictly tiered:
*   **Tenant Admins**: Can see logs for their specific tenant.
*   **Auditors**: Have read-only access to governance-related logs.
*   **ROOT users**: Can view cross-tenant system logs.
*   **Standard Users**: Have no access to raw audit logs.

## 5. Audit & Transparency
*   **Real-time Alerts**: High-severity events (e.g., "ROOT Login" or "Consent Bypass") trigger immediate notifications to the platform's security monitors.
*   **Tamper Evidence**: Digital signatures or hashing chains can be used to prove that a sequence of logs has not been tampered with since creation.
*   **Retention Policies**: Logs are retained for a duration defined by tenant law (e.g., 7 or 10 years), after which they are offloaded to "Cold Storage" but never silently deleted.
