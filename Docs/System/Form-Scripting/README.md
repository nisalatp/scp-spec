# Form Scripting

## Purpose
Form Scripting is the "Infrastructure-as-Code" counterpart to the Form Builder. It allows developers to define entire Form Packages (forms, logic, validations, translations) as YAML/JSON files and import them into a Tenant via CLI or CI/CD pipelines.

## Responsibilities
- **Import Pipeline**: Parsing, Validating, and Applying `forms.yaml` files.
- **Idempotency**: Ensuring re-running a script does not create duplicates.
- **Diffing**: Detecting changes between Script and Database.

## In Scope / Out of Scope
**In Scope**:
- YAML Schema Validation.
- Import History / Audit.
- CLI Tooling (`scp forms import`).

**Out of Scope**:
- UI Editor (Form Builder).
- Runtime Execution (Mobile App).

## Owned Data / Owned Policies
- **Data**: `ImportRecord`, `ScriptPackage`.
- **Policies**: Versioning Policy (Major/Minor).

## Dependent Components
- **Form Builder**: The Scripting engine writes the final schema *into* the Form Builder tables.
- **Tenancy**: Scripts are applied to a specific Tenant.

## Exposed Interfaces (APIs / Events)
- `POST /admin/forms/import` (Upload Package).
- CLI: `scp-cli forms:import`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Forms Module).

## Related Use Cases
- **National Rollout**: Deploying standard forms to 50 tenants.
- **Disaster Response**: Rapidly deploying a pre-tested "Flood Survey" package.

## References
- `SPEC/06-platform-core/13-form-scripting.md`
