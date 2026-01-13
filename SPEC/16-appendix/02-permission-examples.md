# SCP-SPEC-APP-02: Permission Examples

## Purpose

This document provides illustrative examples of SCP permission assignments and evaluations.

## In Scope / Out of Scope

**In Scope**
- Permission examples
- Deny and allow scenarios

**Out of Scope**
- Complete permission catalog definition

## Definitions

- Permission: Action allowed or denied.
- Scope: Context in which permission applies.

## Rules (MUST/SHOULD/MAY)

- Permissions MUST be evaluated using deny-wins logic.
- Permissions MUST be scoped by tenant.
- Geo and vertical scopes SHOULD be explicit.
- Examples MAY include simplified representations.
- Visual permission matrices MUST NOT be required.
- Examples SHOULD include time-bound permissions.

## Edge Cases

- Overlapping allow and deny rules.
- Permissions inherited from multiple geo nodes.

## Audit & Logs

- Permission evaluations SHOULD be logged in debug mode.
- Administrative permission changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/04-security/08-deny-and-inheritance.md
- SPEC/04-security/06-permission-catalog.md
