# SCP-SPEC-APP-03: Sample Scope Examples

## Purpose

This document provides examples of scope combinations used in SCP authorization decisions.

## In Scope / Out of Scope

**In Scope**
- Tenant, geo, vertical, and program scopes
- Example scope strings or objects

**Out of Scope**
- Implementation-specific scope syntax

## Definitions

- Scope: Contextual boundary for authorization.
- Intersection: Combined scope evaluation.

## Rules (MUST/SHOULD/MAY)

- Scopes MUST include tenant context.
- Geo scopes MAY be hierarchical.
- Vertical scopes MUST align with consent.
- Program scopes SHOULD be subordinate to verticals.
- Wildcard scopes MUST be supported.
- Peer-geo scopes MUST be represented using sensible defaults for sibling geo paths.

## Edge Cases

- User with multiple geo scopes.
- Program spanning multiple geos.

## Audit & Logs

- Scope resolution SHOULD be traceable.
- Failed scope evaluations MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/07-scopes-groups-roles.md
- SPEC/07-verticals/07-cross-vertical-interventions.md
