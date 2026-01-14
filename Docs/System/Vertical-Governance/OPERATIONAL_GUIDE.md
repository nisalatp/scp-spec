# SCP Vertical Governance: Strategy & Operations

## 1. Executive Purpose
**Vertical Governance** is the platform's "Accountability Framework." Its primary purpose is to partition the platform into distinct, sovereign domains—known as **Verticals** (e.g., Health, Education, Finance). By defining these boundaries, the system ensures that those who are legally and professionally responsible for a domain are also the ones who control the data, policies, and workflows within that domain. It transforms a unified platform into a collaborative ecosystem of specialized authorities.

## 2. Why is it Needed?
*   **Organizational Sovereignty**: Different government ministries or NGOs have their own mandates and laws. Vertical governance respects these silos while allowing for safe interoperability.
*   **Privacy-by-Design**: By strictly partitioning data, the platform ensures that an "Education" officer cannot see a citizen's "Medical" history unless there is an explicit, consented reason to do so.
*   **Risk Mitigation**: If a security issue occurs in one vertical, governance boundaries can be used to "Isolate" that vertical (Restricted/Suspended state) without bringing down the entire platform.
*   **Specialized Oversight**: Allows domain experts (e.g., a Chief Medical Officer) to approve the forms, rules, and agents relevant to their specific field, rather than relying on a general system administrator.

## 1. How it Operates (The Interest Boundary)

The system operates around **Governed Vertical Entities**.

### 3.1 Standard vs. Custom Verticals
1.  **System Verticals**: Mandatory domains (Health, Education, Economy, Finance, Data) that are always enabled and represent the core pillars of social protection.
2.  **Custom Verticals**: Specific, time-bound domains (e.g., "Post-Flood Reconstruction 2025") that can be requested by tenant admins but require high-level **Umbrella Approval**.

### 3.2 The Lifecycle of Authority
Verticals follow a managed path:
*   **Draft/Requested**: A new domain is proposed with a specific mission.
*   **Approved/Active**: The domain is launched and can start enrolling beneficiaries and launching programs.
*   **Restricted/Suspended**: Used during audits or policy transitions to freeze activity.
*   **Archived**: The vertical is closed, but its history and data are preserved for longitudinal research and legal compliance.

## 4. Operational Guardrails

### 4.1 "Strictest-Rule" Intersection
In multi-vertical interventions (e.g., a "School Lunch Program" involving both Education and Health), the platform automatically applies the **strictest governance rules** across all participating verticals. If one vertical forbids data sharing and another allows it, the "Forbidden" rule wins, protecting the most sensitive data.

### 4.2 Vertical Ownership of Policy
Only a designated **Vertical Owner** (or their authorized delegates) can approve the "Consent Texts" and "KPIs" for their domain. This ensures that the language a citizen sees when granting consent is legally accurate for that specific field.

## 5. Audit & Transparency
*   **Cross-Vertical Traceability**: Any time a user from one vertical requests data from another, the system logs the event with the "Reason for Access" and the "Consent ID" used to authorize it.
*   **State Change Integrity**: Moving a vertical to `SUSPENDED` or `ACTIVE` is a high-privilege action that requires a formal decision record, ensuring that domain-wide shutdowns are never accidental or unauthorized.
*   **KPI Reconciliation**: The governance system provides tools to align metrics across different verticals (e.g., ensuring that "Income" is measured in the same way for both Welfare and Education grants), ensuring data-mesh consistency.
