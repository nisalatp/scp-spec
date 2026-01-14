# Boundaries: Analytics & Data Mesh

## Ownership
- **Domains (Verticals)**: Own the *Business Logic* and *Quality* of their Data Products.
- **Platform**: Owns the *Infrastructure* (Storage, Compute, Catalog) and *Global Policy Enforcement*.

## Data Flow Boundaries
- **Ingestion**: Raw data enters the Mesh not via ETL, but via Domain-published events or governed snapshots.
- **Consumption**: Consumers (e.g., Ministry Dashboard) access Data Products via standard APIs (SQL/JSON), never by direct DB access to the operational store.

## Integration Boundaries
- **Inbound**:
    - **Vertical Services**: Publish "Domain Events" to be aggregated.
- **Outbound**:
    - **BI Tools**: Connect via JDBC/ODBC or REST to the Analytics Mesh.
