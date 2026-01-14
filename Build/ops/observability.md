# Observability Framework

SCP implementation MUST provide a three-pillar observability suite.

## 1. Logging
- **Standard**: Structured JSON logging.
- **Destination**: ELK Stack or Azure Monitor.
- **Rule**: Every log entry MUST include `TraceID` and `TenantID`.

## 2. Metrics (Prometheus)
- **Core KPIs**: Request Latency, Error Rates, Throughput (RED pattern).
- **Business Metrics**: Case registration rate per Vertical.

## 3. Distributed Tracing (Jaeger/Otel)
- Every request passing through the API Layer MUST be traceable across the Monolith modules and into the Database.
