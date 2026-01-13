# SCP-SPEC-CORE-12: Infrastructure Project Registry

## Purpose

This document defines the registry for infrastructure projects (water, sanitation, housing, roads, energy) to support planning and reporting.

## In Scope / Out of Scope

**In Scope**
- Project registration and lifecycle
- Geo scoping and coverage
- Vertical tagging for access control

**Out of Scope**
- Procurement and contractor management
- Detailed project execution tracking

## Definitions

- Infrastructure Project: A registered project with defined scope and status.
- Project Coverage: Geo nodes impacted by a project.

## Rules (MUST/SHOULD/MAY)

- Projects MUST be tenant-scoped.
- Projects MUST be linked to one or more geo nodes.
- Projects MUST declare a project_type and status.
- Project lifecycle MUST follow:
  Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
- Projects MAY be tagged to verticals for reporting and access control.
- Overlapping projects MUST be detectable via geo scope comparison.

## Project Lifecycle Workflow

1. Project created in Draft by a tenant admin or vertical owner.
2. Submitted for review (Requested) and reviewed (Reviewed).
3. Umbrella approves (Approved) and activates (Active).
4. Projects MAY be restricted, suspended, deprecated, or archived by governance.

## Minimum Required Fields

**Infrastructure Project**
- project_id (system GUID)
- tenant_id
- project_name
- project_type (water, sanitation, housing, energy, transport, other)
- status
- active_from
- active_until (nullable)
- primary_vertical_id (optional)
- sponsor_org (optional)

**Project Geo Scope**
- project_id
- geo_id

## Edge Cases

- Projects spanning multiple tenants (not allowed).
- Projects without active funding.

## Audit & Logs

- Project creation, updates, and status changes MUST be logged.
- Geo scope changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/02-geo-engine.md
- SPEC/11-apis/24-infrastructure-api.md
