# SCP-SPEC-INTEGR-05: Government and NGO Integrations

## 1. Purpose and Objectives

This specification defines how the Smart Community Platform (SCP) integrates with government systems and non-governmental organization (NGO) systems in a secure, governed, auditable, and constitution-safe manner.

Objectives:

- Enable lawful data exchange between SCP and external public/NGO systems
- Support program execution, verification, reporting, and compliance
- Ensure strict tenant (country) isolation
- Enforce vertical boundaries, consent rules, and data minimization
- Allow integration without forcing alignment of ideology, constitution, or mandate
- Support both automation and human-governed approval workflows

SCP integrations are capability enablers, not data dumps.

## 2. In Scope / Out of Scope

### 2.1 In Scope

- Integration with:
  - Government registries (population, welfare, education, health)
  - Government reporting systems
  - NGO program systems
  - International development platforms
- Data exchange for:
  - Verification
  - Eligibility checks
  - Program coordination
  - Aggregated reporting
- Secure APIs (push and pull)
- Batch and real-time data exchange
- Tenant-scoped, vertical-scoped integrations
- Approval, onboarding, suspension, and revocation workflows
- Auditing, traceability, and compliance logging

### 2.2 Out of Scope

- Direct database-to-database access
- Unmediated data replication
- Cross-country data sharing without explicit umbrella approval
- Identity provider federation (Keycloak federation is handled separately)
- UI-level integrations (API only)
- Hardcoded integration logic inside core SCP services

## 3. Definitions

| Term                     | Definition                                                             |
| ------------------------ | ---------------------------------------------------------------------- |
| Integration Partner      | A government agency or NGO system authorized to exchange data with SCP |
| Tenant                   | A country-level SCP deployment                                         |
| Vertical                 | An interest/governance boundary (e.g., Health, Education)              |
| Integration Contract     | A formal definition of data, purpose, scope, and controls              |
| Push Integration         | External system sends data into SCP                                    |
| Pull Integration         | SCP retrieves data from an external system                             |
| Batch Exchange           | Periodic bulk data transfer                                            |
| Real-Time Exchange       | Event-driven or request/response data exchange                         |
| Umbrella Authority       | Top-level governing authority within SCP                               |
| Consent Boundary         | Person-level consent per vertical                                      |

## 4. Normative Requirements (MUST / SHOULD / MAY)

### 4.1 General Principles

- Integrations MUST be explicitly approved before activation.
- Integrations MUST be scoped to:
  - A single tenant (country)
  - One or more explicit verticals
- Integrations MUST NOT bypass SCP governance, consent, or authorization layers.
- SCP MUST act as the policy enforcement point.

### 4.2 Authentication and Authorization

- Integrations MUST authenticate using Keycloak-issued OIDC tokens.
- Integrations MUST be represented as machine clients in Keycloak.
- Tokens MUST include:
  - `tenant_id`
  - `integration_id`
  - allowed `verticals`
- SCP MUST reject requests without valid tenant and vertical claims.

Additional controls:

- API keys MAY be used as a secondary identifier (never alone).
- mTLS MAY be required for high-risk integrations.
- IP allowlists SHOULD be configurable per integration.

### 4.3 Consent and Data Sharing

- SCP MUST enforce per-person, per-vertical consent.
- If consent is withdrawn:
  - Data MUST NOT be shared further.
  - Existing shared data MUST be logged as frozen.
  - Aggregated or anonymized outputs MUST be blocked for the affected vertical.
- Integrations MUST NOT access:
  - Fields without explicit consent
  - Records blocked due to consent withdrawal (no read)

### 4.4 Vertical Scoping

- Each integration MUST declare its permitted verticals.
- SCP MUST apply strictest-intersection rules for cross-vertical data.
- Integrations MUST NOT infer data from other verticals implicitly.

### 4.5 Tenant Boundaries and Data Residency

- Integrations MUST operate within a single tenant.
- Cross-tenant integration MUST require umbrella authority approval.
- Data MUST reside within the tenant's configured data residency region.
- SCP MUST NOT export raw personal data outside residency rules.

### 4.6 Rate Limits, Errors, Retries, SLAs

- SCP MUST enforce per-integration rate limits.
- Default:
  - Real-time APIs are rate-limited.
  - Batch APIs are quota-limited.
- SCP MUST return structured error responses.
- Integrations SHOULD implement exponential backoff retries.
- SCP MAY define per-integration SLAs (availability, latency).

## 5. Data Exchange Model

### 5.1 Exchange Patterns

| Pattern               | Supported |
| --------------------- | --------- |
| Push (External -> SCP) | YES       |
| Pull (SCP -> External) | YES       |
| Batch                 | YES       |
| Real-Time             | YES       |
| Event-Driven (Webhooks) | MAY     |

### 5.2 Supported Formats

- JSON (primary)
- CSV (batch only)
- XML (only where mandated by government systems)
- Domain standards SHOULD be used where applicable:
  - HL7 (health)
  - IATI (aid transparency)
  - SDMX (statistics)

### 5.3 Data Minimization

- Integrations MUST exchange only:
  - Required fields
  - Approved aggregates
- SCP MUST support field-level filtering and masking per integration.

## 6. Onboarding and Approval Workflow

### 6.1 Integration Onboarding

1. Integration request submitted by:
   - Government agency
   - NGO
   - SCP tenant admin
2. Integration status set to Requested.
3. Vertical owner reviews scope (Reviewed).
4. Legal/consent review (if required).
5. Umbrella authority approval (Approved).
6. Keycloak client created.
7. Integration activated (Active).

### 6.2 Lifecycle States

```
Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
```

- Restricted: read-only or limited data
- Suspended: access revoked but configuration retained
- Deprecated: replacement in progress; no new data exchange
- Archived: immutable historical record

## 7. Security Controls

### 7.1 Mandatory Controls

- TLS 1.2+ for all traffic
- OIDC token validation
- Tenant and vertical claim enforcement
- Audit logging

### 7.2 Optional or Conditional Controls

- mTLS for sensitive data
- IP allowlists
- Payload encryption
- Time-bound access tokens

## 8. Audit and Logging Requirements

SCP MUST log:

- Every integration request
- Identity of integration client
- Tenant and vertical context
- Data categories accessed
- Consent checks performed
- Success/failure outcome

Audit logs MUST be:

- Append-only
- Tamper-evident
- Retained per tenant policy
- Exportable for regulators

## 9. Edge Cases and Failure Modes

### 9.1 Consent Withdrawal Mid-Integration

- Ongoing requests MUST be denied once withdrawal is effective.
- Event logged.
- Integration notified via error response.

### 9.2 External System Downtime

- SCP retries according to policy.
- Batch jobs paused and resumable.
- No data loss permitted.

### 9.3 Schema Mismatch

- SCP MUST reject incompatible payloads.
- Errors returned with machine-readable codes.

### 9.4 Mis-Scoped Integration

- Requests outside declared verticals MUST be denied.
- Security incident logged.

## 10. Open Questions

- None.

## 11. References (Related SCP Specs)

- `../04-security/02-authentication.md`
- `../04-security/05-authz-engine-evaluation.md`
- `../04-security/09-consent-and-data-sharing.md`
- `../04-security/10-data-classification-and-masking.md`
- `../05-governance/02-umbrella-authority-model.md`
- `../05-governance/03-vertical-governance.md`
- `../09-integrations/01-integration-overview.md`
- `../11-apis/13-integration-api.md`
