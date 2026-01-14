# Form Scripting Guide

The **Form Scripting Model** allows developers to define Data Collection Interfaces as code (`.forms.yaml`) and import them into specific Country Tenants.

## Capabilities
1.  **Infrastructure-as-Code**: Version-control your form definitions.
2.  **Idempotent Import**: Safely re-run imports; only changes are applied.
3.  **Scope Control**: Bind forms to Country, Vertical, or Geo-Fence.

## File Format
See `SPEC/06-platform-core/13-form-scripting.md` for the full schema.

## Quick Start
1.  Create a file `my-country.forms.yaml`.
2.  Define your package metadata.
3.  List your forms.
4.  Run import:
    ```bash
    scp forms:import --file my-country.forms.yaml --tenant LK
    ```

## CLI Reference
`scp forms:import [flags]`

| Flag | Description | Required |
|---|---|---|
| `--file` / `-f` | Path to `.forms.yaml` | Yes |
| `--tenant` / `-t` | Target Country Code (ISO-3166) | Yes |
| `--dry-run` | Validate without saving | No |

## Best Practices
*   **Keys**: Use stable, semantic `formKey` and `fieldKey` values (e.g., `dob`, not `field_1`).
*   **Deprecation**: Don't delete fields; mark them `deprecated: true`.
*   **Secrets**: Do not put sensitive secrets in the script; use references.
*   **Localization**: Use keys for labels (e.g., `lbl_dob`) and provide a translation bundle (Future Feature).
