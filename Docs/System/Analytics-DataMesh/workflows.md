# Workflows: Analytics & Data Mesh

## Workflow: Publishing a Data Product
1.  **Domain Owner**: Defines a transformation (e.g., "Select * from Cases where Status=Active").
2.  **System**: Validates schema and PII tags.
3.  **Governance**: Checks if this duplicates an existing product.
4.  **Publication**: System registers `health.active_cases` in the Catalog.

## Workflow: Cross-Domain Analysis
1.  **Analyst**: Wants to correlate "School Attendance" (Education) with "Nutrition Levels" (Health).
2.  **Request**: Submits Access Request for both Data Products.
3.  **Approval**: Data Owners approve based on "Purpose".
4.  **Query**: Analyst writes `JOIN` query.
5.  **Execution**: Mesh Engine enforces Row-Level Security and Consent for *intersection* of subjects.
