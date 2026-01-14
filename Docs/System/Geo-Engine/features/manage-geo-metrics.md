# Manage Geo Metrics

## Description
Defining and inputting indicators for regions (e.g., "Drought Risk: High", "Population Density: 500/km2").

## Component
Geo Engine

## Actors / Roles
- **Analyst**
- **Geo Admin**

## Permissions
- `geo.metric.define`
- `geo.metric.update`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Defines Metric "Flood Risk" (Type: Enum Low/Med/High).
2.  **Actor**: Bulk Uploads CSV for 1000 Villages.
3.  **System**: Validates Node IDs.
4.  **System**: Stores `GeoMetricValue`.

## Alternate / Error Flows
- **Type Mismatch**: Uploading "High" for a Number metric -> Error.

## Data Read / Written
- **GeoMetric**: Write.

## Audit & Compliance
- **Policy Drivers**: These metrics often drive eligibility rules.

## Related Use Cases
- UC-44: Risk Index Definition

## References
- `SPEC/06-platform-core/02-geo-engine.md`
