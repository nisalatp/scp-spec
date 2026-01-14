# Form Builder: Frontend Integration

## Overview
The Frontend includes a **Runtime Form Renderer** that interprets the JSON definitions created by the Form Builder.

## Components
1.  **Form List**: Shows available forms based on User Role and Scope.
2.  **Renderer**: A dynamic component `<DynamicForm schema={json} />`.
    *   Supports: Text, Date, GPS, Camera, Repeatable Groups.
    *   Validation: Client-side execution of regex and required checks.
3.  **Admin Import UI**: Drag-and-drop `.forms.yaml` files to update Form Registry.
4.  **Offline Manager**: Caches Form Definitions (`/api/forms`) and queues Submissions (`/api/submissions`).

## UX Patterns
*   **Wizards**: Large forms (FB-001) are split into steps (Sections).
*   **Conditional**: Fields hide/show based on `conditions` array in JSON.
*   **GPS**: Auto-captures High-Accuracy coordinates.
