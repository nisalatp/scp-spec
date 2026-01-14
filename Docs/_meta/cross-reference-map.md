# System Cross-Reference Map

## 1. Capabilities to Artifacts

| Capability | SPEC Source | UML Component | Deployment Doc | Frontend Doc | Backend Doc |
|---|---|---|---|---|---|
| **GIS / Spatial** | `SPEC/10-data/11-gis-and-spatial.md` | `GIS Service` | `Deployment/01-Infrastructure.md` (Needs Update) | `Frontend/01-UX-Flows.md` | `Backend/01-Architecture.md` |
| **Data Warehouse** | `SPEC/10-data/10-analytics-and-olap.md` | `Data Warehouse` | `Deployment/01-Infrastructure.md` | N/A (Internal) | `Backend/01-Architecture.md` |
| **Simulation** | `SPEC/02-architecture.md` | `Sim Engine` (Rename -> Service) | `Deployment/01-Infrastructure.md` (Missing) | `Frontend/01-UX-Flows.md` | `Backend/01-Architecture.md` |
| **Routing** | `SPEC/02-architecture.md` | `Routing Engine` (Rename -> Service) | `Deployment/01-Infrastructure.md` (Missing) | `Frontend/01-UX-Flows.md` | `Backend/01-Architecture.md` |
| **Form Builder** | `SPEC/06-platform-core/06-form-builder.md` | `Forms Engine` | `Deployment/FormBuilder/` | `Frontend/FormBuilder/` | `Backend/FormBuilder/` |
| **Geo-Verticals** | `SPEC/07-verticals/06-geo-vertical-runtime.md` | `V_Custom` | `Deployment/02-Geo-Deployment.md` | `Frontend/01-UX-Flows.md` | `Backend/01-Architecture.md` |

## 2. Naming Consistency Check

| Concept | Preferred Name | Variants Found (To Fix) |
|---|---|---|
| **Sim Service** | **Simulation Service** | Sim Engine, Sim_Svc |
| **Route Service** | **Routing Service** | Routing Engine, Traffic/Routing |
| **Form Runtime** | **Forms Service** | Forms Engine, Form Renderer |

## 3. Use Case Tracing (Sample)

| UC ID | Name | Main Diagram | Sequence Diagram | Lapse Resolution |
|---|---|---|---|---|
| UC-09 | Sanitation Planning | `UML/UseCases/UC-09` | Check Existence | GIS + Geo-Ext |
| UC-21 | Policy Design | `UML/UseCases/UC-21` | Check Existence | Sim-Service |
| UC-40 | Health Access | `UML/UseCases/UC-40` | Check Existence | Routing-Service |
