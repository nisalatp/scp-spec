# SCP Finance System: Strategy & Operations

## 1. Executive Purpose
The **Finance System** in SCP is the platform's "Accountability Ledger." Its primary purpose is to track financial commitments, budget allocations, and beneficiary obligations. It ensures that every cent pledged or disbursed is tied to a specific policy, program, and verified beneficiary, preventing leakage and ensuring financial transparency across the development ecosystem.

## 2. Why is it Needed?
*   **Budget Integrity**: Prevents programs from "Over-Committing" funds. The system checks real-time availability before a new case is approved.
*   **Leakage Prevention**: By linking payments to verified **Identity** and **Consent** records, the system ensures that funds are only earmarked for legitimate subjects.
*   **Donor Confidence**: Provides an immutable record of "Pledge to Provision," allowing donors to see exactly how their capital is committed across different verticals.
*   **Auditability**: Maintains a cryptographically stable record of financial obligations that can be exported to external auditing or government accounting systems.

## 3. How it Operates (The Obligation Tracker)
The system operates as a **Shadow Ledger** that mirrors real-world financial movements.

### 3.1 Budget Allocation
1.  **Vertical Budgeting**: Vertical Owners define top-level budgets.
2.  **Program Commitment**: As programs launch, they "carve out" a portion of the vertical budget.
3.  **Real-time Vetting**: When a Case Worker moves a case to `ACTIVE`, the Finance system "commits" the estimated cost, reducing the available program balance immediately.

### 3.2 Beneficiary Obligations (Pledges)
The system tracks "Obligations"—which can be either incoming (Micro-loan repayments) or outgoing (Cash Transfers).
*   **Status Management**: Obligations move from `PLANNED` -> `COMMITTED` -> `DISBURSED` (once confirmed by an external gateway).
*   **Immutability**: Once a financial record is committed, it cannot be "Deleted." Any corrections must be performed via an "Adjustment Record," preserving the full history of the error and correction.

## 4. Operational Guardrails

### 4.1 "Not a Processor" Boundary
To maintain security and simplicity, SCP is **NOT** a payment processor. It does not store credit card numbers or handle raw cash. It generates **Disbursement Files** (ISO 20022) which are then passed to an external **Payment Gateway**.

### 4.2 Consent Requirement
Finance data is considered high-sensitivity. No financial record can be created or viewed without a valid **Consent** record for the primary vertical, even if the person's identity is verified.

## 5. Audit & Transparency
*   **Immutable Transactional Log**: Every budget change and obligation update is recorded in a way that cannot be tampered with by tenant administrators.
*   **Aggregate Reporting**: While individual transactions are protected by consent, the system provides **Anonymized Aggregates** (e.g., "Total Spent on Education in Village X") for secondary governance and planning without exposing PII.
*   **Threshold Alerts**: The system automatically flags "High-Value" or "Outlier" transactions that exceed tenant-defined thresholds, requiring mandatory secondary sign-off from a **Vertical Owner**.
