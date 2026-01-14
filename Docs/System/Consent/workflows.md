# Workflows: Consent Management

## Workflow: Offline Capture
1.  **Actor**: Field Agent.
2.  **Action**: App captures Signature on screen.
3.  **Sync**: Uploads `ConsentRecord` (`status=Pending`) and Image.
4.  **Verification**: Case Worker reviews image "Yes, that's Nimal".
5.  **Action**: Approve.
6.  **State**: `status=Active`.
7.  **Effect**: Health Worker can now open Nimal's file.

## Workflow: Expiry
1.  **Trigger**: Nightly Job checks `active_until < now`.
2.  **Action**: Update `status=Expired`, set `grace_until = now + 30d`.
3.  **Event**: Publish `ConsentExpired`.
4.  **Effect**: Ops Users: **Read Only**. Field Agents: **No Access**.
