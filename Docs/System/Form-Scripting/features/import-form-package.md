# Import Form Package (IaC)

## Description
The primary function of Form Scripting: Applying a YAML definition file (`.forms.yaml`) to a Tenant's Form Registry. This acts as a "Deployment" step.

## Component
Form Scripting

## Actors / Roles
- **Platform Admin** (via CLI)
- **CI/CD System** (Automated)

## Permissions
- `admin.forms.import`

## Scope Rules
- **Tenant Scope**: The script MUST declare its target `countryTenant`. The importer validates this matches the target DB.

## Preconditions
- Tenant must exist or import fails.

## Main Flow
1.  **Actor**: Runs `scp forms:import --file forms.yaml --tenant LK`.
2.  **System**:
    - Validates Schema.
    - Resolves Tenant "LK".
    - Checks Permissions.
3.  **System Loop** (for each form in file):
    - Calculates Hash (Checksum) of content.
    - Compares with `LatestActive` version in DB.
    - **If Match**: Skips (No-Op).
    - **If Differs**: Creates New Version (Increment Minor).
    - **If New**: Creates New Definition.
4.  **System**: Returns Report ("2 Createds, 1 Updated, 5 Unchanged").

## Alternate / Error Flows
- **Validation Failure**: Script contains invalid field type -> Aborts Entire Transaction.
- **Tenant Mismatch**: Script says `countryTenant: KE` but importing to `LK` -> Error.

## Data Read / Written
- **FormDefinition**: Write.
- **ImportRecord**: Write.

## Audit & Compliance
- **Traceability**: "Who changed this form?" -> "CI Pipeline Job #123 imported it".

## Related Use Cases
- UC-40: New Program Launch (Automated)

## References
- `SPEC/06-platform-core/13-form-scripting.md`
