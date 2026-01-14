# Roles & Permissions: Analytics & Data Mesh

## Participating Roles
- **Data Product Owner**: Responsible for defining and maintaining a Data Product (e.g., Health Domain Lead).
- **Data Consumer**: An analyst or system authorized to query a Data Product.
- **Governance Officer**: Defines global policies (e.g., "All output must be k-anonymized").

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Notes |
|---|---|---|---|---|
| `publish` | `data_product` | Domain Owner | Domain Admin | Creating a new dataset |
| `subscribe` | `data_product` | Cross-Domain | Tenant Admin, Umbrella Program Manager | Requires Approval |
| `query` | `data_product` | Subscription | Data Analyst | Enforces Row-Level Security |

## Consent Enforcement
- **Aggregate Products**: Generally anonymized; Consent withdrawal may trigger re-computation of aggregates.
- **Granular Products**: Strictly filtered by valid Consent. If Consent is withdrawn, the row disappears from the Data Product view immediately.
