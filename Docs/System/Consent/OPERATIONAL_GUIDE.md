# SCP Consent System: Strategy & Operations

## 1. Executive Purpose
The **Smart Community Platform (SCP) Consent System** is the technical realization of the platform's core governance principle: **Citizen Sovereignty**. 

In most traditional systems, once data is collected, the citizen loses control. SCP reverses this by making Consent a mandatory "gatekeeper" for all Personal Identifiable Information (PII). The system is designed to build trust with communities by ensuring that data processing is always transparent, limited in scope, and revocable.

## 2. Why is it Needed?
*   **Legal & Ethical Compliance**: Meets international data protection standards (GDPR-like principles) for sovereign nations.
*   **Institutional Trust**: Donors and partners need assurance that their funding is being used in a legally sound and ethically governed environment.
*   **Security & Safety**: In sensitive verticals (like health or child protection), unauthorized data access can pose real-world risks to citizens.
*   **Accountability**: Every piece of data used in a decision must have a traceable "Right to Use" linked to it.

## 3. How it Operates (The Policy Information Point)
The system operates as a **Policy Information Point (PIP)** that intercepts data requests.

### 3.1 The "Gatekeeper" Logic
Before any internal component (e.g., Finance, Workflows) or external API can return PII, the system performs a three-way check:
1.  **Who is asking?** (User Role/Scope)
2.  **What are they asking for?** (Record ID / Vertical)
3.  **Is there a valid "Right to Use"?** (Consent Check)

If no active, verified consent record exists for that specific **Person** and **Vertical**, the system returns a `403 Forbidden` with the code `ERR_CON_REQUIRED`.

### 3.2 The Lifecycle of a Consent Record
The system manages the following lifecycle transitions:

| State | Trigger | Outcome |
| :--- | :--- | :--- |
| **Pending** | Capture by Field Agent (Offline). | Data exists but is inaccessible to standard users. |
| **Active** | Verification of signature/photo evidence. | Full role-based access permitted within the vertical. |
| **Grace Period** | `Active Until` date passes. | Read-only access for existing cases; no new actions/exports. |
| **Expired** | Grace period ends. | Total block on access (same as Withdrawal). |
| **Withdrawn** | Citizen requests revocation. | Immediate block on all operational and analytical usage. |
| **Rejected** | Proof/Identity verification fails. | Record is invalidated; recapture is required. |

## 4. Operational Guardrails

### 4.1 Boundary Enforcement
*   **Vertical Isolation**: Consent is never "Global." Granting permission for Health does not allow the Education department to see the data.
*   **Evidence-Backed**: Every consent captured on the ground MUST include a signature, photo, or recording. Without evidence, the record remains in a `Pending` state.

### 4.2 Withdrawal Protections
*   **Safety Lock**: Consent withdrawal trigger an automatic suspension of any active cases for that person to prevent unauthorized processing.
*   **Un-repudiation**: Withdrawal creates an immutable audit trail entry, ensuring that no official can claim they "didn't know" the citizen revoked access.

### 4.3 Grace Periods
To prevent sudden failure of critical services (e.g., halfway through a health treatment), the system allows a tenant-configurable **Grace Period** (up to 90 days). During this time, staff can finish existing work in a read-only mode while prompting the citizen for renewal.

## 5. Audit & Transparency
Every single interaction with the Consent System is logged.
*   **Consent Log**: Tracks grants, renewals, and withdrawals.
*   **Bypass Audit**: If a "ROOT" user bypasses consent for emergency reasons, it triggers an "Ultra-Priority" alert to the Auditor.
