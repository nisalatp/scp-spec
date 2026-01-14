# Lapse: Geo-Vertical Extensibility [RESOLVED]

**Missing Capability**: Dynamic runtime definition of new Vertical Logic/Schema without code deploys.

## Evidence
*   **Use Cases**: UC-09 (WASH), UC-11 (Housing), UC-21 (Gov).
*   **Spec Gap**: `SPEC/07-verticals` defines 5 fixed verticals. No detailed mechanism for "Plugging in" a new vertical like "WASH" dynamically.

## Impact
*   **Severity**: **High**.
*   **Blocker**: Tenants cannot extend the system for local nuances without creating a "monolithic fork".

## Proposed Changes
1.  **Meta-Schema**: JSON-Schema based definition for Entities.
2.  **Auto-CRUD**: API Gateway automatically routes `/api/geo/{vertical_id}/*` to a generic handler backed by NoSQL.
