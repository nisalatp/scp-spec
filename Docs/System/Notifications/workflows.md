# Workflows: Notifications & Email

## Workflow: Send Email
1.  **Caller**: Identity Service requests "Password Reset".
2.  **Service**:
    - Loads Template `password-reset` (Locale: `en`).
    - Hydrates: "Hello Nisala..."
    - Encrypts Credentials from Vault.
    - Connects SMTP.
    - Sends.
3.  **Result**: 200 OK.
4.  **Log**: "Sent to n***@gmail.com".

## Workflow: Bounce Handling (Negative Flow)
1.  **Scenario**: Email address invalid.
2.  **SMTP**: Returns 550 User Unknown.
3.  **Action**: Mark `status=Bounced`.
4.  **Feedack**: Update Person Record "Email Invalid" flag (Optional integration).
