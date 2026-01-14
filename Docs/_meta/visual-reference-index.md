# Visual Reference Index

Mapping of documentation concepts to authoritative diagrams.

## C4 Architecture
| Concept | Description | Diagram Path |
|---|---|---|
| **System Context** | Top-level system view, actors, external systems | `\Diagrams\C4\01-context.puml` |
| **Containers** | Deployable units, technologies, boundaries | `\Diagrams\C4\02-container.puml` |
| **Components** | Internal breakdown of the Monolith | `\Diagrams\C4\03-component.puml` |

## UML Models
| Concept | Description | Diagram Path |
|---|---|---|
| **Domain Model** | Core entities (Person, Household, etc.) | `\Diagrams\UML\Core\system-class-diagram.puml` |
| **Data Schema** | ERD and Relationships | `\Diagrams\UML\DataModels\system-erd.puml` |
| **State Machines** | Core Lifecycle States | `\Diagrams\UML\StateModels\system-state-machines.puml` |
| **Core Flows** | High-level system sequences | `\Diagrams\UML\Sequences\core-flows.puml` |

## Feature Specific
| Feature | Diagram Path |
|---|---|
| **Forms Engine** | `\Diagrams\UML\Forms\*` |
| **Scripting Engine** | `\Diagrams\UML\Forms\*` |
| **AuthZ** | `\Diagrams\UML\Sequences\authz-evaluation.puml` |
| **Registration** | `\Diagrams\UML\Sequences\person-registration.puml` |
