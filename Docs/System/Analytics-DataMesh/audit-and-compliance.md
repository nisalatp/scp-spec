# Audit & Compliance: Analytics & Data Mesh

## Logged Events
- `product.query`: Who queried what?
- `product.grant`: Who gave access to whom?

## Compliance Controls
- **Differential Privacy**: For sensitive products, the engine injects noise to prevent re-identification.
- **Purpose Limitation**: Access is granted for a specific *Purpose* (e.g., "Annual Report"). Using it for "Marketing" is a policy violation.

## Retention
- Query logs are immutable and kept for Audit duration (7 years).
