# SCP-SPEC-SEC-04: Authorization Overview

## Purpose

This document provides a high-level overview of SCP authorization concepts and boundaries.

## In Scope / Out of Scope

**In Scope**
- Authorization dimensions
- High-level enforcement model

**Out of Scope**
- Detailed evaluation algorithms

## Definitions

- Authorization: Decision to allow or deny an action.
- Scope: Context defined by tenant, geo, vertical, and program.

## Rules (MUST/SHOULD/MAY)

- Authorization MUST be centralized.
- Authorization MUST consider tenant, vertical, geo, consent, and classification.
- No implicit permissions SHOULD exist.
- Authorization MAY involve ABAC conditions.
- Authorization explanations MUST be user-visible for allow and deny decisions, limited to high-level reasons and subject to masking and policy.

## Authorization Workflow

1. Resolve tenant, geo, vertical, and program scope from the request and token.
2. Evaluate consent status for the relevant verticals.
3. Apply deny rules, then allow rules, then ABAC conditions.
4. Apply field masking based on classification and role.
5. Return allow/deny with high-level reasons and log the decision.

## Edge Cases

- Multi-vertical actions
- Partial data access

## Audit & Logs

- Authorization decisions MUST be logged.
- Denied decisions MUST include reasons.

## Open Questions

- None.

## References

- SPEC/04-security/05-authz-engine-evaluation.md
- SPEC/04-security/08-deny-and-inheritance.md
