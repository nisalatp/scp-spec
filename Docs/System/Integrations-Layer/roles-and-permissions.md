# Roles & Permissions: Integrations Layer

## Participating Roles
- **Umbrella Authority**: Approves new integrations (Cross-Tenant risk).
- **Platform Admin**: Configures the connection (URLs, Secrets).
- **External Partner**: The machine actor calling into SCP (Webhooks).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `approve` | `integration` | Global/Tenant | Umbrella Authority | Platform Admin | Governance check |
| `configure` | `connection` | Tenant | Platform Admin | - | Technical setup |
| `invoke` | `adapter` | Vertical | **Service Accounts** | Users | Users don't talk to banks directly |

## Consent Interactions
- **Enforcement Point**: The Integration Gateway calls `Consent.Check()` for every outgoing PII payload.
- **Failure**: If consent is missing, the Gateway returns `403 Forbidden` to the internal caller.

## Deny Wins
- If an Integration is "Suspended" by Admin, all traffic stops immediately, even if Consent exists.
