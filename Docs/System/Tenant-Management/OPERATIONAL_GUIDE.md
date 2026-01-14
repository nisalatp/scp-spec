# SCP Tenant Management: Strategy & Operations

## 1. Executive Purpose
The **Tenant Management** system is the platform's "Isolation Layer." Its primary purpose is to ensure that SCP can serve multiple sovereign entities (e.g., different countries or top-level organizations) on a shared infrastructure without any risk of data contamination. It provides the "Sovereign Boundary" within which all other modules (Identity, Geo, Finance) operate.

## 2. Why is it Needed?
*   **Data Sovereignty**: In social protection, one country's data must NEVER be visible or accessible to another country's staff. Tenant management provides this hard wall.
*   **Localized Governance**: Each country has unique laws, languages, and administrative structures. Tenant management allows for localized configuration while maintaining a common core.
*   **Infrastructure Efficiency**: Allows for a centralized "Platform as a Service" model while maintaining the security properties of independent systems.
*   **Compliance Control**: Enables the "Umbrella Authority" to manage global compliance while allowing local "Tenant Admins" to manage daily operations.

## 3. How it Operates (The Sovereign Boundary)

The system enforces isolation at every layer of the technology stack.

### 3.1 Hard Isolation (Database per Tenant)
Unlike simple "TenantID" columns, SCP implements a **Database-per-Tenant** strategy for core transactional data. This ensures:
*   **Encryption Isolation**: Each tenant can have its own encryption keys.
*   **Performance Stability**: A heavy data-processing task in Tenant A does not slow down the database for Tenant B.

### 3.2 Membership & Scoping
Users do not "log in to SCP"; they log in to a specific **Tenant Context**:
1.  **Identity Federation**: A user's account is verified by a global Identity Provider.
2.  **Explicit Membership**: The user must have a valid membership record in a specific tenant to see any data.
3.  **Cross-Tenant Users**: High-level experts can belong to multiple tenants, but they must explicitly "Switch Context," clearing one tenant's data from memory before loading another's.

## 4. Operational Guardrails

### 4.1 State Governance
A tenant can exist in several managed states:
*   **Draft**: Configuration phase; no live data collection.
*   **Active**: Mission-critical operations.
*   **Restricted**: Read-only mode during audits or payment freezes.
*   **Archived**: Historical data retained; all active access blocked.

### 4.2 Versioned Configuration
Every change to a tenant's settings (e.g., changing the default grace period for consent) is versioned. Administrators can compare current settings against historical baselines to troubleshoot policy drift.

## 5. Audit & Transparency
*   **Sovereign Compliance**: The system logs all high-level tenant actions (Create, Suspend, Move).
*   **Inter-Tenant Traceability**: If a "ROOT" user performs an action across tenants (e.g., for global maintenance), the action is logged with an "Umbrella Context" that distinguishes it from local administrative work.
*   **Org-Tree Integrity**: The system prevents a tenant from being deleted if it contains active child nodes (Geo/Beneficiaries), requiring a formal "Sanitization & Archival" workflow first.
