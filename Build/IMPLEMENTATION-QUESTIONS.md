# Implementation Questions & Decisions Register

This document tracks open architectural or business decisions that are required to proceed with implementation.

## Active Questions

| ID | Category | Question | Status | Decision / Response |
| :--- | :--- | :--- | :--- | :--- |
| **Q-001** | **Identity** | Should biometric templates be stored as raw images or specialized hashes? | 🟢 Open | TBD - Pending Security Review. |
| **Q-002** | **Finance** | Does the platform support partial disbursements if a budget is overdrawn? | 🟢 Open | TBD - Finance Policy input needed. |
| **Q-003** | **Auth** | Is MFA mandatory for Field Agents or only for Backoffice users? | 🟢 Open | TBD - Usability vs Security assessment. |
| **Q-004** | **Data** | What is the PII retention policy for person records after 7 years of inactivity? | 🟢 Open | TBD - Legal Compliance input needed. |

## Guidance
- Questions should be raised during sprint planning or design reviews.
- Once decided, the "Decision" column MUST be updated and the status changed to `Resolved`.
- Resolved decisions MUST be reflected in the relevant `scp-backend/docs` or `scp-frontend/docs`.
