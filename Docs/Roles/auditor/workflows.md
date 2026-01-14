# Workflows: System Auditor

## Use Cases
*   **Compliance Check**: Verifying that `User Creation` events are always followed by `Role Assignment`.

## Scenario: Security Audit

1.  **Trigger**: Report of suspicious activity.
2.  **Action**: Auditor logs in and queries Audit Logs for `action=case.view` by `user=suspect_id`.
3.  **Result**: List of 500 records accessed in 1 hour.
4.  **Action**: Auditor flags user for investigation.
