# Scope & Governance: Data Collection

## Scope Rules

### 1. Geo Scope
- Agents can ONLY sync data for their assigned Geo Node.
- "Roaming" agents need multiple geo assignments or a parent node assignment.

### 2. Time Scope
- `VisitDate` must be reasonable (not in future).
- Agents have `Active From/Until`.

## Governance Examples
1.  **Allowed**: Agent A (Galle) submits visit for House H (Galle).
2.  **Denied**: Agent A (Galle) submits visit for House J (Colombo). (Geo Mismatch).
3.  **Allowed**: Agent A records offline data at 10 AM, syncs at 5 PM.
4.  **Denied**: Agent A modifies a `Submitted` visit (Must request Case Worker to reject it first).

## Governance Logic
- **Volunteer vs Employee**: Volunteers might have fewer permissions (e.g., cannot view Case History, only enter new data).
