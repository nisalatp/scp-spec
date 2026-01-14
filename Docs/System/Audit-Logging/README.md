# Audit Logging

## Purpose
The Audit Logging component provides an immutable, tamper-evident record of *all* security-critical and governance-relevant actions within the platform. It is the "Flight Recorder" of SCP.

## Responsibilities
- **Ingestion**: Accepting audit events from all other components.
- **Enrichment**: Adding Tenant/Vertical context if missing.
- **Storage**: Writing to Write-Once-Read-Many (WORM) storage.
- **Compliance**: Ensuring logs are retained for the legal duration.

## In Scope / Out of Scope
**In Scope**:
- Security Events (Login, Failed Auth).
- Governance Events (Policy Change, Case Closure).
- Vertical/Tenant Lifecycle.

**Out of Scope**:
- Application Debug Logs ("NullPointerException at line 50").
- Performance Metrics (CPU usage).

## Owned Data / Owned Policies
- **Data**: `AuditLogEntry`.
- **Policies**: Audit Retention Policy.

## Dependent Components
- **Security-Access-Control**: Every Auth Decision is logged.
- **Identity**: Personal data access is logged.
- **Integrations**: External data exchanges are logged.

## Exposed Interfaces (APIs / Events)
- `POST /audit/events` (Internal ingestion).
- `GET /audit/query` (Compliance export).
- Event: `AuditLogArchived`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Audit Service).

## Related Use Cases
- **Forensic Investigation**: Tracing "Who authorized this payment?".
- **Compliance Audit**: Proving "No access to Health data by Education staff" occurred.

## References
- `SPEC/04-security/12-audit-logging.md`
