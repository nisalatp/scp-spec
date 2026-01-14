# Feature Matrix: Audit Logging

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Capture Event** | Log Action | System | `audit.write` | All | Automated |
| **Search Logs** | Investigate | Security Officer | `audit.view` | UC-99 | Read-only |
| **Configure Retention** | Set Lifecycle | Compliance | `audit.manage` | UC-01 | Legal Requirement |
