# Workflows: Case Management

## Workflow: Standard Approval
1.  **Actor**: Case Worker.
2.  **Action**: Submits Case.
3.  **State**: `Pending_Review`.
4.  **Actor**: Supervisor.
5.  **Action**: "Approve".
6.  **State**: `Active`.
7.  **System**: Triggers "Enrollment" in Program.

## Workflow: Rejection (Negative Flow)
1.  **Action**: Supervisor "Reject".
2.  **Input**: "Proof of Income missing".
3.  **State**: `Returned_to_Draft`.
4.  **Actor**: Case Worker fixes and Re-submits.
