# Define Form (Draft)

## Description
Creating the schema for data collection. This includes defining Fields (Type, Label), Validation Rules (Regex, Min/Max), and Logic (Skip Logic, Show If).

## Component
Form Builder

## Actors / Roles
- **Program Manager** (Designer)
- **Tenant Admin**

## Permissions
- `form.create`
- `form.update.draft`

## Scope Rules
- **Vertical Scope**: Forms are usually bound to a Vertical (e.g., "Health Intake").
- **Tenant Scope**: Strict.

## Preconditions
- Tenant Active.
- Vertical Active.

## Main Flow
1.  **Actor**: Creates New Form "Household Survey 2024".
2.  **Actor**: Drag & Drops "Text Field" (Name).
3.  **Actor**: Adds "Date" (DOB).
4.  **Actor**: Adds "Repeat Group" (Children).
5.  **Actions**: Clicks "Save Draft".
6.  **System**:
    - Validates JSON Schema.
    - Saves `FormDefinition` (Version: Draft).

## Alternate / Error Flows
- **Invalid Logic**: Circular dependency in `showIf` -> Validation Error.

## Data Read / Written
- **FormDefinition**: Write.

## Audit & Compliance
- **PII Tagging**: Designer MUST tag sensitive fields (e.g., NIC) during definition.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/06-platform-core/06-form-builder.md`
