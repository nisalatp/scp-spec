# Lapse: Complex Conditional Logic [RESOLVED]

**Missing Capability**: Advanced logical operators (OR, nested AND/OR) and Cross-Field dependencies in Form Schema.

## Evidence
*   **Use Cases**: UC-02 (Medical logic), UC-07 (Financial Eligibility).
*   **Spec Gap**: `SPEC/06-platform-core` mentions "Conditional fields" but does not define a standard Expression Language (like JSONLogic).

## Impact
*   **Severity**: Medium.
*   **Workaround**: Hard-coded logic in the Mobile App (Violates "Metadata-Driven" principle).

## Proposed Changes
1.  Adopt **JSONLogic** standard for the `conditions` field in Form Schema.
2.  Update Renderer and Backend Validator to execute JSONLogic.
