# Workflows: Form Builder

## Workflow: New Version
1.  **Actor**: Vertical Owner.
2.  **Action**: Clones `v1` to Draft `v2`.
3.  **Edit**: Adds "Vaccination Date" field.
4.  **Save**: Validates JSONLogic.
5.  **Publish**: Status `v2=Active`.
6.  **Impact**: Mobile Apps download `v2` on next sync. Old apps use `v1`.

## Workflow: Deprecation (Negative Flow)
1.  **Actor**: Admin.
2.  **Action**: Deprecate `v1`.
3.  **Check**: Are there active cases linked to `v1`?
4.  **Result**: Warning. "200 Active Cases use this form. Migration recommended."
