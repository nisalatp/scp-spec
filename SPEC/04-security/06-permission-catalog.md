# SCP-SPEC-SEC-06: Permission Catalog

## Purpose

This document defines how permissions are structured and managed in SCP.

## In Scope / Out of Scope

**In Scope**
- Action naming conventions
- Permission extensibility

**Out of Scope**
- UI permission assignment

## Definitions

- Permission: An atomic action identifier.
- Action: Operation on a resource.

## Rules (MUST/SHOULD/MAY)

- Permissions MUST be action-based (verb.noun).
- Permissions MUST be versioned.
- New permissions SHOULD be additive.
- Deprecated permissions MAY remain read-only.
- Permission aliases MUST NOT be allowed.
- Policy management MUST use dedicated permissions and MUST NOT reuse general admin roles.

## Permission Naming Standard

- Permissions MUST follow lowercase dot notation: `resource.action`.
- Sub-resources MAY be expressed as `resource.subresource.action`.
- Actions MUST be verbs such as: create, read, update, delete, verify, approve, suspend, archive, assign, export.
- Permission codes MUST be globally unique within a tenant.

## Required Scope Matrix (Defaults)

Each permission definition MUST declare its required scope type. The table below defines defaults by prefix; exceptions require umbrella approval.

| Permission Prefix | Required Scope Type | Notes |
| --- | --- | --- |
| tenant.* | tenant-wide | ROOT or umbrella only |
| config.* | tenant-wide | tenant configuration and feature flags |
| policy.* | tenant-wide | policy packs and policy change control |
| role.* | tenant-wide | roles, groups, permissions, deny rules |
| geo.* | geo-scoped | includes creation and modification within geo scope |
| community_center.* | geo-scoped | center creation, updates, and verification |
| vertical.* | tenant-wide | system and custom vertical lifecycle |
| program.* | program-scoped | must include parent vertical |
| case.* | vertical-scoped | program-scoped if tied to a program |
| person.* | vertical-scoped | consent and masking apply; geo scope MAY apply |
| household.* | vertical-scoped | consent and masking apply; geo scope MAY apply |
| relationship.* | vertical-scoped | consent and masking apply |
| consent.* | vertical-scoped | consent boundary enforcement required |
| attachment.* | vertical-scoped | access scoped to target record |
| form.* | tenant-wide | form definitions; submissions follow target scope |
| visit.* | geo-scoped | constrained by agent geo scope |
| report.* | vertical-scoped | row-level requires explicit permission |
| integration.* | tenant-wide | data exchange also constrained to declared verticals |
| pipeline.* | tenant-wide | import/export pipelines |
| donor.* | vertical-scoped | program scope enforced when program_id present |
| marketplace.* | tenant-wide | access requests and grants |

## Edge Cases

- Overlapping permissions
- Deprecated permissions in active roles

## Audit & Logs

- Permission changes MUST be logged.

## Open Questions

- None.

## References

- SPEC/04-security/07-scopes-groups-roles.md
