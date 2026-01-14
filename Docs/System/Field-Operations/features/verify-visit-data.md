# Verify Visit Data

## Description
Quality Assurance step where a supervisor reviews submitted data before it commits to the Master Registry.

## Component
Data Collection (Field Ops)

## Actors / Roles
- **Case Worker**
- **Field Manager**

## Permissions
- `visit.verify`

## Scope Rules
- **Geo Scope**.

## Preconditions
- Visit Status = `Submitted`.

## Main Flow
1.  **Actor**: Views "Pending Verification" Queue.
2.  **Actor**: Opens Visit #123.
3.  **Actor**: Reviews Data vs Photos.
4.  **Action**: Clicks "Approve".
5.  **System**:
    - Sets `status = Verified`.
    - Triggers "Commit" (Identity/Case updates are applied).

## Alternate / Error Flows
- **Reject**: Sends back to Agent for "Rework" or marks "Invalid".

## Data Read / Written
- **Visit**: Update Status.

## Audit & Compliance
- **Audit**: Verifier ID is stamped on the record.

## Related Use Cases
- UC-04: Household Registration

## References
- `SPEC/03-domain/08-agent-field-ops-model.md`
