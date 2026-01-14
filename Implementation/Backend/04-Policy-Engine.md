# Policy Engine & Access Control

## Scoping Model
Access is granted based on the intersection of 3 scopes:
1.  **Tenant Scope**: e.g., "Country A", "Region B".
2.  **Vertical Scope**: e.g., "Health Access", "Finance Approver".
3.  **Geo Scope**: Lat/Lon bounding box or Admin District.

## Policy Rules (Attribute-Based Access Control - ABAC)
*   **Deny-By-Default**: All access must be explicitly granted.
*   **Consent_Required**: Data access checks for explicit `ConsentRecord` (GDPR/DPDPA compliant).
    *   Example: UC-01 (Blood Match) overrides consent via `Emergency_Protocol`.

## Dynamic Policies for Geo-Verticals
*   Custom Verticals can define specific visibility rules.
    *   Example: "WASH data is public" vs "Shelter data is restricted".

## Implementation
*   **Middleware**: `PolicyEnforcementPoint` (PEP) intercepts all API calls.
*   **Service**: `PolicyDecisionPoint` (PDP) evaluates rules against the `PolicyStore`.
