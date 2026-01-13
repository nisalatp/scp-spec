# SCP-SPEC-INTEGR-01: Integration Overview

## 1. Purpose and Objectives of the Integration Layer

The SCP Integration Layer provides a governed, secure, and extensible mechanism for exchanging data and events between the Smart Community Platform (SCP) and external systems, including governments, NGOs, donors, service providers, and future ecosystem partners.

Objectives:

- Enable lawful and purposeful data exchange
- Preserve tenant (country) sovereignty and isolation
- Enforce vertical boundaries, consent, and data minimization
- Support multiple integration patterns without custom core logic
- Ensure auditability, traceability, and compliance
- Allow integrations to evolve independently of core SCP logic

The Integration Layer is not a shortcut around governance; it is an enforcement boundary.

## 2. In Scope / Out of Scope

### 2.1 In Scope

- All external system integrations (government, NGO, private, international)
- API-based data exchange
- Event and webhook delivery
- Batch and real-time integrations
- Security, approval, lifecycle, and audit of integrations
- Tenant- and vertical-scoped access controls
- Integration adapters and connectors

### 2.2 Out of Scope

- Direct database access or replication
- UI-level integrations
- Hardcoded integration logic inside core modules
- Identity federation (handled by authentication spec)
- Manual data exchange outside SCP APIs
- Cross-tenant data sharing without umbrella approval

## 3. Definitions (Key Terms)

| Term                     | Definition                                                         |
| ------------------------ | ------------------------------------------------------------------ |
| Integration              | A formally governed connection between SCP and an external system  |
| Partner                  | An external organization operating the integrated system           |
| Integration Contract     | A documented agreement defining data, scope, purpose, and controls |
| Adapter                  | SCP-side implementation translating external protocols/formats     |
| Connector                | A specific integration instance bound to a tenant and verticals    |
| Webhook                  | SCP-initiated event notification to an external endpoint           |
| Event                    | A domain occurrence published by SCP (e.g., case approved)         |
| Integration Client       | A machine identity registered in Keycloak                          |
| Lifecycle State          | Governance state of an integration (Draft, Active, etc.)           |

## 4. Core Principles

All integrations MUST adhere to the following principles:

### 4.1 Tenant Isolation

- Each integration MUST operate within a single tenant (country).
- Cross-tenant integrations require explicit umbrella authority approval.

### 4.2 Vertical Scoping

- Integrations MUST declare permitted verticals.
- Data access is restricted to those verticals only.
- Cross-vertical data access follows strictest-intersection rules.

### 4.3 Consent Enforcement

- Person-level, vertical-level consent MUST be enforced.
- Consent withdrawal MUST immediately block integration access for the affected vertical (no read) for non-ROOT users, including aggregated or anonymized outputs.

### 4.4 Data Minimization

- Only the minimum necessary data may be exchanged.
- Field-level filtering and masking MUST be applied.

### 4.5 Shared Integration Registry

- SCP MUST provide a shared integration registry across tenants for vetted integration definitions.
- Registry entries MUST be reusable as templates, but data access MUST remain tenant-scoped and require tenant approval.

## 5. Integration Types and Patterns

### 5.1 Direction

| Pattern               | Supported |
| --------------------- | --------- |
| Push (External -> SCP) | YES       |
| Pull (SCP -> External) | YES       |

### 5.2 Timing

| Pattern                      | Supported |
| ---------------------------- | --------- |
| Batch (scheduled / bulk)     | YES       |
| Real-Time (request/response) | YES       |
| Event-Driven (webhooks)      | MAY       |

### 5.3 Data Exchange Models

- Request/response APIs
- File-based batch imports/exports
- Event notifications (publish/subscribe)

## 6. Integration Lifecycle and Governance

### 6.1 Lifecycle States

```
Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
```

### 6.2 Governance Workflow

1. Request
   - Submitted by partner or tenant admin
2. Review
   - Vertical owner reviews scope and purpose
3. Approval
   - Umbrella authority approval (mandatory)
4. Activation
   - Keycloak client issued
   - Rate limits and policies applied
5. Ongoing Monitoring
   - Audit, metrics, and compliance checks
6. Suspension or Deprecation
   - For violations, expiry, or replacement
7. Archival
   - Configuration locked; history retained

Partner sandbox environments MAY be provided as logical sandboxes within a tenant but are not required by default.
Data escrow MUST NOT be required for high-sensitivity exchanges.
Per-request human approval is not required by default.

### 6.3 Integration Lifecycle Workflow

1. Integration is created in Draft with tenant and vertical scope.
2. Request is submitted for review (Requested).
3. Vertical owner reviews scope and data contract (Reviewed).
4. Umbrella authority approves or rejects (Approved or Rejected).
5. Keycloak machine client is issued and integration becomes Active.
6. Integration MAY be Restricted (read-only) or Suspended (no access) for violations.
7. Deprecated integrations are replaced and then Archived as immutable history.

### 6.4 Minimum Required Fields

- integration_id (system GUID)
- tenant_id
- integration_name
- partner_name
- partner_type (government, NGO, private, or international)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- vertical_ids
- active_from
- active_until (nullable)
- data_contract_ref (versioned contract reference)
- auth_client_id (Keycloak)
- rate_limit_policy_id (optional)
- created_by, created_at

## 7. Standard Security Requirements

### 7.1 Authentication and Authorization

- Integrations MUST authenticate via Keycloak (OIDC).
- Each integration uses a machine client.
- Tokens MUST include:
  - `tenant_id`
  - `integration_id`
  - allowed `verticals`

### 7.2 Optional or Layered Controls

- API Key (secondary identifier only)
- mTLS for high-risk integrations; mandatory mTLS for all integrations is not required by default
- IP allowlists per integration
- Time-bound token lifetimes

### 7.3 Network Security

- TLS 1.2+ mandatory
- No plaintext or unauthenticated endpoints

## 8. Error Handling and Retry Standards

### 8.1 Error Responses

- Structured JSON error format
- Machine-readable error codes
- Clear distinction between:
  - Client errors (4xx)
  - Server errors (5xx)
  - Policy/consent denials (403)

### 8.2 Retry Behavior

- Integrations SHOULD implement exponential backoff.
- SCP MAY provide idempotency keys.
- Batch jobs MUST be resumable.

## 9. Audit and Logging Requirements

SCP MUST log:

- Every integration request
- Authentication and token details
- Tenant and vertical context
- Data categories accessed
- Consent checks performed
- Result (success, failure, denied)

Audit logs MUST be:

- Append-only
- Tamper-evident
- Retained per tenant policy
- Exportable for regulators

## 10. Edge Cases

- Consent withdrawn mid-exchange -> request denied after withdrawal is effective, logged
- External schema change -> integration fails safely
- Rate limit breach -> throttling applied
- Partner system outage -> retries and graceful degradation
- Mis-scoped request -> immediate denial and incident log

## 11. Open Questions

- None.
