# SCP - System Context Documentation (Level 1)

This document provides an exhaustive technical and operational breakdown of the **Level 1 System Context Diagram** for the Smart Community Platform (SCP). It explains how the core system interacts with human actors and external sovereign entities.

---

## 1. Prime Stakeholders (Human Actors)

The platform supports a hierarchy of roles, each governed by strict access boundaries.

### 1.1 Field & Case Operations
*   **Field Agent**:
    *   **Function**: Mobile-equipped personnel performing on-ground census, enrollment, and service verification.
    *   **Interaction**: Submits PII, Geolocation data, and Biometric templates via an offline-first mobile application.
    *   **Responsibility**: Ensuring validity of "Ground Truth" data.
*   **Case Worker**:
    *   **Function**: Back-office administrative staff responsible for processing applications and triaging interventions.
    *   **Interaction**: Reviews provisional records via a secure Web Console; manages the state-machine transitions of individual cases.
    *   **Responsibility**: Manual verification and resolution of fuzzy-match identity conflicts.

### 1.2 Governance & Strategy
*   **Program Manager**:
    *   **Function**: Strategic designers of developmental initiatives (e.g., Nutritional Aid, Student Grants).
    *   **Interaction**: Configures Program Metadata, Dynamic Forms, and Eligibility Rules (DSL).
    *   **Responsibility**: Alignment of platform activities with policy objectives.
*   **Vertical Owner**:
    *   **Function**: Higher-level institutional representatives (e.g., Ministry leads).
    *   **Interaction**: Provides secondary "institutional sign-off" for program launches and high-value budget allocations.
    *   **Responsibility**: Across-departmental coordination and strategic alignment.

### 1.3 Technical & Compliance
*   **Tenant Administrator**:
    *   **Function**: Organizational master users.
    *   **Interaction**: Manages Identity Provider (IDP) integration, Role mappings, and Administrative Geographies.
    *   **Responsibility**: Operational uptime and local data governance.
*   **Auditor**:
    *   **Function**: Independent compliance officers (internal or third-party).
    *   **Interaction**: Read-only access to tamper-evident audit logs and aggregate outcome reports.
    *   **Responsibility**: Verifying the integrity of the "System of Trust."

---

## 2. The Core: Smart Community Platform (SCP)

The SCP is more than a database; it is a **Sovereign Governance Layer**.

*   **System Boundary**: Encapsulates all transactional logic, security policy enforcement, and record registries.
*   **Governance Principles**:
    *   **Multi-Tenancy**: Data isolation is enforced by the system at the database and application levels.
    *   **Deny-by-Default**: No action is permitted unless explicitly authorized by a role-permission mapping.
    *   **Neutrality**: The platform provides the infrastructure; the Tenants provide the policy.

---

## 3. Sovereign External Systems

| System | Role | Protocol Details |
| :--- | :--- | :--- |
| **National Identity System** | Canonical ID Verification | **SOAP/REST (mTLS)**: Used to verify National Identity Card (NIC) numbers or Passport details in real-time. |
| **Payment Gateway** | Aid Disbursement | **ISO 20022**: Standardized financial messaging for high-integrity fund transfers. Requires digital signing of batch instructions. |
| **Partner Systems** | Inter-agency Coordination | **Webhook/REST**: Pushes anonymized or consented event data (e.g., "Registration Complete") to external NGO or government MIS systems. |

---

## 4. Operational Data Flows & Interactions

### Flow A: The Registration Journey (UC-101)
1.  **Agent** captures PII + Biometric + **Consent**.
2.  **SCP** invokes **National Identity System** to verify legal standing.
3.  **SCP** performs internal fuzzy-matching to prevent duplication.
4.  Data is persisted as `PROVISIONAL` awaiting **Case Worker** review.

### Flow B: Policy-Driven Disbursement (UC-104)
1.  **Program Manager** defines Eligibility Rules.
2.  **SCP** automatically identifies qualifying **Beneficiaries**.
3.  **Finance Manager** reviews and signs off on the disbursement batch.
4.  **SCP** transmits cryptographically signed instructions to the **Payment Gateway**.

### Flow C: Accountability Trace
1.  Any actor action (e.g., "View PII") is intercepted by the platform.
2.  **SCP** records the Actor ID, Timestamp, IP, and Resource ID in an immutable store.
3.  **Auditor** can query these logs to reconstruct the timeline of any decision.
