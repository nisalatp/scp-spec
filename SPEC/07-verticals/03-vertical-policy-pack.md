# SCP-SPEC-VERT-03: Vertical Policy Pack

## Purpose

This document defines the policy pack associated with each vertical, governing data access, consent, and operational constraints.

## In Scope / Out of Scope

**In Scope**
- Vertical-specific policies
- Policy inheritance and overrides

**Out of Scope**
- Enforcement engine internals

## Definitions

- Policy Pack: A set of rules applied to a vertical.
- Policy Override: An explicit umbrella-approved exception.

## Rules (MUST/SHOULD/MAY)

- Each vertical MUST have a policy pack.
- Policy packs MUST include consent requirements.
- Deny rules MUST override allow rules.
- System vertical policies MUST take precedence over custom vertical policies.
- Policy packs SHOULD be versioned.
- Overrides MAY be applied only by umbrella authority.
- Policy simulations are not required before approval.

## Edge Cases

- Conflicting policies across verticals.
- Policy updates affecting active cases.

## Audit & Logs

- Policy pack changes MUST be logged.
- Override usage MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/08-deny-and-inheritance.md
- SPEC/05-governance/04-policy-change-control.md
