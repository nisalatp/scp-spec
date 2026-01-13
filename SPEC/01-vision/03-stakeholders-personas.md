# SCP-SPEC-VISION-03: Stakeholders and Personas

## Purpose

This document identifies key stakeholders and representative personas interacting with SCP, ensuring the system addresses real-world needs while preserving governance.

## In Scope / Out of Scope

**In Scope**
- Government authorities
- NGOs and community organizations
- Donors and umbrella bodies
- Field agents and community workers

**Out of Scope**
- Individual political actors
- Commercial advertising users

## Definitions

- Stakeholder: An entity with a legitimate interest in SCP outcomes.
- Persona: A representative user profile used for design clarity.

## Rules (MUST/SHOULD/MAY)

- SCP MUST support multiple stakeholders without privilege escalation.
- SCP MUST isolate stakeholder access by role, vertical, and tenant.
- SCP SHOULD provide transparency appropriate to each persona.
- SCP MAY support new personas via configuration.
- Emerging stakeholder types MUST be introduced by umbrella members through governance approval.
- Personas SHOULD be tailored to country context where required.

## Edge Cases

- One individual acting under multiple personas
- Conflicting stakeholder objectives within the same community

## Audit & Logs

- Stakeholder roles and permissions MUST be auditable.
- Persona definitions SHOULD be reviewed periodically.

## Open Questions

- None.

## References

- SPEC/04-security/07-scopes-groups-roles.md
- SPEC/08-operations/01-agent-field-operations.md
