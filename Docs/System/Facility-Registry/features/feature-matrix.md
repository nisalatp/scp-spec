# Feature Matrix: Facilities

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Register Facility** | Create Location | Tenant Admin | `facility.create` | UC-01 | Lat/Lon mandatory |
| **Approve Facility** | Activate | Umbrella Auth | `facility.approve` | UC-01 | |
| **Manage Services** | Tag Capabilities | Vertical Owner | `facility.update` | - | e.g. "ICU" |
