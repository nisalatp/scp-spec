# Boundaries: Form Builder

## Ownership
- **Owns**: The *structure* of data (Schema).
- **Owns**: The validation *rules* (e.g., "Age must be > 18").

## Never Owns
- **The Data Value**: "Age=25" is stored in the `Person` record, not the Form definition.

## Integration Boundaries
- **Inbound**:
    - **FormScripting**: Pushes YAML definitions into the Builder's database.
    - **Admin UI**: Visual editor interacts with Builder API.
- **Outbound**:
    - **Mobile App**: Pulls JSON Schema for rendering.
