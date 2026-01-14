# Workflows: Metadata Versioning

## Workflow: Updating a Form
1.  **Analyst**: Decides to add "Email Address" field to Registration.
2.  **App**: Fetches `v1` (Current).
3.  **App**: Creates `v2` (Draft). Clones `v1` content.
4.  **Analyst**: Edits `v2` in Form Builder. Adds Field.
5.  **Analyst**: Tests `v2`.
6.  **Manager**: Approves and Clicks "Publish".
7.  **System**:
    - Sets `v2` status -> `Published`.
    - Updates `Latest` pointer.
    - Emits `DefinitionPublished`.
8.  **Field Apps**: Sync and download `v2`.

## Workflow: Old Record View
1.  **User**: Opens a Case from 2022.
2.  **System**: Sees `form_version_id` points to `v1`.
3.  **UI**: Loads `v1` Schema. Renders form *without* "Email Address" field (correctly).
