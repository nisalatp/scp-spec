# SCP Security & Access Control: Strategy & Operations

## 1. Executive Purpose
The **Security & Access Control (SAC)** system is the "Nervous System" of the platform's governance. Its primary purpose is to ensure that every request to the platform—whether from a mobile app, a web dashboard, or an external script—is strictly evaluated against a centralized set of policies. It transforms complex legal and organizational requirements into real-time technical enforcement.

## 2. Why is it Needed?
*   **Preventing Data Leaks**: In a multi-tenant, multi-vertical system, the risk of data bleeding (e.g., an Education officer seeing Health data) is high. SAC prevents this at the engine level.
*   **Enforcing Compliance**: Real-world laws often require "Deny-by-Default." SAC ensures no user has "implicit" access to anything.
*   **Complex Scoping**: Managing permissions for thousands of users across hundreds of geographical nodes is humanly impossible. SAC automates this through "Hierarchical Inheritance."
*   **Privacy by Design**: By integrating **Consent** and **Field Masking**, SAC ensures that even authorized users only see the data they "Need to Know" for their specific task.

## 3. How it Operates (The Policy Decision Point)
The SAC system acts as a **Policy Decision Point (PDP)**. It follows a strict, non-bypassable evaluation chain for every single request.

### 3.1 The Evaluation Chain
1.  **ROOT check**: Identifies if the user is a system-wide super-user (High Audit mode).
2.  **Tenant match**: Verifies the requester belongs to the organization owning the data.
3.  **Consent check**: Intercepts PII requests to ensure the citizen has granted permission to the specific vertical.
4.  **Scope resolution**: Calculates if the user's Geographic and Program scopes cover the target record.
5.  **Deny rules**: Checks for explicit prohibitions (e.g., "Suspended Users cannot see data").
6.  **Allow rules**: Checks for explicit permissions (e.g., `person.view`).
7.  **Field masking**: Redacts sensitive fields (e.g., full NIC number) based on the user's role.

### 3.2 Deny-Wins Logic
If any "Deny" rule is triggered at any level of the hierarchy, it immediately overrides all "Allow" rules. This ensures that a security revocation is effective instantly across all modules.

## 4. Operational Guardrails

### 4.1 No Implicit Access
There is no such thing as an "Admin" who can see everything by default. Every "Admin" role must be explicitly mapped to permissions and scoped to a specific geography.

### 4.2 Attribute-Based Decisions (ABAC)
The system can make decisions based on dynamic state:
*   "A Field Agent can only edit a record if the record is in `PROVISIONAL` status."
*   "A Case Worker can only view PII if their terminal is on a whitelisted IP range."

## 5. Audit & Transparency
*   **Explainable Decisions**: For every denied request, the system provides a high-level reason code (e.g., `ERR_AUTH_SCOPE_MISMATCH`) while logging the full detailed reason for administrators.
*   **Decision Logging**: Every allow and deny decision is recorded. This allows auditors to verify that the "Policy as Code" is behaving as expected in the real world.
