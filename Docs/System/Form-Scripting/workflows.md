# Workflows: Form Scripting

## Workflow: CI/CD Deployment
1.  **Actor**: GitHub Actions.
2.  **Action**: `scp-cli import -f ./forms.yaml -t LKA --token $API_KEY`.
3.  **System**:
    - Validates YAML.
    - Checks Tenant.
    - Diffs Forms.
    - Creates new FormVersions.
4.  **Result**: "3 Forms Updated, 5 Unchanged".

## Workflow: Conflict (Negative Flow)
1.  **Script**: Defines `fieldKey: age` as `Text`.
2.  **Existing**: DB has `fieldKey: age` as `Number`.
3.  **Result**: 400 Bad Request "Type Mismatch - Breaking Change". (Requires `deprecated: true` on old field and new field key).
