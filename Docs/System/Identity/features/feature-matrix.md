# Feature Matrix: Identity (Person & Household)

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Register Person** | Create Identity | Field Agent, Case Worker | `person.create` | UC-05, UC-101 | Offline capable |
| **Verify Identity** | Approve Provisional | Case Worker, Manager | `person.verify` | UC-05, UC-101 | |
| **Update Profile** | Edit Demographics | Case Worker | `person.update` | UC-12 | Versioned history |
| **Search Person** | Find Record | All Authorized | `person.search` | UC-01, UC-05 | Scoped by Geo |
| **Register Household** | Create Group | Field Agent | `household.create` | UC-05 | GPS Required |
| **Manage Membership** | Add/Remove | Agent, Case Worker | `household.update` | UC-05 | Relationship |
| **Manage Annexures** | Split House | Admin | `household.split` | - | 53 -> 53A |
| **Archive/Restore** | Soft Delete | Case Worker (Archive), Admin (Restore) | `person.archive` | UC-90 | |
