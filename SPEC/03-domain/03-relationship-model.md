# SCP-SPEC-DOM-03: Relationship Model

## Purpose

This document defines how entities relate to each other, with emphasis on family, household, and governance relationships.

## In Scope / Out of Scope

**In Scope**
- Person to household relationships
- Base family relationships
- Organizational and operational relationships

**Out of Scope**
- Social network style relationships
- Free-form tagging relationships

## Definitions

- Base Relationship: Fundamental relationship such as parent, spouse.
- Derived Relationship: Inferred relationships such as sibling or grandparent.

## Rules (MUST/SHOULD/MAY)

- Only base relationships MUST be stored explicitly.
- Derived relationships SHOULD be inferred algorithmically.
- Relationship inference MUST be deterministic.
- Relationship paths MAY be cached for performance.
- Culturally specific relationships MUST be represented using a standardized international baseline model with sensible defaults, extensible by governance.
- Temporary guardianship relationships MUST be supported and time-bound.

## Edge Cases

- Missing parent data.
- Conflicting relationship assertions.

## Audit & Logs

- Relationship changes MUST be logged.
- Inference logic changes MUST be versioned.

## Open Questions

- None.

## References

- SPEC/06-platform-core/04-household-family.md
- SPEC/10-data/05-caching-strategy.md
