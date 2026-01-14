# Feature Matrix: Geo Engine

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Define Hierarchy** | Setup Province/District levels | Tenant Admin | `geo.hierarchy.manage` | UC-01 | |
| **Manage Nodes** | Add/Edit Villages | Geo Admin | `geo.node.update` | UC-01 | |
| **Resolve Location** | Lat/Lon to Village ID | System | `geo.view` | UC-05 | Core Logic |
| **Manage Metrics** | Risk Indices | Analyst, Geo Admin | `geo.metric.update` | UC-44 | |
| **Reorganize** | Split/Merge Districts | Geo Admin | `geo.reorg` | - | High Risk Ops |
