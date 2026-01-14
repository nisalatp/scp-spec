# Edge Cases & Failures: Integrations Layer

## Edge Cases
1.  **Schema Drift**: Partner changes API without notice. (Adapter breaks, must alert Admin).
2.  **Zombie Token**: Partner Token expires mid-transaction. (Gateway must auto-refresh and retry).
3.  **Huge Payload**: Partner sends 5GB XML. (Reject at Ingress, require streaming/chunking).
4.  **Slow Partner**: Bank takes 60s to respond. (Circuit Breaker trips to prevent thread pool exhaustion).

## Failure Handling
- **Circuit Breaker**: If 50% errors in 1min, Open Circuit (Fail Fast) for 5min.
- **Dead Letter Queue**: Creating tickets for manual review of failed Webhooks.
