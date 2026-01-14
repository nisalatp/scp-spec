# Verticals

## Purpose
Verticals are the primary logic partitions within a Tenant. They represent functional domains like "Health", "Education", or "Social Welfare". They enforce Data Governance, ensuring that a Health Worker cannot see Education records without explicit cross-vertical authorization.

## Responsibilities
- **Partitioning**: Isolating data, forms, and workflows.
- **Ownership**: Defining who (Vertical Owner) makes decisions for that domain.
- **Configuration**: Hosting domain-specific settings (e.g., Risk Indicators for Health).

## In Scope / Out of Scope
**In Scope**:
- Definition of Verticals (Standard and Geo-Verticals).
- Association of Programs to Verticals.
- Vertical-level configurations.

**Out of Scope**:
- The actual implementation of a program (See `Programs`).
- User Management (See `Identity`, though Users serve Verticals).

## Owned Data / Owned Policies
- **Data**: `VerticalDefinition`, `VerticalConfig`.
- **Policies**: Cross-Vertical Sharing Policy.

## Dependent Components
- **Tenancy**: Verticals exist inside a Tenant.
- **Programs**: Programs run *under* a Vertical.
- **Consent**: Consent is granted *to* a Vertical.

## Exposed Interfaces (APIs / Events)
- `GET /verticals` (List available domains).
- `GET /verticals/{id}/config` (Get domain settings).
- Event: `VerticalCreated`, `VerticalSuspended`.

## Related Diagrams (UML/C4)
- `C4/02-container.puml` (Shows Vertical boundaries).

## Related Use Cases
- **MOH Rollout**: Creating a new "MOH Health" vertical to manage national clinics.
- **Inter-Agency Coop**: Granting "Social Welfare" vertical read-access to "Health" disability status.

## References
- `SPEC/05-governance/03-vertical-governance.md`
- `SPEC/01-vision/04-verticals-concept.md`
