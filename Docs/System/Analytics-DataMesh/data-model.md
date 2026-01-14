# Data Model: Analytics & Data Mesh

## Metamodel

### DataProduct
- `product_id` (e.g., `health.maternal_indicators`)
- `domain` (e.g., `Health`)
- `schema` (JSON Schema / Avro)
- `refresh_policy` (Daily, Real-time)
- `classification` (Public, Internal, Confidential)

### DataContract
- `consumer_id`
- `product_id`
- `sla` (Service Level Agreement)
- `purpose` (Why is this data needed?)

## Storage Strategy
- **Polyglot Storage**:
    - **Hot**: Columnar Store (e.g., ClickHouse/Parquet) for fast querying.
    - **Cold**: Object Storage (S3) for historical archives.

## Diagrams
- `C4/03-component.puml` (Analytics Node)
