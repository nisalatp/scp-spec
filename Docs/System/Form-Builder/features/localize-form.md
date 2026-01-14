# Localize Form

## Description
Adding translations for labels, hints, and options. A single Form Definition supports multiple languages (en, si, ta) without duplicating logic.

## Component
Form Builder

## Actors / Roles
- **Program Manager**
- **Translator** (Delegated Role)

## Permissions
- `form.update.draft`

## Scope Rules
- **Tenant Scope**.

## Preconditions
- Form must include `label` keys.

## Main Flow
1.  **Actor**: Selects Form.
2.  **Actor**: Adds Language "Sinhala".
3.  **System**: Displays Table of all strings.
4.  **Actor**: Inputs translations.
5.  **Action**: Save.

## Data Read / Written
- **FormDefinition**: Update (Language Dictionary).

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/06-platform-core/06-form-builder.md`
