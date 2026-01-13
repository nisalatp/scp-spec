# SCP-SPEC-ARCH-01: System Context

## Purpose

This document describes the system context of the Smart Community Platform (SCP), defining its boundaries, external actors, and high-level interactions with surrounding systems.

## In Scope / Out of Scope

**In Scope**
- SCP as a platform serving communities across countries
- External actors such as governments, NGOs, donors, and service providers
- High-level interactions via APIs and integrations

**Out of Scope**
- Internal module implementation details
- UI or client application design
- Vendor-specific infrastructure details

## Definitions

- System Context: The environment in which SCP operates, including actors and external systems.
- External Actor: Any system or organization interacting with SCP.

## Rules (MUST/SHOULD/MAY)

- SCP MUST act as a neutral platform between actors.
- SCP MUST expose well-defined API boundaries.
- External systems SHOULD not bypass SCP governance layers.
- SCP MAY integrate with multiple external systems per tenant.
- Some actor types MAY be restricted to read-only context access when required by governance.

## Edge Cases

- Multiple external systems requesting overlapping data.
- Conflicting requirements between actors in the same tenant.

## Audit & Logs

- All external interactions MUST be logged.
- Actor identities and scopes SHOULD be traceable.

## Open Questions

- None.

## References

- SPEC/01-vision/01-problem-statement.md
- SPEC/09-integrations/01-integration-overview.md
