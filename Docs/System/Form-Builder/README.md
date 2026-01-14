# Form Builder

## Purpose
The Form Builder is the engine responsible for defining, versioning, and distributing the data collection schemas used by Field Agents and Case Workers. It supports both a "No-Code" UI editor and an "Infrastructure-as-Code" scripting model (via `FormScripting`).

## Responsibilities
- **Schema Definition**: Defining fields, validation, and layout.
- **Versioning**: Creating immutable snapshots of forms.
- **Access Control**: Defining which roles can see which fields (PII masking).
- **Logic**: JSONLogic for conditional visibility (`showIf`) and validation.

## In Scope / Out of Scope
**In Scope**:
- Field Types (Text, Date, GPS, Photo, Repeater).
- Form Lifecycle (Draft -> Active -> Archived).
- Translation/Localization of labels.

**Out of Scope**:
- The actual *storage* of submission data (handled by `Identity`, `Verticals`).
- The *rendering* engine (Frontend component).

## Owned Data / Owned Policies
- **Data**: `FormDefinition`, `FormVersion`.
- **Policies**: Form Migration Policy, Deprecation Policy.

## Dependent Components
- **Verticals**: Forms are often bound to a Vertical (e.g., "Health Assessment").
- **Tenancy**: Forms are Tenant-specific.
- **Data-Collection**: Mobile App consumes these definitions.

## Exposed Interfaces (APIs / Events)
- `GET /forms/{key}/latest` (Get Schema).
- `POST /forms/validate` (Dry-run validation).
- Event: `FormPublished`, `FormDeprecated`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Form Builder Module).

## Related Use Cases
- **New Program Launch**: Quickly designing a survey for a new aid program.
- **Longitudinal Study**: Updating a form while keeping old data valid.

## References
- `SPEC/06-platform-core/06-form-builder.md`
