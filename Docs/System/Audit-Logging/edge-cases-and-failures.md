# Edge Cases & Failures: Audit Logging

## Edge Cases
1.  **High Volume**: Login Attack creates 1M logs/sec. (Throttle or Circuit Break non-critical logs, but PRIORITIZE Security logs).
2.  **Clock Skew**: Events arrive out of order. (Trust `server_timestamp` for ordering, `client_timestamp` for context).

## Failure Handling
- **Audit Down**: If Audit Service is unreachable, Security-Critical actions (Auth, Pay) MUST Fail. Operational actions (View) MAY degrade gracefully (buffer locally).
