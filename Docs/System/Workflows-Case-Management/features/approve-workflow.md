# Approve Workflow (Decision)

## Description
The review process moving a Case from "Submitted" to "Active". This often involves a Supervisor checking the evidence against Eligibility Rules.

## Component
Workflows & Case Management

## Actors / Roles
- **Supervisor**
- **Case Manager**

## Permissions
- `case.approve` (or `workflow.approve`)

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Case in `Submitted` or `Verified` state.

## Main Flow
1.  **Actor**: Views "My Approval Queue".
2.  **Actor**: Opens Case. Reviews Evidence.
3.  **Action**: Click "Approve".
4.  **System**:
    - Validate Policies (e.g., Budget Check).
    - Sets `status = Active`.
    - Triggers "CaseActivated" Event (Notify Beneficiary).

## Alternate / Error Flows
- **Request Changes**: Sends back to Agent (Status = Draft).
- **Reject**: Case Closed (Status = Rejected).

## Data Read / Written
- **Case**: Update.
- **WorkflowInstance**: Update.

## Related Use Cases
- UC-41: Supervisor Review

## References
- `SPEC/03-domain/06-workflow-approval-model.md`
