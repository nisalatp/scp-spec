# SCP Integrations Layer: Strategy & Operations

## 1. Executive Purpose
The **Integrations Layer** is the platform's "Digital Embassy." Its primary purpose is to provide a governed, secure, and audited mechanism for exchanging data with external systems—such as National ID registries, Payment Gateways, and NGO partner systems. It ensures that while the platform is "Open" to collaboration, it remains a "Closed" system regarding data sovereignty and privacy.

## 2. Why is it Needed?
*   **Interoperability**: Social protection requires coordination with external actors (e.g., Banks, Ministries). The Integrations Layer provides the "Translators" (Adapters) to talk to these diverse systems.
*   **Governance Enforcement**: It prevents "Shadow Integrations." No system can connect to SCP without a formal **Integration Contract** and explicit approval from the Umbrella Authority.
*   **Data Minimization**: Ensures that external partners only receive the specific fields they are legally entitled to, through automated masking and filtering.
*   **Citizen Protection**: Automatically blocks data sharing if a citizen withdraws their **Consent**, ensuring that external systems do not continue processing data against their will.

## 3. How it Operates (The Enforcement Boundary)

The system operates using a **Contract-Based Integration** model.

### 3.1 The Integration Contract
An integration is not just a technical "token"; it is a digital agreement defining:
*   **Vertical Scope**: Does this partner only see "Education" data or also "Health"?
*   **Data Surface**: Which specific API endpoints and fields are they allowed to pull?
*   **Interaction Pattern**: Is it a real-time API check or a nightly batch export?

### 3.2 The Governance Workflow
1.  **Request**: Tenant Admin or Partner requests a new connection.
2.  **Review**: Vertical Owners review the purpose and data scope.
3.  **Approval**: The Umbrella Authority grants final approval.
4.  **Credentialing**: A machine-identity (Keycloak Client) is issued, bound strictly to the approved contract.

### 3.3 Protocol Adapters
The layer uses **Adapters** to handle the complexity of the outside world (e.g., ISO 20022 for finance, mTLS for government APIs, or standard Webhooks for NGOs), keeping the core monolith clean and agnostic.

## 4. Operational Guardrails

### 4.1 Throttling & Resilience
The layer protects the core system from "External Noise":
*   **Rate Limits**: Prevents a partner system from overloading the database with excessive requests.
*   **Graceful Degradation**: If an external government API goes down, the Integration Layer manages retries and provides "Stale-Data" or "Pending" responses back to the core.

### 4.2 Consent Interception
The Integration Layer is the final check before data leaves the system. It runs a mandatory **Consent Check** for every record in the payload. If a person in the batch has withdrawn consent, their record is automatically removed from the outgoing file.

## 5. Audit & Transparency
*   **Machine-Identity Logs**: Every successful and failed integration call is logged. Administrators can see exactly which machine-client accessed which resource.
*   **Compliance Dashboard**: Provides Vertical Owners with real-time visibility into which external systems are currently consuming their data and for what purpose.
*   **Tamper-Evident History**: The record of who approved an integration and what the initial contract version was is locked, preventing unauthorized "Scope Creep" by tenant admins.
