# Scope Rules: ROOT

## Scope Enforcement Examples

*   **Tenant Mismatch**: Ignored. ROOT can write to Tenant B while authenticated in a context of Tenant A (though API design usually enforces explicit header).
*   **Bypass**: Scope checks return `True` immediately for ROOT.

## Deny Wins
*   **Exception**: ROOT Bypasses generic Deny rules.
