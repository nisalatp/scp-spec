# Edge Cases & Failures: Analytics & Data Mesh

## Edge Cases
1.  **Schema Drift**: Domain changes operational schema, breaking the Data Product.
    - *Mitigation*: Data Contracts enforce schema stability; Breaking changes require major version bump.
2.  **Sparse Data**: Filtering by Consent leaves too few records for statistical significance.
    - *Policy*: Return "Insufficient Data" rather than potentially re-identifiable small sets.

## Failure Handling
- **Source Unavailable**: If the Health DB is down, the `health.stats` product might return stale data (Last Known Good) with a warning header.
