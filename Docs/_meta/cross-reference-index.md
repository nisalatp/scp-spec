# Cross-Reference Index

This index maps key SPEC sections to their implementation/documentation counterparts.

| SPEC Section | Backend Implementation | Frontend UX | Infrastructure | UML Artifacts |
|---|---|---|---|---|
| **02-Architecture** | `Backend/01-Architecture` | N/A | `Deployment/01-Infrastructure` | `UML/component` |
| **03-Domain** | `Backend/03-Domain-Model` | Global State | `Deployment/04-database` | `UML/class`, `UML/erd` |
| **04-Security** | `Backend/04-Policy-Engine` | `Frontend/01-UX`/Auth | `Deployment/05-keycloak` | `UML/sequence/AuthZ` |
| **06-FormScripting** | `Backend/FormBuilder` | `Frontend/FormBuilder` | `Deployment/FormBuilder` | `UML/FormScripting` |
| **07-Verticals** | `Backend/05-UC-Realization` | `Frontend/02-UC` | `Deployment/02-Geo` | `UML/UseCases` |
| **11-APIs** | `Backend/02-API-Catalogue` | API Clients | API Gateway | `UML/sequence` |
| **13-Import** | `Scripts/SriLanka/import/` | Admin Console | CLI Tools | `UML/FormScripting` |

## Key Capabilities
*   **GIS/Routing**: Maps to `Backend/SharedServices` and `Deployment/01-Infrastructure`.
*   **Simulation**: Maps to `Backend/SimEngine` and `UC-21`.
*   **Audit**: Maps to `Backend/Audit` and `Deployment/07-post-deploy`.
