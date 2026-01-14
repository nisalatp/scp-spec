# Workflows: Marketplace Access

## Workflow: Partner Onboarding
1.  **NGO**: Registers on Partner Portal.
2.  **NGO**: Fills "Access Request Form" (Selects "Nutrition Program", Purpose: "Audit").
3.  **System**: Validates form. Sets status `Pending-Approval`.
4.  **Umbrella Admin**: Receives notification. Reviews Request.
5.  **Umbrella Admin**: Clicks "Approve". Sets Expiry (e.g., 6 months).
6.  **System**:
    - Creates `AccessGrant`.
    - Provisions Credentials (Client ID/Secret).
    - Emails Credentials to NGO (securely).
7.  **NGO**: Uses Credentials to call APIs.

## Workflow: Renewal
1.  **System**: 30 days before expiry, emails NGO: "Renew?".
2.  **NGO**: Clicks "Extend".
3.  **Workflow**: Repeats Approval Steps.
