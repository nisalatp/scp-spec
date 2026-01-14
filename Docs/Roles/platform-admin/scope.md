# Scope Rules: Platform Admin

## Scope Enforcement Examples

*   **Tenant Mismatch**: A Platform Admin for Tenant A **cannot** access Tenant B configuration. API Gateway explicitly blocks this.
*   **Geo Enforcement**: Access is generally tenant-wide, but they cannot grant themselves "Geo-Specific" access to beneficiary data to bypass geo-fences.
*   **Vertical Enforcement**: Administrative actions do not have a vertical concept (they are cross-cutting), but specific vertical data (Cases) is out of scope.

## Deny Wins
*   If a Platform Admin is also assigned a "Restricted User" group which denies "User Creation", that Deny rule wins.
