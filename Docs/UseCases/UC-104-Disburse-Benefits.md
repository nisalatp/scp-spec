# UC-104: Disburse Benefits

## Goal
To automate the calculation of individual payments for all eligible beneficiaries across active programs and coordinate the secure transfer of funds (or digital value) via external payment providers, ensuring 100% financial accountability and reconciliation.

## Actors
*   **System (Scheduler)**: Initiates the payroll cycle based on pre-configured frequencies.
*   **Finance Manager**: Authorizes the payment batches and verifies liquidity.
*   **Payment Provider**: External financial institutions (Banks, Mobile Money Operators) that execute the final transfer.
*   **Auditor**: Reviews reconciliation reports for compliance.

## Preconditions
*   Programs are `ACTIVE` and have enrolled beneficiaries with validated payment identifiers.
*   The `Eligibility Rules` component has confirmed all conditional milestones (e.g., school attendance) for the period.
*   The system has sufficient "Cash-on-Hand" balance recorded in the `Finance` component.

## Main Flow
1.  **Cycle Trigger**: The system scheduler initiates the period-end payroll run for all active programs.
2.  **Entitlement Calculation**: The `Eligibility Rules` engine iterates through the beneficiary population, calculating the exact payout for each based on base rates, bonuses, and penalties.
3.  **Instruction Batching**: The `Finance` component groups individual instructions into a "Payment Batch" and performs a sanity check against budget limits and account balances.
4.  **Batch Authorization**: The Finance Manager reviews the batch summary and authorizes the disbursement using a multi-factor approval or digital signature.
5.  **Transmission**: The `Integrations` layer transforms the batch into a provider-compatible format (e.g., ISO 20022, MT103, or CSV) and transmits it to the Payment Provider via a secure channel (API/SFTP).
6.  **Reconciliation**: Once the provider returns a "Status Report", the system automatically matches each instruction to a success/failure status, updating the internal ledger and triggering alerts for any failures.

## Alternate Paths
*   **SEC-01: Unauthorized Batch Mod**: System blocks activation if the Batch contents were tampered with (detected by checksum mismatch) after manager approval.
*   **FIN-01: Insufficient Funding**: System halts the disbursement if the total batch value exceeds the pre-funded balance in the operational account.
*   **INT-01: Provider Timeout**: If the provider does not return a status report within the SLA, the system flags the batch as `UNCERTAIN` and prevents duplicate transmission.

## Component Interactions
*   **Finance**: Core ledger management and pre-disbursement controls.
*   **Eligibility Rules**: The "Brain" behind the payout calculation logic.
*   **Integrations Layer**: The gateway to external financial systems and protocols.
*   **Security & Access Control**: Protects financial credentials and enforces dual-control (maker-checker).
*   **Audit Logging**: Captures every step of the financial lifecycle for regulatory compliance.

## Data Touched
*   `Obligation`: Recurring commitment link.
*   `Disbursement`: The specific transaction record.
*   `PaymentInstruction`: The batch entity.
*   `Person`: Link to payment identifiers (Account numbers, Phone numbers).

## Audit & Compliance
*   Separation of Duties (SoD) is strictly enforced between Program Managers and Finance Managers.
*   The system generates an end-to-end "Reconciliation Statement" confirming that the bank's successful payments match the system's intended disbursement.
*   All PII in payment files is encrypted at rest and in transit.
