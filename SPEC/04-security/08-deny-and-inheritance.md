# SCP-SPEC-SEC-08: Deny and Inheritance Rules

## Purpose

This document defines deny semantics and inheritance behavior in SCP authorization.

## In Scope / Out of Scope

**In Scope**
- Deny precedence
- Inheritance behavior

**Out of Scope**
- UI representation of rules

## Definitions

- Deny Rule: Explicit prohibition of an action.
- Inheritance: Propagation of rules from parent scopes.

## Rules (MUST/SHOULD/MAY)

- Deny MUST always override allow.
- Deny at any ancestor scope MUST apply.
- Deny MUST NOT be overridden.
- Inheritance MUST flow downward only.
- Deny rules MUST support optional expirations.

## Edge Cases

- Conflicting denies across verticals
- Sideways geo inheritance with umbrella approval

## Audit & Logs

- Deny rule creation MUST be logged.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
