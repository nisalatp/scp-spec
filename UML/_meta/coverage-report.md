# Coverage Report

**Generated**: 2026-01-14
**Source**: `c:/Users/NisalaBandara/Downloads/scp-spec/SPEC/`

## Scanned Documents
- Total MD files found: 99
- Key inputs: `SPEC/00-index.md`, `SPEC/03-domain/*`, `SPEC/10-data/*`, `SPEC/11-apis/*`.

## Coverage by Diagram

| Diagram Type | Diagram Name | Key Spec Coverage |
|---|---|---|
| Use Case | 01_system-use-case | `01-system-context.md` |
| Use Case | 02_core-modules-use-case | `03-domain-overview.md` |
| Activity | 01_person-registration | `08-agent-field-ops-model.md` |
| Activity | 02_case-approval | `06-workflow-approval-model.md` |
| Sequence | 01_api-person-create | `11-apis/05-person-household-api.md` |
| Sequence | 02_consent-check-flow | `04-security/09-consent.md` |
| Class | 01_domain-class-model | `03-domain/02-entity-catalog.md` |
| ERD | 01_database-erd | `10-data/03-physical-data-schema.md` |
| Component | 01_system-components | `02-modular-monolith.md` |
| Deployment | 01_kubernetes-deployment | `12-deployment/01-kubernetes.md` |
| State | 01_person-lifecycle | `03-domain/02-entity-catalog.md` |


## Usage Scenario Coverage (Vertical-Aware)
**Total Scenarios Modeled**: 44 / 44 (100%)

### Standard Scenarios (UC-01 to UC-24)
- Full diagram packs (Use Case, Activity, Sequence, Vertical Map) generated for all.
- Explicit mapping of 5 Standard Verticals.
- Integration of Custom Verticals: `WASH`, `Housing`, `Social Welfare`, `Governance`, `Disaster Mgmt`.

### Advanced Query Scenarios (UC-25 to UC-44)
- Modeled as Cross-Vertical Query Orchestrations.
- Demonstrates "Decision Intelligence" across Health, Education, Economy, Infrastructure, and Environment.

## Missing / TODOs

- **Detailed API Sequences**: Only key flows (Person Create) were diagrammed. Full coverage of all 26 APIs would require ~50+ diagrams.
- **Specific Vertical Flows**: Health/Education specific workflows are generic in the current set.
- **Integration Adapters**: Detailed diagrams for each adapter (payment, SMS) are pending deep dive.

## Conclusion
The generated set covers the **Critical Path** and **Core Architecture** as defined in the hard requirements.
