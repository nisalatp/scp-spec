# SCP Notifications: Strategy & Operations

## 1. Executive Purpose
The **Notifications** system is the platform's "Voice." Its primary purpose is to keep citizens and staff informed about critical updates—such as payment approvals, case suspensions, or impending consent expiries. By providing a centralized, template-driven engine for Email and SMS, the system ensures that communication is professional, localized, and strictly compliant with privacy regulations.

## 2. Why is it Needed?
*   **Closing the Feedback Loop**: Citizens need to know the status of their aid. Notifications provide this real-time visibility without requiring the person to visit a community center.
*   **Proactive Compliance**: The system automatically warns citizens before their **Consent** expires, helping them maintain their "Right to Use" and preventing accidental loss of benefits.
*   **Operational Coordination**: Staff receive alerts for high-priority tasks (e.g., "New Urgent Registration for Review"), ensuring that the platform's workflows move smoothly.
*   **Emergency Broadcasting**: In times of crisis, the system provides a governed mechanism for sending emergency alerts to specific geographic communities.

## 3. How it Operates (The Delivery Engine)

The system operates as a **Template-Driven Dispatcher**.

### 3.1 Localized Templates
Instead of hard-coded text, the system uses templates:
*   **Placeholders**: Templates use tags (e.g., `{{person_name}}`, `{{payment_date}}`) which are filled at runtime from the authoritative database.
*   **Localization**: The same "Payment Approval" notification can be sent in Sinhalese, Tamil, or English, depending on the recipient's preferred language stored in their **Identity** profile.

### 3.2 Tenant Adapters
Communication infrastructure varies by country. SCP uses **Adapters** to connect to:
*   **Tenant SMTP**: For email delivery using the country's official email servers.
*   **Sovereign SMS**: For text message delivery via local telecommunications providers.
*   **Security**: All credentials for these external systems are encrypted-at-rest within the **Configuration Management** system.

## 4. Operational Guardrails

### 4.1 "Consent-First" Dispatch
Before sending a non-critical message, the system checks the recipient's **Consent** status for the relevant Vertical. If consent has been withdrawn, the notification is suppressed to respect the citizen's privacy.

### 4.2 System-Critical Overrides
Certain messages are marked as `SYSTEM_CRITICAL` (e.g., "MFA Code" or "Data Breach Notification"). These messages can bypass standard consent filters to ensure the safety and security of the citizen's account and the platform's integrity.

## 5. Audit & Transparency
*   **Delivery Logs**: Every dispatch attempt is logged, including the timestamp, the recipient, the template used, and the final status (Success/Failure/Bounced).
*   **Bounce Management**: The system tracks "Bounced" emails or "Failed" SMS. If a recipient's contact information consistently fails, the system flags their **Identity** record with a "Stale Contact" warning for follow-up by a field agent.
*   **Emergency Overrides**: Use of the emergency broadcast feature is a high-severity audit event, requiring vertical-owner justification to prevent misuse of the messaging infrastructure.
