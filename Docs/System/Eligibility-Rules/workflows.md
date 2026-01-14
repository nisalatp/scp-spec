# Workflows: Eligibility Rules Engine

## Workflow: Policy Change
1.  **Actor**: Policy Officer.
2.  **Action**: Clones `v1` to `v2`.
3.  **Edit**: Updates `Max_Income` threshold.
4.  **Simulate**: Runs against sample dataset.
5.  **Review**: "Impacts 500 extra families".
6.  **Approve**: Director signs off.
7.  **Activate**: `v2` becomes live.

## Workflow: Evaluation (Runtime)
1.  **Trigger**: Case Submission.
2.  **Action**: `CheckEligibility(Person, Program)`.
3.  **Result**: `Pass` / `Fail`.
4.  **Logging**: "Failed Rule 3: Age > 60".
