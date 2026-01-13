# SCP-SPEC-APP-04: Sample Policies

## Purpose

This document provides sample policy definitions to illustrate SCP authorization behavior.

## In Scope / Out of Scope

**In Scope**
- Example allow and deny policies
- Consent-aware policy samples

**Out of Scope**
- Full policy language specification

## Definitions

- Policy: Rule governing access.
- PDP: Policy Decision Point.

## Rules (MUST/SHOULD/MAY)

- Policies MUST be evaluated using deny-wins logic.
- Consent checks MUST be embedded in policies.
- ROOT bypass policies MUST be explicit.
- Policies SHOULD be versioned.
- Samples MAY simplify expressions.
- A policy simulation tool MUST be supported.
- Human-readable policy explanations MUST be supported.

## Edge Cases

- Conflicting policies across verticals.
- Policy changes during active sessions.

## Audit & Logs

- Policy evaluation results SHOULD be logged.
- Policy changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
- SPEC/04-security/09-consent-and-data-sharing.md
