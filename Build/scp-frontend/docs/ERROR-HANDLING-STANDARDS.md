# Frontend Error Handling Standards

All frontend modules MUST follow these error handling patterns to ensure a consistent and secure user experience.

## Global Error Handler
- All unhandled exceptions MUST be caught by a root-level error boundary.
- All fatal errors MUST be logged to the `/audit/logs` endpoint via the client-side audit service.

## API Response Interception
- **401 (Unauthorized)**: Trigger immediate session clear and redirect to Login with a "Session Expired" alert.
- **403 (Forbidden)**: Display a standard "Insufficient Permissions" overlay. Trace IDs MUST be visible to the user for support reference.
- **404 (Not Found)**: Standard "The requested resource could not be found."

## Human-Readable Messages
Use the [Contracts/Error-Codes](file:///C:/Users/NisalaBandara/Projects/scp-spec/contracts/error-codes.md) to map backend codes to UI text.
- Example: `ERR_CORE_CONSENT_MISSING` -> "You must capture citizen consent before updating this profile."

## Field Validation
- Prefer real-time (on-blur) validation for standard fields.
- Form-level "Submit" MUST be disabled until all required fields satisfy the rules defined in [Form Scripting](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/System/Form-Scripting/README.md).
