# SCP-SPEC-CORE-05: Community Center Registry

## Purpose

This document defines community centers, which act as physical or logical hubs for communities.

## In Scope / Out of Scope

**In Scope**
- Community center registration
- Geo linkage
- Governance assignment

**Out of Scope**
- Facility management systems

## Definitions

- Community Center: A local anchor such as a civic, community, or service center.

## Rules (MUST/SHOULD/MAY)

- Community centers MUST be linked to one or more geo nodes.
- Centers MUST operate within tenant governance.
- Centers MAY host multiple programs.
- Center metadata SHOULD be verifiable.
- Virtual centers MUST NOT be supported.
- Centers MUST be time-bound with active from/until dates.

## Community Center Creation Workflow

1. Create a center record with name, type, and tenant ownership.
2. Link the center to one or more geo nodes.
3. Assign governance owner and applicable verticals (if required).
4. Capture verification metadata and supporting attachments.
5. Set Active From and Active Until dates.
6. Activate the center and record audit entries.

## Minimum Required Fields

These are the minimum required fields for community center creation at the platform core level. Tenants MAY add additional metadata.

- center_id (system GUID)
- tenant_id
- center_name
- center_type (tenant-defined, neutral taxonomy)
- owner_id (governance owner)
- geo_node_ids
- status (draft, active, restricted, archived)
- active_from
- active_until (nullable)
- address (or geo-resolved location)
- primary_contact (phone or email, if available)
- verification_status

## Edge Cases

- Centers serving multiple communities.
- Centers changing affiliation.

## Audit & Logs

- Center registration MUST be logged.
- Governance changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/02-entity-catalog.md
- SPEC/05-governance/03-vertical-governance.md
