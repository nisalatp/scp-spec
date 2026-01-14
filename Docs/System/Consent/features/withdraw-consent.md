# Withdraw Consent

## Description
A beneficiary revoking their permission. This must be actioned immediately (within 24h sync) and stops all further processing, including aggregation.

## Component
Consent Management

## Actors / Roles
- **Case Worker** (on behalf of Beneficiary)
- **Field Agent**

## Permissions
- `consent.withdraw`

## Scope Rules
- **Vertical Scope**.

## Main Flow
1.  **Actor**: Selects "Withdraw Consent".
2.  **Actor**: Enters Reason Code (e.g., `USER_REQUEST`).
3.  **System**:
    - Creates Shutdown Job.
    - Sets `Active Until = NOW`.
    - Sets `Status = Withdrawn`.
    - Flushes Access Caches.

## Alternate / Error Flows
- **Dependencies**: Changing Consent may suspend active Cases (e.g., Cannot receive benefits if you withdraw consent). System helps user understand impact.

## Data Read / Written
- **ConsentRecord**: Update.

## Audit & Compliance
- **Stop Processing**: Any access after Withdrawal is a Compliance Violation.

## Related Use Cases
- UC-99: Data Privacy Request

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
