# SCP Analytics & Data Mesh: Strategy & Operations

## 1. Executive Purpose
The **Analytics & Data Mesh** system is the platform's "Insight Engine." Its primary purpose is to transform raw vertical data into actionable knowledge—while strictly adhering to privacy and sovereignty boundaries. Unlike traditional centralized data warehouses, SCP uses a "Data Mesh" approach, where each functional domain (Health, Finance, etc.) is responsible for its own "Data Products," ensuring that those who understand the context of the data are also the ones who govern its quality and meaning.

## 2. Why is it Needed?
*   **Outcome Measurement**: Enables stakeholders to see if interventions are improving community well-being (e.g., "Has the average nutrition score improved in District X over the last 12 months?").
*   **Resource Allocation**: Uses spatial and demographic trends to help leaders decide where to build new facilities or launch new programs.
*   **Safe Data Sharing**: Provides a way to share "Aggregated Trends" with donors and international partners without ever exposing the PII of an individual citizen.
*   **Silo-Breaking**: Allows for "Cross-Vertical" insights (e.g., "Is there a correlation between school attendance and financial grant frequency?") through governed data joints.

## 3. How it Operates (The Federated Mesh)
The system operates on the principle of **Data-as-a-Product**.

### 3.1 Domain-Driven "Data Products"
Instead of one big "Export" button, the system exposes distinct Data Products:
*   **Operational Reports**: Real-time lists for daily management (e.g., "Unverified Registrations by Agent").
*   **Strategic Metric Sets**: Longitudinal trends for policy makers (e.g., "Employment Growth across Verticals").
*   **Compliance Datasets**: Ready-made reports for auditors ensuring neutrality and bias-checks.

### 3.2 The Global Governance Interceptor
Even in decentralized analytics, the platform's core security rules are never bypassed:
1.  **Consent Filter**: If a beneficiary has withdrawn consent for a vertical, their data is **Mathematically Excluded** from all aggregates, not just obscured.
2.  **Field Masking**: Reports automatically redact or mask fields based on the requester's role (e.g., a "Researcher" role sees age-groups, while a "Case Worker" sees birthdates).
3.  **Tenant-Locked**: Analytics are naturally siloed within a tenant, with "Umbrella Exports" requiring high-level multi-step approval.

## 4. Operational Guardrails

### 4.1 Differentially Private Aggregates
To prevent "Re-identification" (where a small village with only one recipient could be identified via aggregates), the system applies **K-Anonymity** thresholds. If a reporting group is too small to ensure anonymity, the system suppresses the data or aggregates it into a larger parent node.

### 4.2 Async "Safe Exports"
High-volume data requests are processed **Asynchronously**. The requester receives a secure, time-bound link once the system has finished the background work of filtering and masking the dataset, preventing performance impact on the live transactional database.

## 5. Audit & Transparency
*   **Inquiry Reason Logging**: For sensitive data exports, users must provide a mandatory "Purpose for Export" from a coded list.
*   **Export Record**: The system keeps a permanent record of **What** was exported, **Who** exported it, and exactly **What Policy** was applied (masking levels, etc.) at the time of export.
*   **KPI Reconciliation History**: Tracks the definitions of metrics. If a KPI (e.g., "Poverty Line") changes, the system preserves the historical definition to ensure current reports aren't compared against "apples-to-oranges" baselines.
