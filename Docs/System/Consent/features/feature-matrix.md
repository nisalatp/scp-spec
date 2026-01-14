# Feature Matrix: Consent Management

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Capture Consent** | Record Permission | Field Agent, Case Worker | `consent.capture` | UC-05 | Requires Evidence |
| **Verify Consent** | Activate Record | Case Worker, Manager | `consent.verify` | UC-05 | |
| **Renew Consent** | Extend Validity | Case Worker | `consent.renew` | UC-12 | New Version |
| **Withdraw Consent** | Revoke Permission | Case Worker | `consent.withdraw` | UC-99 | Immediate Effect |
| **Emergency Access**| Override | ROOT | `consent.bypass` | UC-01 | Strict Audit |
