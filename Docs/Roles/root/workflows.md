# Workflows: ROOT

## Use Cases
*   **Emergency Fix**: A bug caused 1000 records to have the wrong status. Normal admins cannot bulk-edit "Verified" records. ROOT scripts the fix.

## Scenario: Break Glass

1.  **Trigger**: Production DB Corruption.
2.  **Auth**: Log in via Google OAuth (MFA).
3.  **Action**: Direct API call to `POST /admin/root/fix-data`.
4.  **Audit**: "ROOT executed fix-data on Tenant X".
