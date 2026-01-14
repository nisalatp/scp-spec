# Workflows: Audit Logging

## Workflow: Ingestion
1.  **Actor**: Case Service.
2.  **Action**: User creates Case.
3.  **Process**: Service emits `case.created`.
4.  **Audit**: Queues event -> Writes to DB -> Writes to Archive.

## Workflow: Investigation
1.  **Actor**: Auditor.
2.  **Trigger**: Suspicious Activity Alert.
3.  **Action**: Query `actor_id = suspected_user`.
4.  **Result**: Timeline of actions.
