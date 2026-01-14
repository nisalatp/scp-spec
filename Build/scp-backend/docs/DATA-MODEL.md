# Backend Data Model Alignment

This backend uses the [System Domain Model](file:///C:/Users/NisalaBandara/Projects/scp-spec/Diagrams/UML/Core/system-class-diagram.puml) as its primary blueprint.

## Key Entities
- **Identity**: Person, Household, Family.
- **Geography**: GeoNode (Tree structure), Facility.
- **Governance**: Tenant, Policy, Role.
- **Operations**: Vertical, Program, Case, Intervention.

## Database Strategy
- **Primary**: PostgreSQL with PostGIS.
- **Multi-Tenancy**: Shared database, `TenantID` column on all tables (Discriminator-based isolation).
- **Analytics**: Use the read-replicas for `Analytics & Data Mesh` workloads.
