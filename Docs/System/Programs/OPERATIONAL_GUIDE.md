# SCP Programs: Strategy & Operations

## 1. Executive Purpose
The **Programs** system is the platform's "Policy Registry." Its primary purpose is to define the structured initiatives (e.g., "Maternal Health Grant", "Post-Disaster Housing Support") that govern how aid is distributed. It acts as the anchor for eligibility rules, KPIs, and multi-vertical participation, ensuring that every intervention is part of a broader, governed social protection strategy.

## 2. Why is it Needed?
*   **Initative Standardization**: Ensures that regardless of which region or agent is working, the rules for a specific program are uniform across the tenant.
*   **Outcome Management**: By defining KPIs at the program level, the platform can measure the collective impact of thousands of individual cases.
*   **Resource Coordination**: Allows for "Multi-Vertical" programs where different ministries share the same goal and budget, preventing double-dipping and coordination gaps.
*   **Versioned Policy**: Enables policy-makers to update program rules (e.g., changing eligibility criteria) while preserving the history of old rules for legacy cases.

## 3. How it Operates (The Program Registry)

The system operates as a **Versioned Initiative Metadata** store.

### 3.1 Program Scoping
Every program is defined by its boundaries:
1.  **Vertical Ownership**: One vertical is the "Primary Owner," but others can be "Participants."
2.  **Geo-Scope**: Programs can be limited to specific districts or villages.
3.  **Time-Window**: Programs have `Active From` and `Active Until` dates, allowing for seasonal or emergency-specific planning.

### 3.2 Integrated Rules
A program is effectively a "Container" that points to:
*   An **Eligibility RuleSet** (evaluated by the Rules Engine).
*   A set of **Forms** (for baseline, follow-up, and outcome capture).
*   A **Financial Budget** (tracked by the Finance system).

## 4. Operational Guardrails

### 4.1 "Intersection" Rule
In multi-vertical programs, the system automatically applies the "Intersection" principle: an action is only permitted if it passes the security and consent checks of **all** participating verticals. This prevents sensitive data from one vertical leaking into another through a shared program.

### 4.2 Approved-to-Active
A program cannot enroll beneficiaries until it has been formally **Approved** by the Umbrella Authority. This prevents "Rogue Programs" from being launched without high-level oversight.

## 5. Audit & Transparency
*   **Lifecycle History**: Every state change of a program (e.g., from `Draft` to `Active`) is logged with the approving user's signature.
*   **Cloning Record**: When a program is cloned from one tenant (country) to another, the system preserves the "Source ID," aiding in international knowledge sharing and best-practice standardisation.
*   **Outcome Traceability**: All case outcomes are linked back to the program version that was active during the intervention, providing a clear audit trail for impact evaluation.
