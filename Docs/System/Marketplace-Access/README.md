# Marketplace Access

## Purpose
The Marketplace Access component governs how **External Organizations** (NGOs, Researchers, Partner Agencies) request and receive access to SCP resources. It acts as the "Visa Department" for the platform, ensuring no external entity enters without a valid, time-bound, and scoped permit.

## Responsibilities
- **Request Management**: Handling the application process ("I want access to Health data").
- **Approval Workflow**: Routing requests to the correct Umbrella Authority.
- **Grant Management**: Issuing time-bound Access Grants (Tokens/Scopes).
- **Revocation**: The ability to cut off access immediately.

## In Scope / Out of Scope
**In Scope**:
- Governing API Access for Partners.
- Managing Service Accounts for Integrators.
- Expiry and Renewal workflows.

**Out of Scope**:
- Commercial Billing (Monetization is explicitly out of scope).
- Public Open Data (Marketplace is for *Restricted*, *Governed* access).

## Key Concepts
- **Access Request**: The application form.
- **Access Grant**: The approved permit.
- **Principal**: The external entity requesting access.

## Component Relationship
- **Integrations**: The Integration Layer checks the `Access Grant` before processing API calls.
- **Identity**: External organizations are modeled as a type of Identity.
