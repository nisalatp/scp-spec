# Workflows: Integrations Layer

## Workflow: Outbound Payment
1.  **Caller**: Payment Service.
2.  **Action**: `Gateway.send(PaymentInstruction)`.
3.  **Gateway**:
    - Checks `Consent`.
    - Sanitizes Payload (Removes generic fields).
    - Transforms to `XML`.
    - Signs with mTLS Key.
    - POSTs to Bank.
4.  **Result**: Returns `BankReferenceID`.

## Workflow: Inbound Webhook
1.  **Actor**: Bank.
2.  **Action**: POSTs to `/hooks/bank-lanka`.
3.  **Gateway**:
    - Verifies Signature (HMAC).
    - Rate Limits.
    - Queues Payload.
4.  **Async Worker**: Processes the queue -> Updates Payment Status.
