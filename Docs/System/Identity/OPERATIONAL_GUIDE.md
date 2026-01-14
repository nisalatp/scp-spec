# SCP Identity System: Strategy & Operations

## 1. Executive Purpose
The **Identity System (Person & Household)** is the foundational registry of the Smart Community Platform. Its primary purpose is to create a "Single Source of Truth" for every citizen and their social structure. By moving away from fragmented, siloed lists, the Identity system ensures that every intervention is linked to a verified individual, preventing duplication and ensuring that aid reaches the right hands.

## 2. Why is it Needed?
*   **Deduplication**: Prevents the "Double Dipping" problem where individuals register multiple times under different names to receive extra benefits.
*   **Targeting Precision**: By understanding the **Household** unit, the platform can target support based on familial needs (e.g., households with elderly members or infants).
*   **Continuity of Care**: Ensures that as a citizen moves between Health, Education, and Welfare programs, their history and eligibility follow them.
*   **Legal Visibility**: Provides a secure way to manage the digital identity of populations that may lack traditional documentation.

## 3. How it Operates (The Master Registry)

The system operates as a **Social Structure Registry** with two primary entities: **Person** and **Household**.

### 3.1 The Registration Hierarchy
1.  **Search & Discovery**: Before creating a record, the system performs a multi-parameter search (National ID, Name, Biometric Hash) to ensure no existing record exists.
2.  **Provisional Entry**: New records captured in the field are marked as `PROVISIONAL`. They are locked for active program enrollment until verified.
3.  **Verification Lifecycle**: A Case Worker reviews the captured evidence (NIC scans, photos) and transitions the status to `VERIFIED`.

### 3.2 Household Linkage
Instead of simple addresses, SCP uses **Household Entities**:
*   A Household has a unique identifier and a specific **Geolocation**.
*   Individuals are "Linked" to a household with a specific relationship role (Head of Household, Spouse, Dependent).
*   **Annexures & Splits**: The system supports the "Splitting" of households (e.g., when a child starts their own domestic unit at the same physical location).

## 4. Operational Guardrails

### 4.1 Verification Integrity
*   **Evidence Mandatory**: A record cannot be moved to `VERIFIED` without an attached scan of an official document or a biometric reference.
*   **GPS Anchoring**: Every household creation is anchored by a GPS coordinate captured at the time of registration, preventing "Ghost Households."

### 4.2 Data Ownership
*   **Versioned Demographics**: Changes to core data (Name, DOB) are versioned. The system retains the history of who changed what and when.
*   **Relationship Inferring**: The system automatically flags potential conflicts—for example, if a child is linked to two different "Heads of Household."

## 5. Audit & Transparency
*   **Inquiry Logging**: Every time a profile is viewed (even if not edited), the system logs the "Viewer ID" and "Reason for Search."
*   **Metadata Accuracy**: The system tracks the "Data Maturity" of each record, flagging profiles that have missing mandatory fields or expired ID documents.
