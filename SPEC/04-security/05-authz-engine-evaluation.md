# SCP-SPEC-SEC-05: Authorization Engine Evaluation

## Purpose

This document defines the exact evaluation order and logic used by the SCP Policy Decision Point.

## In Scope / Out of Scope

**In Scope**
- Evaluation order
- Decision rules

**Out of Scope**
- Performance optimizations

## Definitions

- PDP: Policy Decision Point
- Decision: Allow or Deny result

## Rules (MUST/SHOULD/MAY)

Evaluation MUST occur in this order:
1. ROOT check
2. Tenant match
3. Consent check
4. Scope resolution
5. Deny rules
6. Allow rules
7. ABAC evaluation
8. Field masking
9. Final decision

- Any deny MUST override allow.
- Cross-vertical actions MUST use strictest intersection.
- If ROOT check passes, tenant match is not required and access may span tenants.
- ROOT requests MAY be executed without a tenant context.
- The PDP MUST expose partial-allow details (allowing fields/actions and denied fields/actions) to calling services.

## Edge Cases

- Conflicting allow rules
- Stale policy cache

## Audit & Logs

- Evaluation steps MUST be traceable.
- Cache hits SHOULD be logged.

## Open Questions

- None.

## References

- SPEC/04-security/12-audit-logging.md
- SPEC/10-data/05-caching-strategy.md
