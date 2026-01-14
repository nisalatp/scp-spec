# Geo-Fenced Vertical Deployment

## Strategy: Hybrid Multi-Tenancy
The SCP supports dynamic verticals (WASH, Housing) that may have strict "Data Residency" requirements.

### Standard Verticals (Shared)
*   Health, Edu, Econ run as "Global Services".
*   Data is logically partitioned by TenantID but physically shared (Shared Database, Separate Schema).

### Geo-Verticals (Isolated)
*   **Option A: Shared Cluster (Soft Isolation)**
    *   Deploy Custom Vertical as a Namespace in the main Cluster.
    *   Use Policy Engine for logical isolation.
    *   *Best for*: Generic extensions (e.g., "Park Maintenance").

*   **Option B: Regional Cluster (Hard Isolation)**
    *   Deploy Custom Vertical binaries to a physically separate K8s cluster in a specific region.
    *   Connect via API Gateway / VPN.
    *   *Best for*: Regulated verticals (e.g., "National Defense Support", "Local Election Mgmt").

## Deployment Workflow for Geo-Verticals
1.  **Define**: Admin defines Schema (JSON) + Logic (Lua/JS).
2.  **Package**: CI Pipeline builds a Docker Image with the "Universal Vertical Runtime" + Config.
3.  **Deploy**: Helm Chart deploys to target Region/Namespace.
4.  **Register**: Update Service Registry for Service Discovery.
