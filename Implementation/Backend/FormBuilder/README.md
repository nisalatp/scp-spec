# Form Builder: Backend Integration

## Data Model
*   **FormMetadata**: Stores the JSON schema, version, and scope (Vertical/Geo).
*   **Submission**: Stores the data payload (JSONB) linked to a `FormVersionID`.

## API Endpoints
*   `GET /api/forms`: List active forms for the user's context.
*   `GET /api/forms/{id}/latest`: Get schema.
*   `POST /api/admin/forms/import`: **(New)** Import Form Script Package (`.forms.yaml`).
*   `POST /api/submissions`: Accept data.
    *   **Validation**: Server-side validation against the JSON Schema (Critical for security).
    *   **Hooks**: Triggers "Entity Mappers" to write data to Core Tables (e.g., `Household`).

## Policy & Scope
*   **Tenancy**: All forms are Tenant-Isolated.
*   **Geo-Fencing**: Forms can be assigned to a specific `PolygonID`. If a user is outside, they cannot submit (or it's flagged).
