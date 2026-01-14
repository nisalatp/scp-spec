# Roles & Permissions: Consent Management

## Participating Roles
- **Field Agent**: Capture (Create).
- **Case Worker**: Verify / View Evidence.
- **Beneficiary**: Grant / Withdraw (via Agent or Portal).
- **Privacy Officer**: Audit / Privacy Reporting.

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `capture` | `consent` | Geo-Scoped | Field Agent | - | With Evidence |
| `verify` | `consent` | Vertical | Case Worker | - | QA Step |
| `view` | `evidence` | Specific Permission | Case Worker (Senior) | Field Agent | Privacy of signature |
| `withdraw` | `consent` | Owner/Proxy | Case Worker | Field Agent | Offline withdrawal blocked |

## Consent Interactions
- **Self-Referential**: You don't need consent to view the Consent Record itself (metadata), but you need permission.

## Deny Wins
- If `ConsentStatus=Withdrawn`, NO ROLE (except ROOT) can view the protected data.
