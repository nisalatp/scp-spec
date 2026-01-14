# SCP Marketplace Access: Strategy & Operations

## 1. Executive Purpose
The **Marketplace Access** system is the "Governance Gatekeeper" for external collaboration. Its primary purpose is to provide a formal, time-bound, and audited process for external organizations (NGOs, Research Institutes, National Ministries) to request and receive access to specific SCP resources. It ensures that no external entity can connect to the platform without a verified purpose and a high-level approval from the Umbrella Authority.

## 2. Why is it Needed?
*   **Preventing Unauthorized Access**: Provides a "Front Door" for external requests. Instead of ad-hoc email approvals, every request follows the same digital protocol.
*   **Time-Bound Security**: Access is not "Forever." The marketplace enforces `Active Until` dates, ensuring that permissions expire automatically unless renewed.
*   **Purpose-Based Governance**: Requires organizations to state a "Request Purpose." If the purpose disappears (e.g., a specific project ends), access is revoked.
*   **Trust Tiering**: Enables the platform to differentiate between a "Highly Trusted" Government Ministry and a "Temporary" NGO program, applying different levels of oversight to each.

## 3. How it Operates (The Onboarding Workflow)

The system operates on a **Request-Grant-Review** model.

### 3.1 The Access Request
An organization starts by submitting a structured request:
1.  **Identity**: Name of the organization and the legal entity responsible.
2.  **Scope**: Which Verticals (Health, Finance, etc.) and which Programs do they need to see?
3.  **Duration**: How long is the access required for?

### 3.2 The Umbrella Approval
Requests are reviewed by the **Umbrella Authority** (the highest governance body):
*   **Verification**: Does the organization actually exist and is it registered to operate in the tenant country?
*   **Purpose Check**: Is their request aligned with the platform's social protection goals?
*   **Decision**: The request is either `APPROVED` (moving to an active grant) or `REJECTED` (logged as a security event).

## 4. Operational Guardrails

### 4.1 Strict Revocation
The system provides a "Kill Switch" for governance. If an external organization violates a data policy, their Access Grant can be switched to `REVOKED` instantly, which immediately disconnects all their machine clients across all verticals.

### 4.2 Minimum Privilege
Access grants are strictly scoped. If an organization is granted access to the "Health" vertical, they cannot "Pivot" to "Education" data using the same credentials.

## 5. Audit & Transparency
*   **Grant History**: The registry maintains a permanent record of all grants—active, expired, and revoked. This allows for long-term auditing of "Who has ever had access to this country's data."
*   **Purpose Matching**: Auditors can compare the data actually consumed (via the **Integrations Layer** logs) against the "Request Purpose" stored in the **Marketplace Access** registry to detect scope creep.
*   **Notification of Expiry**: The system can automatically notify both the partner and the tenant administrator before a grant expires, ensuring that critical service delivery is not interrupted by a technical lockout.
