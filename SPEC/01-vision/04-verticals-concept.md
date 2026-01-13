# SCP-SPEC-VISION-04: Verticals Concept

## Purpose

This document defines the concept of verticals as governance and interest boundaries within SCP, separating intent, data, and action without fragmentation.

## In Scope / Out of Scope

**In Scope**
- Definition of verticals as first-class governance constructs
- System-wide and tenant-defined verticals
- Cross-vertical collaboration rules

**Out of Scope**
- Hardcoded program logic within verticals
- Vertical-specific UI design

## Definitions

- Vertical: An interest-based governance boundary.
- System Vertical: A mandatory, immutable vertical.
- Custom Vertical: A tenant-defined extension.

## Rules (MUST/SHOULD/MAY)

- Verticals MUST be enforced across data, access, and actions.
- System verticals MUST always be enabled.
- Custom verticals SHOULD inherit governance rules.
- Verticals MAY collaborate via approved shared interventions.
- There MUST be no fixed platform limit on the number of custom verticals.
- Deprecated verticals MUST be archived and retained as read-only history.

## Edge Cases

- Programs spanning multiple verticals
- Vertical conflicts requiring umbrella override

## Audit & Logs

- Vertical definitions and changes MUST be logged.
- Cross-vertical access MUST be traceable.

## Open Questions

- None.

## References

- SPEC/07-verticals/01-system-verticals.md
- SPEC/05-governance/03-vertical-governance.md
