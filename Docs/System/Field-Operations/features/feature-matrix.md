# Feature Matrix: Data Collection

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Manage Agent** | Onboard Field Staff | Tenant Admin | `agent.create` | UC-04 | |
| **Execute Visit** | Capture Field Data | Field Agent | `visit.create` | UC-04, UC-09 | Offline First |
| **Verify Visit** | Approve Data | Case Worker | `visit.verify` | UC-04 | QA Step |
| **Offline Sync** | Transport Data | Field Agent | `field.sync` | - | Secure Sync |
