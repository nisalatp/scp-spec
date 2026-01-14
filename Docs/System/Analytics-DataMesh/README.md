# Analytics & Data Mesh

## Purpose
The Analytics & Data Mesh component provides both decentralized, domain-driven analytics and centralized operational reporting. It enables Verticals to publish "Data Products" for complex insights while providing the engine for "Safe Exports" and real-time operational visibility.

## Responsibilities
- **Data Product Hosting**: Serving domain-specific datasets (e.g., "Maternal Health Trends").
- **Federated Governance**: Enforcing global policies (Consent, PII) across all data products.
- **Operational Reporting**: Turning records into lists, aggregates, and scheduled summaries.
- **Safe Exports**: Generating masked CSV/Excel downloads asynchronously.
- **KPI Reconciliation**: Global alignment of metrics across verticals.

## In Scope / Out of Scope
**In Scope**:
- Cross-Vertical Analytics and long-term trend mapping.
- Operational reports (e.g., "Active Cases by District").
- Export aggregation and data masking.
- KPI computation and audit trail for data access.

**Out of Scope**:
- Real-time transactional data entry (handled by individual components).
- External dashboard UI (Analytics serves the API/Data).

## Owned Data / Owned Policies
- **Data**: `ReportDefinition`, `DataProduct`, `ExportJob`, `KPI_Registry`.
- **Policies**: Data Classification Policy, Mesh Governance Framework.

## Exposed Interfaces (APIs / Events)
- `POST /reports/{id}/execute` (Async Run)
- `GET /exports/{job_id}/download` (Secure Fetch)
- `GET /data-catalog` (Mesh Discovery)
- Event: `ReportGenerated`, `DataProductPublished`

## References
- `SPEC/08-operations/07-reporting-exports.md`
- `SPEC/03-domain/10-analytics-reporting-model.md`
- `SPEC/05-governance/07-kpi-reconciliation.md`
