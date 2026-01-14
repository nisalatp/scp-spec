# Boundaries: Form Scripting

## Ownership
- **Owns**: The definition of the `FormScript` file format (Schema).
- **Owns**: The logic for "Is this a new version?".

## Never Owns
- **The Live Schema**: Form Scripting *produces* Form Versions, but Form Builder *owns* them at runtime.

## Integration Boundaries
- **Inbound**:
    - **CI/CD Pipeline**: Calls the Import API.
- **Outbound**:
    - **Form Builder API**: To save the parsed schema.
