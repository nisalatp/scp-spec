# Edge Cases & Failures: Configuration Management

## Edge Cases
1.  **Bad Config**: Admin sets `timeout = -1`.
    - *Prevention*: Schema Validation (JSON Schema) for config values before save.
2.  **Circular Dependency**: Service A waits for Config; Config Service waits for Service A.
    - *Prevention*: Config Service must have zero external dependencies (bootstrapped from Env Vars/File).

## Failure Handling
- **Config Service Down**:
    - *Mitigation*: Clients use Local Cache (last known good config) covering 99% of uptime.
