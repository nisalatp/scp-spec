# Metadata Versioning

## Purpose
Metadata Versioning is not a standalone "service" but a **Core Design Pattern** enforced across the platform. It ensures that critical definitions (Forms, Rules, Configuration) are **Immutable** and **Versioned**. This guarantees that a Case record created in 2023 keeps its original context even if the Form changes in 2025.

## Responsibilities
- **Immutability**: Once a version is "Published", it *cannot* be changed.
- **Traceability**: "Which version of the 'Income Assessment Form' was used for this record?"
- **Continuity**: Allowing multiple versions to coexist (e.g., v1 for old cases, v2 for new cases).

## In Scope / Out of Scope
**In Scope**:
- Version numbering strategy (SemVer or Integer).
- Lifecycle (Draft -> Published -> Archived).

**Out of Scope**:
- Data Migration (Converting v1 data to v2 data is a separate ETL process).

## Key Concepts
- **Definition**: The template (e.g., "Registration Form").
- **Version**: A snapshot (e.g., "Registration Form v1.0").
- **Instance**: A record using a version.

## Component Relationship
- **Form Builder**: Uses this heavily.
- **Rules Engine**: Uses this to version eligibility logic.
