# Workflows: Platform Admin

## Use Cases
*   **User Provisioning**: Creating accounts for new Vertical Owners or Field Agents.
*   **Role Management**: Creating a new "Junior Clerk" role request.

## Scenario: User Provisioning

1.  **Request**: HR sends request to onboard "Dr. Somapala" as a Health Officer.
2.  **Action**: Admin logs in, goes to User Management.
3.  **Create**: Enters email, name.
4.  **Assign**: Assigns `health-officer` role.
5.  **Scope**: Selects `Vertical=Health`.
6.  **Result**: User created; Invite email sent. Admin cannot see patients Dr. Somapala treats.
