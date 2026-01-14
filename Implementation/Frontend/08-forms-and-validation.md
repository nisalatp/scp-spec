# 08 Forms and Validation

This section covers dynamic forms and validation rules.

## 1. Dynamic Forms

SCP forms are metadata driven.

- Load form definitions from the API.
- Render fields based on metadata.
- Support repeatable sections.
- Support conditional fields.

## 2. Validation

- Validate required fields before submit.
- Apply data type validation (number, date, string).
- Use server errors to show final validation failures.

## 3. Versioning

- Submissions must reference a specific form version.
- Edits create new submission versions.
- Verification status resets on new versions.

## 4. Consent Links

If a form requires consent:

- Check consent status before submission.
- If consent is missing, show the consent capture flow.

## Checklist

- Forms render dynamically
- Validation works on client and server
- Version changes trigger fresh verification
