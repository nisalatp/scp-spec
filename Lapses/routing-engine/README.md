# Lapse: Routing Engine [RESOLVED]

**Missing Capability**: Calculation of Travel Time / Distance required for Access Analysis.

## Evidence
*   **Use Cases**: UC-40 (Health Access Gap).
*   **Spec Gap**: No "Routing" or "Navigation" service defined.

## Impact
*   **Severity**: **Medium**.
*   **Blocker**: Cannot calculate "Time to Clinic" dynamically.

## Proposed Changes
1.  **Integration**: Integrate OSRM or Google Maps API.
2.  **Service**: `RouteService` to batch calculate travel matrix.
