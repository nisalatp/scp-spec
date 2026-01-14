# SCP - Component Documentation (Level 3)

This document provides an exhaustive breakdown of the internal modules within the **SCP Modular Monolith**, as illustrated in the **Level 3 Component Diagram**. It defines the logical boundaries and interaction patterns that enable the platform's advanced governance.

---

## 1. Boundary: Security & Compliance
The "Trust Layer" that guards all system activity.

*   **Security & Access Control (SAC)**:
    *   **Logic**: Acts as the central **Policy Decision Point (PDP)**. It resolves complex "Deny-Wins" logic by combining User Role, Tenant ID, and Geographical Scope.
    *   **Data Involved**: Permissions (e.g., `member.disburse`), Scopes (e.g., `district-22`), and Vertical flags.
*   **Audit Logging**:
    *   **Logic**: Captures all state transitions in a tamper-evident repository. Every log entry is cryptographically linked to the previous one (optional) to ensure non-repudiation.
    *   **Data Involved**: Actor ID, Timestamp, IP Address, Resource GUID, and "Before/After" diffs.
*   **Consent Manager**:
    *   **Logic**: A strict gateway for PII. Before any PII-containing component returns data, it queries the Consent Manager to ensure a valid, unexpired consent record for the target beneficiary exists.
    *   **Data Involved**: Consent Version, Digital Signature/Proof, Expiry Date.

---

## 2. Boundary: Platform Core
The foundational "Social & Spatial Structure" registries.

*   **Tenant Management**:
    *   **Logic**: Enforces strict logical isolation. Manages organization-specific configs (logo, language, supported verticals).
*   **Identity (Person & Household)**:
    *   **Logic**: The Master Registry. Handles complex linkage between individuals and households. Includes **Deduplication Logic** (fuzzy matching) for incoming registrations.
    *   **Data Involved**: Biometric templates, National IDs, Family roles (Head of Household, etc.).
*   **Geo Engine**:
    *   **Logic**: Manages the national administrative tree. Every record in the system is tagged with a `GeoNodeID`. Supports spatial queries and hierarchical scope inheritance.
*   **Form Builder & Scripting**:
    *   **Logic**: Provides a runtime for dynamic data collection. The **Scripting DSL** allows for conditional logic (e.g., "If Age > 60, show Section X") and real-time field validation.

---

## 3. Boundary: Business Logic
The "Engines of Action" for specific developmental outcomes.

*   **Workflows & Case Management**:
    *   **Logic**: A robust state-machine. Tracks a beneficiary's progress through various program stages (Registered -> Vetted -> Enrolled -> Disbursed -> Closed).
*   **Eligibility Rules**:
    *   **Logic**: Evaluates ground-truth data against program-specific criteria. Uses a domain-specific language (DSL) to verify attributes like income thresholds or household composition.
*   **Finance**:
    *   **Logic**: Manages the ledger for social assistance. Ensures budget caps are respected and prevents double-dipping at the transaction level. Supports ISO 20022 message generation.
*   **Vertical Governance**:
    *   **Logic**: Domain-specific silos with unique security rules. (e.g., Health records require higher-level consent than public works attendance).

---

## 4. Boundary: Operations & Integrations
Bridging the platform with the physical world and external ecosystem.

*   **Field Operations**:
    *   **Logic**: Manages the orchestration of hundreds of mobile agents. Performs conflict resolution for concurrent updates during synchronization.
*   **Analytics & Data Mesh**:
    *   **Logic**: Extracts operational data into a read-optimized schema. Supports multi-vertical reporting and predictive modeling for policy makers.
*   **Integrations Layer**:
    *   **Logic**: Standardized API surface for external consumption. Includes Webhook management and secure API Key rotation.

---

## 5. Intra-Module Interaction Patterns

### The "Consent Interceptor" Pattern
*   When **Workflows** attempts to fetch a **Person** record for a case worker:
    1.  The request is intercepted by the **Consent Manager**.
    2.  If consent is verified, the **Identity** module is permitted to return the record.
    3.  If missing, the request is rejected with `ERR_CONSENT_REQUIRED`.

### The "Geographic Scope" Inheritance
*   The **Security & Access Control** component consults the **Geo Engine** to determine if a user has access to a specific record. 
*   If a user is authorized for "District A", the system automatically grants access to all villages (children) within that district.

### The "Rule-to-Finance" Bridge
*   Once **Eligibility Rules** marks a case as `ELIGIBLE`, it triggers the **Finance** module to calculate the pending disbursement based on the program's budget parameters and vertical guardrails.
