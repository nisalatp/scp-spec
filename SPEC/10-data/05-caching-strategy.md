# SCP-SPEC-DATA-05: Caching Strategy

## Purpose

This document defines caching strategies used to improve performance while preserving correctness and governance.

## In Scope / Out of Scope

**In Scope**
- Application-level caching
- Policy and metadata caching

**Out of Scope**
- Client-side caching
- CDN caching

## Definitions

- Cache: Temporary storage of computed data.
- Cache Invalidation: Process of expiring cached entries.

## Rules (MUST/SHOULD/MAY)

- Caches MUST be tenant-scoped.
- Authorization and consent MUST be evaluated before caching.
- Policy caches SHOULD have short TTLs.
- Cache invalidation MUST occur on policy changes.
- Distributed caching MUST be supported at MVP.
- Cache consistency MUST be verified using event-driven checks.

## Edge Cases

- Stale authorization decisions.
- Cache stampede under load.

## Audit & Logs

- Cache hits and invalidations SHOULD be logged.
- Cache-related errors MUST be traceable.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
- SPEC/02-architecture/07-performance-and-scale.md
