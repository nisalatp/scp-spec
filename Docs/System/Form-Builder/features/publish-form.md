# Publish Form (Activate)

## Description
Promoting a Draft form to "Active" status, making it available for Field Agents to sync. This creates an immutable Version Snapshot.

## Component
Form Builder

## Actors / Roles
- **Umbrella Authority** (Approver)
- **Program Manager** (Requestor)

## Permissions
- `form.publish`
- `form.approve`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Form in `Draft` or `Reviewed` state.

## Main Flow
1.  **Actor**: Reviews Form Logic.
2.  **Action**: Clicks "Publish".
3.  **System**:
    - Assigns Version Number (v1).
    - Sets `status = Active`.
    - Updates `Latest` pointer.
    - Emits `FormPublished` event.
4.  **Mobile Apps**: Receive push notification to "Sync Forms".

## Alternate / Error Flows
- **Existing Active Version**: System deprecates v1? Or allows multiple versions? (Policy: Usually deprecated, but v1 remains for old records).

## Data Read / Written
- **FormVersion**: Write (Immutable).

## Audit & Compliance
- **Locking**: Once published, NOT A SINGLE CHARACTER can change. Typo fix = v2.

## Related Use Cases
- UC-40: New Program Launch

## References
- `SPEC/06-platform-core/06-form-builder.md`
