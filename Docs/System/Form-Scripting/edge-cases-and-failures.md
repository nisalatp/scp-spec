# Edge Cases & Failures: Form Scripting

## Edge Cases
1.  **Large File**: 50MB YAML. (Stream processing required or split packaging).
2.  **Partial Failure**: Form A ok, Form B fails. (Transaction rollback required. "All or Nothing").
3.  **Unknown Field Type**: Script uses `type: hologram`. (Validation Error).
4.  **Circular Dependency**: Form A references Form B (lookup), B references A. (Two-pass import needed).

## Failure Handling
- **Parse Error**: Return line number and error message closest to YAML source.
