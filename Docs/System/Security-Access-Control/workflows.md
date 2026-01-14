# Workflows: Security & Access Control

## Workflow: Evaluation (The "Check")
1.  **Request**: Inbound `GET /case/123`.
2.  **Context**: Extracted from JWT (`User=A`, `Role=HealthOfficer`, `Geo=Galle`).
3.  **Resource**: Database lookup `Case 123` -> (`Vertical=Health`, `Geo=Galle`).
4.  **Check 1**: Tenant Match? Yes.
5.  **Check 2**: ROOT? No.
6.  **Check 3**: Consent? Call Consent Manager -> "Active".
7.  **Check 4**: Scope? `User.Geo` covers `Case.Geo`? Yes.
8.  **Check 5**: Deny Rules? None.
9.  **Check 6**: Permission? `case.view` in Role? Yes.
10. **Result**: ALLOW.

## Workflow: Deny Wins
1.  **User**: Has `HealthOfficer` (Allow `case.view`) AND `SuspendedUser` group (Deny `case.view`).
2.  **Check 5**: Deny Rule found for `case.view`.
3.  **Result**: DENY.
