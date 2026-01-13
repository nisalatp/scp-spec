# SCP-SPEC-APP-01: Glossary

## Purpose

This document defines standard terminology used across the Smart Community Platform (SCP) specifications to ensure consistent understanding.

## In Scope / Out of Scope

**In Scope**
- Core platform terms
- Security and governance terminology

**Out of Scope**
- Vendor-specific or tool-specific jargon

## Definitions

- SCP: Smart Community Platform.
- Tenant: Country-level isolation boundary.
- Vertical: Interest-based governance domain.
- Geo: Geographic hierarchy node.
- Program: Governed initiative under a vertical.
- Case: Individual intervention instance.
- Consent: Explicit permission granted per vertical.
- ROOT: Global super admin with bypass authority.
- Deny: Authorization rule that overrides all allows.
- Audit Log: Immutable record of system actions.

## Rules (MUST/SHOULD/MAY)

- Terms MUST be used consistently across specs.
- New terms SHOULD be added to this glossary.
- Deprecated terms MAY be retained with notes.
- A multilingual glossary MUST be supported.
- External standard term references MUST be supported; the specific standards list MUST be defined per country policy.

## Edge Cases

- Conflicting terminology between legacy systems.
- Ambiguous usage in external integrations.

## Audit & Logs

- Glossary updates SHOULD be versioned.
- Changes SHOULD be traceable.

## Open Questions

- None.

## References

- SPEC/04-security/01-security-principles.md
- SPEC/05-governance/01-governance-overview.md
