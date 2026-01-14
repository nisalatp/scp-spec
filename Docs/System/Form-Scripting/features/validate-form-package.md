# Validate Form Package

## Description
Dry-run validation of a script file to ensure it meets the schema requirements without applying changes.

## Component
Form Scripting

## Actors / Roles
- **Platform Admin**
- **Developer**

## Permissions
- None (Local Operation) or `form.validate` (Remote).

## Scope Rules
- N/A.

## Main Flow
1.  **Actor**: Runs `scp forms:validate --file forms.yaml`.
2.  **System**:
    - Checks YAML Syntax.
    - Checks Required Fields (`formKey`, `sections`).
    - Checks JSONLogic syntax.
3.  **System**: Returns Success/Failure.

## Data Read / Written
- None.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/06-platform-core/13-form-scripting.md`
