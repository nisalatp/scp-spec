# Integrations Layer

## Purpose
The Integrations Layer is the governed gateway for all external data exchange. It ensures that no data leaves or enters the SCP ecosystem without explicit authorization, consent, and audit. It abstracts external systems (Banks, Ministry Databases) into standardized Adapters.

## Responsibilities
- **Gateway**: Single point of entry/exit for external traffic.
- **Translation**: Converting SCP internal models to external formats (e.g., ISO-20022 for payments).
- **Governance**: Enforcing "Data Minimization" and "Consent" on every packet.
- **Monitoring**: Tracking uptime and errors of partners.

## In Scope / Out of Scope
**In Scope**:
- REST/SOAP Adapters.
- Payment Gateways.
- Government Registry Lookups.
- Webhooks.

**Out of Scope**:
- Internal service-to-service communication (gRPC).
- Identity Federation (handled by IAM).

## Owned Data / Owned Policies
- **Data**: `IntegrationRegistry`, `IntegrationLog`.
- **Policies**: Rate Limit Policy, Partner Retry Policy.

## Dependent Components
- **Consent**: Must verify consent before sharing PII.
- **AuthZ**: Identifying the "Machine Client" (Service Account).
- **Tenancy**: Integrations are strictly Tenant-bound.

## Exposed Interfaces (APIs / Events)
- `POST /gateways/{integration_id}/execute` (Proxy).
- Webhook Receivers.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Integration Gateway).

## Related Use Cases
- **Payment Dispatch**: Sending Cash Transfer instructions to a Bank.
- **Identity Verification**: Calling a National ID system to verify a NIC.

## References
- `SPEC/09-integrations/01-integration-overview.md`
